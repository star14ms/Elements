-- StarElementOrigins.luau
-- Mapping from stellar class or production channel to the chemical elements they can produce/eject
-- Classes: O, B, A, F, G, K, M (main sequence), WD (exploding white dwarfs/Type Ia), NS (neutron-star mergers)
-- Extra channels: BB (big bang fusion), CR (cosmic ray spallation)

local starClassToElements: { [string]: { string } } = {
    -- Big bang and cosmic rays (non-stellar, for completeness)
    BB = { "H", "He", "Li" },
    CR = { "Li", "Be", "B" },

    -- Massive main-sequence stars → core-collapse SNe (dominant producer of O–Zn, also some C and N)
    O = {
        "He", -- stars produce He from H
        "C", "N", "O",
        "Ne", "Na", "Mg", "Al", "Si", "P", "S", "Cl", "Ar", "K", "Ca",
        "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn",
        "Ga", "Ge", "As", "Se", "Br", "Kr",
    },
    B = {
        "He",
        "C", "N", "O",
        "Ne", "Na", "Mg", "Al", "Si", "P", "S", "Cl", "Ar", "K", "Ca",
        "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn",
        "Ga", "Ge", "As", "Se", "Br", "Kr",
    },

    -- Low-to-intermediate mass main-sequence stars → AGB phase (s-process; C, N, F, Na; minor O production)
    A = {
        "He",
        "C", "N", "O", "F", "Na",
        "Rb", "Sr", "Y", "Zr",
        "Ba", "La", "Ce", "Pr", "Nd",
        "Pb", "Bi",
    },
    F = {
        "He",
        "C", "N", "O", "F", "Na",
        "Rb", "Sr", "Y", "Zr",
        "Ba", "La", "Ce", "Pr", "Nd",
        "Pb", "Bi",
    },
    G = {
        "He",
        "C", "N", "O", "F", "Na",
        "Rb", "Sr", "Y", "Zr",
        "Ba", "La", "Ce", "Pr", "Nd",
        "Pb", "Bi",
    },
    K = {
        "He",
        "C", "N", "O", "F", "Na",
        "Rb", "Sr", "Y", "Zr",
        "Ba", "La", "Ce", "Pr", "Nd",
        "Pb", "Bi",
    },

    -- Very low-mass main-sequence stars
    M = { "He" },

    -- Exploding white dwarfs (Type Ia) → intermediate mass elements and Fe-peak
    WD = {
        "Si", "S", "Ca", "Ti",
        "Cr", "Mn", "Fe", "Co", "Ni",
    },

    -- Neutron-star mergers (r-process) → most nuclei heavier than iron
    NS = {
        "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Ru", "Rh", "Pd", "Ag",
        "Cd", "In", "Sn", "Sb", "Te", "I", "Xe",
        "Cs", "Ba", "La", "Ce", "Pr", "Nd", "Sm", "Eu", "Gd", "Tb",
        "Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", "Ta", "W", "Re",
        "Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Th", "U",
        "Pm", -- unstable, but produced in the r-process
    },
}

return starClassToElements

