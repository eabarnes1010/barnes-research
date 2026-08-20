from collections import Counter
from pathlib import Path
import re
import sys
import yaml
import pytest

REPO_ROOT = Path(__file__).resolve().parent.parent
BIB_FILE = REPO_ROOT / "_bibliography" / "papers.bib"
PUB_YEAR_FILE = REPO_ROOT / "_data" / "pub_peryear.yml"


def get_bib_entries(text):
    """Yield (citekey, entry_text) for each @entry in the bibtex file."""
    for m in re.finditer(r"@(\w+)\s*\{\s*([^,\s]+)\s*,", text):
        start = m.start()
        citekey = m.group(2)
        depth, j = 1, m.end()
        while j < len(text) and depth:
            depth += {"{": 1, "}": -1}.get(text[j], 0)
            j += 1
        yield citekey, text[start:j]


def test_bib_file_exists():
    assert BIB_FILE.exists(), f"{BIB_FILE} does not exist"
    assert len(BIB_FILE.read_text(encoding="utf-8").strip()) > 0


def test_citekeys_unique():
    content = BIB_FILE.read_text(encoding="utf-8")
    entries = list(get_bib_entries(content))
    citekeys = [k for k, _ in entries]
    assert len(citekeys) > 0, "No BibTeX entries found"
    duplicates = [k for k, c in Counter(citekeys).items() if c > 1]
    assert not duplicates, f"Duplicate citekeys found: {duplicates}"


def test_entries_required_fields():
    content = BIB_FILE.read_text(encoding="utf-8")
    for citekey, block in get_bib_entries(content):
        assert re.search(r"\btitle\s*=", block, re.IGNORECASE), f"Missing 'title' in {citekey}"
        assert re.search(r"\bauthor\s*=", block, re.IGNORECASE), f"Missing 'author' in {citekey}"
        assert re.search(r"\byear\s*=\s*[{\"]?\s*\d{4}", block, re.IGNORECASE), f"Missing or invalid 'year' in {citekey}"


def test_pub_peryear_in_sync():
    """Ensure _data/pub_peryear.yml matches current _bibliography/papers.bib."""
    assert PUB_YEAR_FILE.exists(), f"{PUB_YEAR_FILE} does not exist"

    sys.path.insert(0, str(REPO_ROOT / "bin"))
    from build_pub_peryear import entry_years, RECENT_YEARS

    years = list(entry_years(BIB_FILE.read_text(encoding="utf-8")))
    assert years, "No years parsed from papers.bib"

    counts = Counter(years)
    lo, hi = min(years), max(years)
    expected_full = [(y, counts.get(y, 0)) for y in range(lo, hi + 1)]
    if RECENT_YEARS:
        expected_full = expected_full[-RECENT_YEARS:]

    actual_data = yaml.safe_load(PUB_YEAR_FILE.read_text(encoding="utf-8"))
    actual_tuples = [(item["year"], item["count"]) for item in actual_data]

    assert actual_tuples == expected_full, (
        f"_data/pub_peryear.yml is out of sync with _bibliography/papers.bib! "
        f"Run 'python3 bin/build_pub_peryear.py' to update."
    )
