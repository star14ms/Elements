import os
import re
import shutil
from pathlib import Path


base_folder = "src\shared\constellations_with_props"

for root, _, files in os.walk(base_folder):
    for filename in files:
        # Rename
        # if filename.endswith(".csv"):
        #     # Match filenames with _{i}.csv pattern
        #     match = re.match(r"^(.*)_\d+\.csv$", filename)
        #     if match:
        #         new_name = f"{match.group(1)}.luau"
        #         old_path = os.path.join(root, filename)
        #         new_path = os.path.join(root, new_name)
                
        #         # Avoid overwriting if multiple files collapse into one name
        #         if os.path.exists(new_path):
        #             print(f"Skipping {old_path} → {new_path} (already exists)")
        #         else:
        #             os.rename(old_path, new_path)
        #             print(f"Renamed: {old_path} → {new_path}")
        
        # # Copy
        # if filename.endswith(".csv"):
        #     name_no_ext = Path(filename).stem  
        #     new_name = f"{name_no_ext}.luau"
        #     old_path = os.path.join(root, filename)
        #     new_path = os.path.join(root, new_name)
            
        #     # Avoid overwriting if multiple files collapse into one name
        #     if os.path.exists(new_path):
        #         print(f"Skipping {old_path} → {new_path} (already exists)")
        #     else:
        #         shutil.copyfile(old_path, new_path)
        #         print(f"Copied: {old_path} → {new_path}")

        # Remove
        if filename.endswith(".luau"):
            path = os.path.join(root, filename)
            
            # Avoid overwriting if multiple files collapse into one name
            if not os.path.exists(path):
                print(f"Skipping {path} (no exists)")
            else:
                os.remove(path)
                print(f"Removed: {path}")
