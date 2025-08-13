import os
import time
import requests
import pandas as pd
from bs4 import BeautifulSoup
from tqdm import tqdm
import concurrent.futures

from preprocess import normalize_value

BASE_URL = "https://en.wikipedia.org"

TARGET_PROPERTIES = [
    "Spectral type",
    "Temperature",
    "Mass",
    "Radius",
    "Luminosity",
    "Surface gravity",
    "Rotation",
    "Age"
]

GREEK_LETTERS = [
    "α", "β", "γ", "δ", 
    "ε", "ζ", "η", "θ", 
    "ι", "κ", "λ", "μ", 
    "ν", "ξ", "ο", "π", 
    "ρ", "σ", "ς", "τ", "υ", # σ = ς
    "φ", "χ", "ψ", "ω"
]


def get_constellation_links(index_url):
    resp = requests.get(index_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")
    links = []
    for ul in soup.select_one("#mw-content-text > div.mw-content-ltr.mw-parser-output table"):
        for li in ul.find_all("li"):
            a = li.find("a", href=True)
            if a and a['href'].startswith("/wiki/List_of_stars_in"):
                links.append((a.text.strip(), BASE_URL + a['href']))
    return links

def extract_star_properties(star_url, name, HD_catalogue):
    resp = requests.get(star_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text.replace('&nbsp;', ' '), "html.parser")
    info = {}
    target_properties_remained = TARGET_PROPERTIES.copy()
    
    infobox = soup.find("table", class_="infobox")
    if infobox is None:
        try:
            if "List_of_stars_in_" in star_url:
                new_star_url = BASE_URL + "/wiki/HD_" + HD_catalogue
                try:
                    return extract_star_properties(new_star_url, name, HD_catalogue)
                except:
                    print(name, star_url, HD_catalogue)
                    raise

            uls = soup.find("div", {"id": "mw-content-text"}).find_all("ul")

            for ul in uls:
                lis = ul.find_all("li")
                for li in lis:
                    a = li.find("a", href=True)
                    if a and a['href'].startswith("/wiki/"):
                        new_star_url = BASE_URL + a['href']
                    else:
                        print(name, star_url, HD_catalogue)
                        raise

                    if HD_catalogue in li.text:
                        print(name, star_url, new_star_url, HD_catalogue)
                        return extract_star_properties(new_star_url, name, HD_catalogue)

                    resp = requests.get(new_star_url)
                    resp.raise_for_status()
                    soup = BeautifulSoup(resp.text, "html.parser")
                    infobox = soup.find("table", class_="infobox")

                    if infobox is not None and str(HD_catalogue) in infobox.text:
                        print(name, star_url, new_star_url, HD_catalogue)
                        return extract_star_properties(new_star_url, name, HD_catalogue)
            else:
                new_star_url = BASE_URL + "/wiki/HD_" + HD_catalogue
                try:
                    return extract_star_properties(new_star_url, name, HD_catalogue)
                except:
                    print(name, star_url, HD_catalogue)
                    raise
        except Exception as e:
            pass

    if not infobox:
        return info
    
    for sup in infobox.find_all("sup", class_="reference"):
        sup.decompose()

    for row in infobox.find_all("tr"):
        tds = row.find_all("td")
        if len(tds) == 0:
            continue
        elif len(tds) == 1:
            th = row.find("th")
            if not (th and tds):
                continue
            header, data = th, tds[0] 
        else:
            header, data = tds[0], tds[1]

        if header and data:
            prop_name = header.get_text(strip=True).replace(chr(160), " ")
            for target in target_properties_remained:
                if target in prop_name:
                    raw_value = data.get_text(strip=True)
                    if not target == 'Spectral type':
                        text = normalize_value(raw_value)
                    else:
                        text = raw_value
                    info[target] = text
                    target_properties_remained.remove(target)
    return info

def fetch_star_props(args):
    i, (link, name, HD_catalogue) = args
    if not link:
        return i, {}
    props = extract_star_properties(link, name, HD_catalogue)
    time.sleep(0.5)  # keep polite delay per thread
    return i, props

def extract_tables_with_star_data(page_url):
    def contains_greek(text):
        return any(letter in text for letter in GREEK_LETTERS)

    resp = requests.get(page_url)
    resp.raise_for_status()
    # clean_text = re.sub(r"\[\d+\]", "", resp.text).strip()
    # soup = BeautifulSoup(clean_text, "html.parser")
    soup = BeautifulSoup(resp.text, "html.parser")
    
    tables = soup.find_all("table", {"class": "wikitable"})
    dataframes = []
    names = []
    HD_catalogues  = []

    for table in tables:
        for sup in table.find_all("sup", class_="reference"):
            sup.decompose()
        for sortbottom in table.find_all("tr", {"class": "sortbottom"}):
            sortbottom.decompose()

        # Get header order from first row
        header_cells = table.find("tbody").find_all("tr")[0].find_all(["th", "td"])
        header_map = {h.get_text(strip=True): idx for idx, h in enumerate(header_cells)}

        # Figure out column positions
        name_idx = header_map.get("Name")
        b_idx = header_map.get("B")
        hd_idx = header_map.get("HD")
        var_idx = header_map.get("Var")  # Add Var column index

        # Apply filter: keep rows where second col has value OR first col contains Greek letter OR has Var value
        df = pd.read_html(str(table))[0]
        df = df[
            (df.iloc[:, 1].notna() & (df.iloc[:, 1].astype(str).str.strip() != "")) |
            (df.iloc[:, 0].astype(str).apply(contains_greek)) |
            (var_idx and df.iloc[:, var_idx].notna() & (df.iloc[:, var_idx].astype(str).str.strip() != ""))
        ].reset_index(drop=True)

        tbody = table.find("tbody")
        for table_sub in tbody.find_all("table"):
            table_sub.decompose()

        star_links = []
        for row in tbody.find_all("tr")[1:]:
            cells = row.find_all(["td", "th"])
            if len(cells) >= 2:
                bayer_designation = cells[b_idx].get_text(strip=True)
                name = cells[name_idx].get_text(strip=True)
                var_value = var_idx and cells[var_idx].get_text(strip=True) if var_idx and len(cells) > var_idx else ""
                
                # Check if this row should be included
                should_include = False
                
                # Include if has Bayer designation
                if bayer_designation:
                    should_include = True
                
                # Include if name contains Greek letter
                if not should_include:
                    for greek_letter in GREEK_LETTERS:
                        if greek_letter in name:
                            should_include = True
                            break
                
                # Include if has Var value
                if not should_include and var_value and var_value != "":
                    should_include = True

                if should_include:  # process if any criteria met
                    names.append(name)
                    HD_catalogues.append(cells[hd_idx].get_text(strip=True))
                    a = cells[name_idx].find("a", href=True)
                    if a and a['href'].startswith("/wiki/"):
                        star_links.append(BASE_URL + a['href'])
                    else:
                        star_links.append(None)
                # Add extra columns for star properties
                for target in TARGET_PROPERTIES:
                    df[target] = None

        with concurrent.futures.ThreadPoolExecutor(max_workers=6) as executor:
            # Map indices and links to fetch_star_props
            results = list(executor.map(fetch_star_props, enumerate(zip(star_links, names, HD_catalogues))))

        # Assign results back to DataFrame
        for i, props in results:
            for target in TARGET_PROPERTIES:
                df.at[i, target] = props.get(target)
        
        dataframes.append(df)
        break

    return dataframes

def crawl_and_save(index_url, output_folder="data/constellations"):
    os.makedirs(output_folder, exist_ok=True)
    constellations = get_constellation_links(index_url)

    for name, url in tqdm(constellations, total=len(constellations)):
        print(f"\nProcessing {name} -> {url}")
        safe_name = name.replace("/", "-").replace("\\", "-")
        folder_path = os.path.join(output_folder, safe_name)
        os.makedirs(folder_path, exist_ok=True)

        tables = extract_tables_with_star_data(url)
        for i, df in enumerate(tables, start=1):
            file_path = os.path.join(folder_path, f"table.csv")
            df.to_csv(file_path, index=False)
            print(f"  Saved: {file_path}")

        time.sleep(1)  # polite delay


if __name__ == "__main__":
    INDEX_URL = "https://en.wikipedia.org/wiki/Lists_of_stars_by_constellation"
    crawl_and_save(INDEX_URL)
