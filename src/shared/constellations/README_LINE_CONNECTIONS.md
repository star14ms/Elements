# Constellation Line Connections

This document explains how to add predefined line connections to constellation data files to create more accurate constellation shapes instead of using the MST algorithm.

## How It Works

The StarSphere module now checks for a `lines` table in each constellation's data file. If present, it uses these predefined connections instead of the MST algorithm.

## File Structure

Each constellation file should have this structure:

```lua
local M = {}
M.csv = [[
-- Your CSV data here
]]

-- Define line connections for the constellation
-- Each entry is a pair of star names that should be connected
M.lines = {
    {"Star1Name", "Star2Name"},      -- Comment explaining the connection
    {"Star2Name", "Star3Name"},      -- Another connection
    -- Add more connections as needed
}

return M
```

## Example: Orion Constellation

The Orion constellation file shows how to define the classic "hunter" shape:

```lua
M.lines = {
    {"Betelgeuse", "Bellatrix"},      -- Shoulder to shoulder
    {"Bellatrix", "Mintaka AB"},      -- Right shoulder to belt
    {"Mintaka AB", "Alnilam"},        -- Belt stars
    {"Alnilam", "Alnitak A"},         -- Belt stars
    {"Alnitak A", "Saiph"},           -- Belt to right foot
    {"Saiph", "Rigel"},               -- Right foot to left foot
    {"Rigel", "Betelgeuse"},          -- Left foot to left shoulder
    {"Betelgeuse", "Meissa A"},       -- Left shoulder to head
    {"Meissa A", "Bellatrix"},        -- Head to right shoulder
    -- Additional connections for more detail
}
```

## Benefits

1. **Accurate Shapes**: Lines follow traditional constellation patterns
2. **Cultural Significance**: Preserves the intended visual representation
3. **Flexibility**: Can add or remove specific connections
4. **Fallback**: If no lines data exists, falls back to MST algorithm

## Tips for Creating Line Connections

1. **Start with Main Stars**: Begin with the brightest stars that form the basic shape
2. **Follow Traditional Patterns**: Use astronomical references or constellation charts
3. **Test Incrementally**: Add a few connections at a time and test
4. **Use Descriptive Comments**: Explain what each connection represents
5. **Consider Star Names**: Make sure star names exactly match the CSV data

## Star Names

Star names in the `lines` table must exactly match the names in the CSV data. Common formats include:
- Bayer designations: "α", "β", "γ"
- Greek letters: "Alpha", "Beta", "Gamma"
- Traditional names: "Betelgeuse", "Rigel"
- Full names: "π3 Ori", "θ1 Ori C"

## Fallback Behavior

If a constellation doesn't have a `lines` table, the system will:
1. Use the "In lines" column from CSV if available
2. Fall back to MST algorithm with brightest stars
3. Maintain the same visual appearance as before

## Adding to Existing Constellations

To add line connections to an existing constellation:

1. Open the constellation's `table.luau` file
2. Add the `M.lines = {}` table after the CSV data
3. Define the connections following the pattern above
4. Save the file
5. The changes will take effect the next time constellations are created

## Example Constellations to Start With

Good candidates for adding line connections:
- **Ursa Major**: The Big Dipper shape
- **Orion**: The hunter figure
- **Cassiopeia**: The W shape
- **Cygnus**: The cross shape
- **Leo**: The lion outline