import os
import re
import shutil
from pathlib import Path


base_folder = "src\shared\constellations_with_props"

for root, _, files in os.walk(base_folder):
    for filename in files:
        # Generate Luau ModuleScripts that return a table containing the CSV string
        if filename.endswith(".csv"):
            name_without_extension = Path(filename).stem
            csv_path = os.path.join(root, filename)
            luau_path = os.path.join(root, f"{name_without_extension}.luau")

            with open(csv_path, "r", encoding="utf-8") as csv_file:
                csv_text = csv_file.read()

            if not csv_text.endswith("\n"):
                csv_text += "\n"

            # Choose a safe long-string delimiter
            if "]]" in csv_text:
                open_delim, close_delim = "[=[", "]=]"
            else:
                open_delim, close_delim = "[[", "]]"

            luau_content = (
                "local M = {}\n"
                f"M.csv = {open_delim}\n{csv_text}{close_delim}\n\n"
                "return M\n"
            )

            existed_before = os.path.exists(luau_path)
            with open(luau_path, "w", encoding="utf-8") as luau_file:
                luau_file.write(luau_content)

            action = "Updated" if existed_before else "Created"
            print(f"{action}: {csv_path} → {luau_path}")
