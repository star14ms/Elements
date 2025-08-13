import os
import re
import shutil
# from pathlib import Path
from datetime import datetime

base_folder = "src/shared/constellations"

for root, _, files in os.walk(base_folder):
    for filename in files:
        # Generate Luau ModuleScripts that return a table containing the CSV string
        if filename.endswith(".csv"):
            # name_without_extension = Path(filename).stem
            name_without_extension = "table"
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

            # Check if luau file already exists and has line data
            existing_lines_data = None
            backup_created = False
            
            if os.path.exists(luau_path):
                try:
                    with open(luau_path, "r", encoding="utf-8") as existing_file:
                        existing_content = existing_file.read()
                        
                        # Look for M.lines = { ... } pattern with better regex
                        # This handles multi-line tables and nested structures
                        lines_pattern = r'M\.lines\s*=\s*\{((?:[^{}]|{[^{}]*})*)\}'
                        lines_match = re.search(lines_pattern, existing_content, re.DOTALL)
                        
                        if lines_match:
                            # Extract the entire M.lines = { ... } statement
                            full_pattern = r'(M\.lines\s*=\s*\{)((?:[^{}]|{[^{}]*})*)(\})'
                            full_match = re.search(full_pattern, existing_content, re.DOTALL)
                            
                            if full_match:
                                # Reconstruct the complete lines statement
                                existing_lines_data = full_match.group(1) + full_match.group(2) + full_match.group(3)
                                print(f"Found existing line data in {luau_path}")
                                
                                # Create backup before modifying
                                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                                backup_path = f"{luau_path}.backup_{timestamp}"
                                shutil.copy2(luau_path, backup_path)
                                backup_created = True
                                print(f"Created backup: {backup_path}")
                                
                except Exception as e:
                    print(f"Warning: Could not read existing luau file {luau_path}: {e}")

            # Build the luau content
            luau_content = (
                "local M = {}\n"
                f"M.csv = {open_delim}\n{csv_text}{close_delim}\n\n"
            )

            # Add existing line data if it exists
            if existing_lines_data:
                luau_content += f"{existing_lines_data}\n\n"
                print(f"Preserved line data for {name_without_extension}")

            luau_content += "return M\n"

            existed_before = os.path.exists(luau_path)
            with open(luau_path, "w", encoding="utf-8") as luau_file:
                luau_file.write(luau_content)

            action = "Updated" if existed_before else "Created"
            backup_info = f" (backup: {os.path.basename(backup_path)})" if backup_created else ""
            print(f"{action}: {csv_path} → {luau_path}{backup_info}")
