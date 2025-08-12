import re


def extract_last_value_with_uncertainty(text):
    if not text:
        return text
    s = text.strip().replace("\xa0", " ").replace("\u2212", "-")

    # Pattern to match a single value + optional uncertainty + unit
    # We'll find *all* such blocks and return the last one
    pattern = r"""
        [<>]?\s*                    # optional < or >
        [\d,.]+                     # main number
        (?:                         # optional uncertainty block:
            \s*
            (?:                     # either ± single uncertainty
                [±]\s*[\d,.]+
            |                       # OR plus-minus range uncertainty
                \+\s*[\d,.]+\s*[-−]\s*[\d,.]+
            )
        )?
        \s*
        [^\d±+\-−]*                 # unit (non-digit, non-uncertainty symbols)
    """

    matches = re.findall(pattern, s, re.VERBOSE)
    if matches:
        return matches[-1].strip()
    else:
        # fallback: take last word maybe?
        return s.split()[-1]

def split_value_uncertainty_unit(text, keep_uncertainty=False):
    """
    Parse a string with value ± uncertainty and units, keeping < or > if present.
    Returns: (value_str or float, uncertainty, unit)
    If keep_uncertainty=False → uncertainty returned as None.
    If value has < or >, it's returned as a string with the symbol (e.g., "<0.05").
    """
    if not text or not text.strip() or text[0].isalpha():
        return None, None, None

    s = text.strip()
    s = s.replace("\xa0", " ").replace("\u2212", "-").replace(",", "").strip()

    if ";" in s:
        s = s[:s.index(";")]

    # number pattern with optional < or >
    num = r"(?P<sign>[<>]?)\s*(?P<num>[-+]?\d+(?:\.\d+)?)"

    pattern = rf"""
        \(?\s*
        {num}                                      # main value (with optional limit sign)
        \s*
        (?:
            ±\s*(?P<pm_unc>[\d.]+)                  # symmetric ±unc
            |
            \+\s*(?P<plus>[\d.]+)\s*[-−]\s*(?P<minus>[\d.]+)  # asymmetric +x −y
        )?
        \s*
        (?:[×x]\s*10\s*\^?\s*(?P<exp>[-+]?\d+))?    # optional scientific multiplier
        \s*
        (?P<unit>.*?)(?=(?:\s+[-+]?\d|\s*$))        # unit up to next number or end
    """

    m = re.search(pattern, s, flags=re.VERBOSE)
    if not m:
        return _parse_segment_simple(s, keep_uncertainty)

    # sign (< or >)
    limit_sign = m.group("sign") or ""
    val = float(m.group("num"))
    exp = int(m.group("exp")) if m.group("exp") else 0
    val *= (10 ** exp)

    # keep sign in value string if exists
    value = f"{limit_sign}{val}" if limit_sign else val

    unit = m.group("unit").strip() if m.group("unit") else None
    if unit:
        unit = unit.rstrip(" ,;:()[]")

    if keep_uncertainty:
        if m.group("pm_unc"):
            unc = float(m.group("pm_unc")) * (10 ** exp)
        elif m.group("plus") or m.group("minus"):
            plus = float(m.group("plus")) * (10 ** exp) if m.group("plus") else None
            minus = float(m.group("minus")) * (10 ** exp) if m.group("minus") else None
            unc = (plus, minus)
        else:
            unc = None
    else:
        unc = None

    return value, unc, unit

def _parse_segment_simple(seg, keep_uncertainty=False):
    """Simpler fallback parser for odd cases"""
    seg = seg.replace("(", "").replace(")", "").strip()
    seg = seg.replace("\u2212", "-")
    seg = re.sub(r"\s+", " ", seg)

    num = r"(?P<sign>[<>]?)\s*(?P<num>[-+]?\d+(?:\.\d+)?)"

    # asymmetric
    m = re.match(rf"^{num}\s*\+\s*(?P<plus>[\d.]+)\s*[-−]\s*(?P<minus>[\d.]+)\s*(?P<unit>.*)?$", seg)
    if m:
        limit_sign = m.group("sign") or ""
        val = float(m.group("num"))
        value = f"{limit_sign}{val}" if limit_sign else val
        plus = float(m.group("plus"))
        minus = float(m.group("minus"))
        unit = m.group("unit").strip() if m.group("unit") else None
        unc = (plus, minus) if keep_uncertainty else None
        return value, unc, unit

    # symmetric
    m = re.match(rf"^{num}\s*±\s*(?P<unc>[\d.]+)\s*(?P<unit>.*)?$", seg)
    if m:
        limit_sign = m.group("sign") or ""
        val = float(m.group("num"))
        value = f"{limit_sign}{val}" if limit_sign else val
        unc = float(m.group("unc")) if keep_uncertainty else None
        unit = m.group("unit").strip() if m.group("unit") else None
        return value, unc, unit

    # plain value
    m = re.match(rf"^{num}\s*(?P<unit>.*)?$", seg)
    if m:
        limit_sign = m.group("sign") or ""
        val = float(m.group("num"))
        value = f"{limit_sign}{val}" if limit_sign else val
        unit = m.group("unit").strip() if m.group("unit") else None
        return value, None, unit

    return None, None, seg

def normalize_value(raw_value):
    clean_value = extract_last_value_with_uncertainty(raw_value)
    value, _, unit = split_value_uncertainty_unit(clean_value)
    
    if value is None or unit is None:
        return raw_value
    else:
        return str(value) + " " + unit

# def parse_numeric_value(text, number_type=float):
#     """
#     Extract only the average numeric value from strings like:
#     "3.63±0.201", "158+41 −33", "60; 200+117 −74"
#     """
#     # Replace non-breaking spaces etc.
#     clean = text.replace("\xa0", " ").strip()
    
#     # Handle cases like "60; 200+117 −74" -> take first number
#     m = re.search(r"[-+]?\d+\.?\d*", clean)
#     return number_type(m.group()) if m else None
