from pathlib import Path
import yaml
import subprocess
import pytest

REPO_ROOT = Path(__file__).resolve().parent.parent
BIB_FILE = REPO_ROOT / "_bibliography" / "papers.bib"
PUB_YEAR_FILE = REPO_ROOT / "_data" / "pub_peryear.yml"
BUILD_SCRIPT = REPO_ROOT / "bin" / "build_pub_peryear.py"

def test_papers_bib_contains_lin2026extremes():
    assert BIB_FILE.exists(), f"{BIB_FILE} does not exist"
    content = BIB_FILE.read_text(encoding="utf-8")
    assert "@article{lin2026extremes," in content, "Citekey lin2026extremes not found in papers.bib"
    
    # Check required fields
    assert "Extremes on Rewind: Generating 1,000-Member Ensembles Initialized at a Final Condition" in content
    assert "Lin, Jerry and Chien, Mu-Ting and Sakarvadia, Mansi and Barnes, Elizabeth A." in content
    assert "https://arxiv.org/abs/2608.19008" in content
    assert "bibtex_show = {true}" in content

def test_build_pub_peryear_sync():
    assert BUILD_SCRIPT.exists(), f"{BUILD_SCRIPT} does not exist"
    # Run build script
    result = subprocess.run(["python3", str(BUILD_SCRIPT)], capture_output=True, text=True, check=True)
    assert "wrote _data/pub_peryear.yml" in result.stdout
    
    # Check pub_peryear.yml contents
    assert PUB_YEAR_FILE.exists(), f"{PUB_YEAR_FILE} does not exist"
    data = yaml.safe_load(PUB_YEAR_FILE.read_text(encoding="utf-8"))
    
    # Find 2026 count
    count_2026 = None
    for entry in data:
        if entry.get("year") == 2026:
            count_2026 = entry.get("count")
            break
            
    assert count_2026 is not None, "Year 2026 not found in _data/pub_peryear.yml"
    assert count_2026 == 20, f"Expected 2026 paper count to be 20, got {count_2026}"
    
    # Check total in header comment
    raw_yaml = PUB_YEAR_FILE.read_text(encoding="utf-8")
    assert "# Source: 196 papers" in raw_yaml, f"Expected total 196 papers in header comment"
