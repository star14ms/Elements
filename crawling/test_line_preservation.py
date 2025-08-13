#!/usr/bin/env python3
"""
Test script to demonstrate line data preservation functionality.
This script shows how the csv2luau.py script preserves existing line data.
"""

import re
import os

def test_line_detection():
    """Test the line detection regex patterns."""
    
    # Sample content with line data (like what would be in a constellation file)
    sample_content = '''local M = {}
M.csv = [[
Name,RA,Dec
Star1,00h 00m 00s,+00° 00′ 00″
Star2,00h 01m 00s,+00° 01′ 00″
]]

-- Define line connections for the constellation
-- Each entry is a pair of star names that should be connected
M.lines = {
    {"Star1", "Star2"},      -- Basic connection
    {"Star2", "Star3"},      -- Another connection
    {"Star3", "Star1"},      -- Triangle completion
}

return M'''

    print("Testing line detection patterns...")
    print("=" * 50)
    
    # Test the improved regex pattern
    lines_pattern = r'M\.lines\s*=\s*\{((?:[^{}]|{[^{}]*})*)\}'
    lines_match = re.search(lines_pattern, sample_content, re.DOTALL)
    
    if lines_match:
        print("✓ Basic pattern match found")
        
        # Extract the entire M.lines = { ... } statement
        full_pattern = r'(M\.lines\s*=\s*\{)((?:[^{}]|{[^{}]*})*)(\})'
        full_match = re.search(full_pattern, sample_content, re.DOTALL)
        
        if full_match:
            print("✓ Full pattern match found")
            reconstructed = full_match.group(1) + full_match.group(2) + full_match.group(3)
            print("✓ Reconstructed line data:")
            print(reconstructed)
        else:
            print("✗ Full pattern match failed")
    else:
        print("✗ Basic pattern match failed")
    
    print("\n" + "=" * 50)

def test_complex_structure():
    """Test with more complex nested structures."""
    
    complex_content = '''local M = {}
M.csv = [[
Name,RA,Dec
Star1,00h 00m 00s,+00° 00′ 00″
]]

M.lines = {
    {"Star1", "Star2"},      -- Simple connection
    {"Star2", "Star3", {     -- Complex nested structure
        {"Star3", "Star4"},  -- Nested connection
        {"Star4", "Star1"}   -- Another nested connection
    }},
    {"Star5", "Star6"}       -- Final connection
}

return M'''

    print("Testing complex structure detection...")
    print("=" * 50)
    
    # Test with complex nested structure
    lines_pattern = r'M\.lines\s*=\s*\{((?:[^{}]|{[^{}]*})*)\}'
    lines_match = re.search(lines_pattern, complex_content, re.DOTALL)
    
    if lines_match:
        print("✓ Complex pattern match found")
        print("✓ Content length:", len(lines_match.group(1)))
    else:
        print("✗ Complex pattern match failed")
    
    print("=" * 50)

if __name__ == "__main__":
    test_line_detection()
    test_complex_structure()
    
    print("\nLine preservation test completed!")
    print("The csv2luau.py script will now preserve existing line data when updating constellation files.")
