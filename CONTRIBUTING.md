# Editing the Barnes Research Group website

This site is built with [Jekyll](https://jekyllrb.com/) + the [al-folio](https://github.com/alshedivat/al-folio) theme and hosted on GitHub Pages. **You do not need to install anything** — everything below can be done from your browser on github.com.

When you commit a change to the `main` branch, a GitHub Action automatically rebuilds and redeploys the site (takes a few minutes). To propose a change without publishing immediately, open a Pull Request instead of committing to `main`.

> Tip: on any file in GitHub, click the ✏️ pencil icon to edit, or **Add file → Create new file** to make a new one. Fill in the commit message and click **Commit changes**.

---

## ➕ Add a publication = one BibTeX entry

Edit **`_bibliography/papers.bib`** and paste a new entry at the top. One paper = one `@article{...}` block:

```bibtex
@article{lastname2026keyword,
  abbr      = {GRL},
  title     = {Your Paper Title},
  author    = {Lastname, First and Barnes, Elizabeth A.},
  journal   = {Geophysical Research Letters},
  volume    = {53},
  pages     = {1--12},
  year      = {2026},
  doi       = {10.1029/2026GL000000},
  bibtex_show = {true},
  selected  = {true}
}
```

- **citekey** (`lastname2026keyword`) must be unique.
- `selected = {true}` makes the paper appear on the **front page**. Use it only for a few highlights; delete the line otherwise.
- Optional fields: `html`, `pdf`, `code`, `abbr` (journal badge), `preview` (a thumbnail image placed in `assets/img/publication_preview/`).
- `preprint = {https://...}` adds a **Preprint** button (use the full preprint URL, e.g. arXiv/ESSOAr; or a filename under `assets/pdf/` for a local copy). Shows alongside the published-paper button.
- **Bulk import:** export BibTeX from [ORCID](https://orcid.org/0000-0003-4284-9320) or [Google Scholar](https://scholar.google.com/citations?user=zs-BY1sAAAAJ) and paste the entries in.

---

## ➕ Add a group member = one YAML block

Edit **`_data/members.yml`**. Copy a block, paste it under `current:` (or `former:`), and edit:

```yaml
- name: Jane Researcher
  role: PhD Student # free text
  affiliation: BU # BU | CSU | CSU/BU
  email: jane@bu.edu # optional
  website: https://jane.dev # optional
  image: team/jane.jpg # optional — see "Add a photo" below
  # years: 2024–2026         # add this line only for FORMER members
```

Only `name` and `role` are required. With no `image`, a circle with the person's initials is shown automatically.

---

## ➕ Add a news item = one Markdown file

In the **`_news/`** folder, create a new file named `announcement_YYYY-MM-DD-short-slug.md`:

```markdown
---
layout: post
date: 2026-06-18 12:00:00-0400
inline: true
related_posts: false
---

Your one-line news item, with a [link](https://example.com) if relevant.
```

Items are sorted automatically by the `date` field (newest first). The 5 most recent show on the front page.

---

## 📷 Add a photo

Upload images through **Add file → Upload files** into:

- `assets/img/team/` for member photos (square images look best; reference as `image: team/name.jpg` in `members.yml`).
- `assets/img/` for general images. The main profile photo is `assets/img/prof_pic.jpg`.

---

## 🗂️ Where things live

| Page (URL)             | Edit this file                                             |
| ---------------------- | ---------------------------------------------------------- |
| Home (`/`)             | `_pages/about.md`                                          |
| `/prof-barnes/`        | `_pages/prof-barnes.md`                                    |
| `/group/`              | `_data/members.yml` (content) · `_pages/group.md` (layout) |
| `/scicomm/`            | `_pages/scicomm.md`                                        |
| `/research/`           | `_projects/*.md` (one file per project)                    |
| `/news/`               | `_news/*.md` (one file per item)                           |
| `/publications/`       | `_bibliography/papers.bib`                                 |
| `/courses/`            | `_pages/teaching.md`                                       |
| `/contact/`            | `_pages/contact.md`                                        |
| Site title, nav, links | `_config.yml`, `_data/socials.yml`                         |

---

## 👀 Previewing before publishing

- **Easiest:** open a **Pull Request** instead of committing to `main`. The Action builds your PR and reports success/failure; a maintainer can merge it.
- **Local preview** (optional, for maintainers): see `README.md` / `docs/INSTALL.md`. Either Docker (`docker compose up`) or a local Ruby 3.3.5 + `bundle exec jekyll serve`.

If a build fails, check the **Actions** tab on GitHub for the error.
