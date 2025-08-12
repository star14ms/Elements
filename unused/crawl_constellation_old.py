import os
import time
import requests
from bs4 import BeautifulSoup
import pandas as pd

BASE_URL = "https://en.wikipedia.org"

def get_constellation_links(index_url):
    resp = requests.get(index_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")
    links = []
    for ul in soup.select("#mw-content-text > div.mw-content-ltr.mw-parser-output > div:nth-child(8) > table"):
        for li in ul.find_all("li"):
            a = li.find("a", href=True)
            if a and a['href'].startswith("/wiki/List_of_stars_in"):
                links.append((a.text.strip(), BASE_URL + a['href']))
    return links

def extract_tables(page_url):
    resp = requests.get(page_url)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")
    tables = soup.find_all("table", {"class": "wikitable"})
    dataframes = []
    for table in tables:
        df = pd.read_html(str(table))[0]
        dataframes.append(df)
    return dataframes

def crawl_and_save(index_url, output_folder="constellations"):
    os.makedirs(output_folder, exist_ok=True)
    constellations = get_constellation_links(index_url)

    for name, url in constellations:
        print(f"Processing {name} -> {url}")
        safe_name = name.replace("/", "-").replace("\\", "-")
        folder_path = os.path.join(output_folder, safe_name)
        os.makedirs(folder_path, exist_ok=True)

        tables = extract_tables(url)
        for i, df in enumerate(tables, start=1):
            file_path = os.path.join(folder_path, f"table_{i}.csv")
            df.to_csv(file_path, index=False)
            print(f"  Saved: {file_path}")

        time.sleep(1)  # be polite

if __name__ == "__main__":
    INDEX_URL = "https://en.wikipedia.org/wiki/Lists_of_stars_by_constellation"
    crawl_and_save(INDEX_URL)
