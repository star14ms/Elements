import os
import re
import argparse
import requests
import pandas as pd
from bs4 import BeautifulSoup

BASE_URL = "https://en.wikipedia.org"
INDEX_URL = f"{BASE_URL}/wiki/Lists_of_stars_by_constellation"


def build_constellation_index(index_url: str) -> dict[str, str]:
    resp = requests.get(index_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")

    mapping: dict[str, str] = {}
    for a in soup.select('#mw-content-text a[href^="/wiki/List_of_stars_in_"]'):
        name = a.get_text(strip=True)
        href = a.get("href")
        if name and href:
            mapping[name] = BASE_URL + href
    return mapping


def find_main_page_url(list_page_url: str) -> str | None:
    resp = requests.get(list_page_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")
    # Primary selector provided by user
    sel = '#mw-content-text > div.mw-content-ltr.mw-parser-output > p > a:nth-child(3)'
    a = soup.select_one(sel)
    if not a:
        # Fallback: first paragraph's first link
        p = soup.select_one('#mw-content-text > div.mw-content-ltr.mw-parser-output > p')
        if p:
            a = p.find_all('a', href=True)[-1]
    if a and a.get('href', '').startswith('/wiki/'):
        return BASE_URL + a['href']
    return None


def fetch_main_stars_count(main_page_url: str) -> int | None:
    if not main_page_url:
        return None
    resp = requests.get(main_page_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")
    infobox = soup.find("table", class_="infobox")
    if not infobox:
        return None
    for row in infobox.find_all("tr"):
        header = row.find("th")
        data = row.find("td")
        if not header or not data:
            continue
        label = header.get_text(strip=True)
        if "Main stars" in label:
            text = data.get_text(" ", strip=True)
            m = re.search(r"(\d+)", text)
            if m:
                try:
                    return int(m.group(1))
                except ValueError:
                    return None
    return None


def choose_top_n_by_apparent_mag(df: pd.DataFrame, n: int) -> list[int]:
    # Column name may be exactly 'vis. mag.'; provide a flexible fallback
    col = None
    if 'vis. mag.' in df.columns:
        col = 'vis. mag.'
    else:
        for c in df.columns:
            lc = c.lower()
            if 'vis' in lc and 'mag' in lc:
                col = c
                break
    if not col:
        # No magnitude column; select first n rows
        return list(range(min(n, len(df))))

    # Parse to floats; invalids become NaN
    mags = pd.to_numeric(df[col].astype(str).str.extract(r'([\-\d\.]+)')[0], errors='coerce')
    order = mags.sort_values(kind='mergesort').index.tolist()  # stable
    # Filter NaNs to the end
    order = [i for i in order if pd.notna(mags.loc[i])] + [i for i in order if pd.isna(mags.loc[i])]
    return order[:min(n, len(order))]


def process_constellation_folder(folder_path: str, list_index_map: dict[str, str], default_n: int) -> None:
    name = os.path.basename(folder_path)
    csv_path = os.path.join(folder_path, 'table.csv')
    if not os.path.exists(csv_path):
        return

    try:
        df = pd.read_csv(csv_path, dtype=str)
    except Exception:
        # Retry with default encoding handling
        df = pd.read_csv(csv_path)

    # Determine N: from main page's 'Main stars' if available; else default
    list_url = list_index_map.get(name)
    main_url = find_main_page_url(list_url) if list_url else None
    use_default_N = False
    n = fetch_main_stars_count(main_url)
    if n is None:
        print(main_url)
        use_default_N = True
        n = default_n

    # Compute indices for top-N brightest (smallest magnitude)
    top_idx = set(choose_top_n_by_apparent_mag(df, n))

    # Create/overwrite column
    in_lines = [(i in top_idx) for i in range(len(df))]
    df['In lines'] = in_lines

    # Save back
    df.to_csv(csv_path, index=False)
    print(f"Updated {name}: In lines set for top {len(top_idx)} of N={n} {'(Default Value Used)' if use_default_N else ''}")


def main():
    parser = argparse.ArgumentParser(description="Add 'In lines' column to constellation CSVs based on first N brightest stars.")
    parser.add_argument('--root', default=os.path.join('src', 'shared', 'constellations'), help='Root folder containing constellation subfolders with table.csv')
    parser.add_argument('--default-n', type=int, default=20, help='Fallback N if main page does not provide Main stars count')
    args = parser.parse_args()

    index_map = build_constellation_index(INDEX_URL)

    for entry in os.scandir(args.root):
        if entry.is_dir():
            process_constellation_folder(entry.path, index_map, args.default_n)

# python crawling/add_in_lines.py --root src/shared/constellation --default-n 20
if __name__ == '__main__':
    main()


