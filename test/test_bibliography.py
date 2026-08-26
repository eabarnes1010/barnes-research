from collections import Counter
from pathlib import Path
import re
import sys
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


def test_pub_peryear_generator_runs():
    """The chart generator must still be able to parse papers.bib.

    Deliberately NOT a sync check against the committed _data/pub_peryear.yml:
    .github/workflows/deploy.yml runs bin/build_pub_peryear.py immediately
    before the site build, so the deployed chart always reflects the current
    bibliography. Letting the committed file lag is harmless, and failing CI
    over it would block anyone who adds a paper without knowing to re-run the
    script. What genuinely matters is that a bib edit cannot break the
    generator, which is what this asserts.
    """
    sys.path.insert(0, str(REPO_ROOT / "bin"))
    from build_pub_peryear import entry_years

    years = list(entry_years(BIB_FILE.read_text(encoding="utf-8")))
    assert years, "No years parsed from papers.bib"
    assert min(years) > 1980, f"Implausible earliest year: {min(years)}"
    assert max(years) < 2100, f"Implausible latest year: {max(years)}"
