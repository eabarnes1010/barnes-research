# Barnes Research Group website

This repository **is** our group website, [barnes-research.com](https://barnes-research.com). The whole site is built from plain text files in this repo — when a change lands on the `main` branch, the live site rebuilds automatically within a couple of minutes.

This README is written for group members who want to add or update their own content. You do **not** need to know web development, Ruby, or Jekyll to add yourself, a paper, your research, or a news item — you just edit a text file. The technical setup is at the very bottom and you can ignore it for everyday updates. It is also an opportunity for you to work collaboratively via GitHub.

---

## How to make a change (the short version all via the GitHub website)

1. Find the file you need below (e.g. `_data/members.yml` to add yourself).
2. Edit it — easiest is directly on GitHub: open the file, click the ✏️ pencil icon, make your change.
3. Save it as a **pull request** (GitHub walks you through this). Don't commit directly to `main`.
4. Once it's reviewed (could be by you or someone else in the group) and merged into `main`, the site updates on its own in ~2 minutes.

If anything looks wrong after it goes live, tell Libby or whoever maintains the site — nothing here is hard to undo.

---

## Common things you'll want to do

### Add or update a publication

Edit [`_bibliography/papers.bib`](_bibliography/papers.bib). The `/publications/` page is generated automatically from this file, so adding or editing an entry here updates the site.

**To add a paper,** paste a BibTeX entry (copy one straight from Google Scholar or the journal/DOI page) and give it a unique key after the `{` (e.g. `doe2026example`). A couple of optional extras are worth adding:

```bibtex
@article{doe2026example,
  abbr        = {GRL},                     # optional: short venue tag shown as a badge
  title       = {A Great Title},
  author      = {Doe, Jane and Barnes, Elizabeth A.},
  journal     = {Geophysical Research Letters},
  year        = {2026},
  bibtex_show = {true},                    # shows the "BibTeX" button on the site
  selected    = {true}                     # optional: also feature it on the home page
}
```

**To update a paper** (e.g. a submitted paper gets accepted), find its entry and edit the fields in place — remove `note = {submitted}`, fix the `journal` and `year`, and so on. For a paper still in review, add `note = {submitted}`.

### Add someone

Edit [`_data/members.yml`](_data/members.yml). Copy an existing block, paste it under `current:` (in alphabetical order by last name), and edit the fields. Only `name` and `role` are required.

```yaml
- name: Jane Doe
  role: PhD Student # free text: "PhD Student", "Postdoc", "Masters Student", ...
  affiliation: BU # BU | CSU | CSU/BU
  email: jdoe@bu.edu
  website: https://janedoe.github.io # optional
  image: people/jane-doe.jpg # optional — see Photos below
```

When you leave, move your block from `current:` to `former:` and add a `years:` field (e.g. `years: 2025–2029`).

### Add or change your photo

Drop (or replace) a **square** image into [`assets/img/people/`](assets/img/people/), named like `jane-doe.jpg`, then set `image: people/jane-doe.jpg` in your members block. No photo is fine — the site shows a circle with your initials instead.

### Add a news item

Create a new file in [`_news/`](_news/) named `announcement_YYYY-MM-DD-short-slug.md`. Copy the format of an existing one:

```markdown
---
layout: post
date: 2026-05-01 12:00:00-0400
inline: true
related_posts: false
---

Jane Doe joins the group as a PhD student.
```

Keep it to a sentence or two — these show as short lines on the news page.

### Edit a page (home, contact, group, etc.)

Each page in the top navigation is one file in [`_pages/`](_pages/):

| Page on the site    | File to edit                                             |
| ------------------- | -------------------------------------------------------- |
| Home (landing page) | `_pages/about.md`                                        |
| Prof. Barnes        | `_pages/prof-barnes.md`                                  |
| Group               | `_pages/group.md` (people come from `_data/members.yml`) |
| Research            | `_pages/projects.md` + the theme files in `_projects/`   |
| Publications        | generated from `_bibliography/papers.bib`                |
| Teaching / Courses  | `_pages/teaching.md`                                     |
| SciComm             | `_pages/scicomm.md`                                      |
| News                | `_pages/news.md` (items come from `_news/`)              |
| Contact             | `_pages/contact.md`                                      |

The text below the `---` block is plain [Markdown](https://www.markdownguide.org/basic-syntax/). Leave the part **between** the two `---` lines (the "front matter") alone unless you know what it does.

### Add or edit a research theme

Each theme on the Research page is a file in [`_projects/`](_projects/) (e.g. `1_explainable_ai.md`). Copy one, change the `title`, `description`, and body text. To add a thumbnail, put an image in `assets/img/` and reference it in the `img:` field.

---

## Tips

- **When in doubt, copy an existing entry** and edit it. Matching the format that's already there is the safest approach.
- **Indentation matters** in the `.yml` files — use spaces, not tabs, and line things up with the surrounding entries.
- **Preview before merging:** every pull request gets an automatic build check; if it fails, something in the formatting is off (usually a stray character in a `.yml` file). Ask for help rather than forcing it through.

---

## Where everything lives (reference)

| Path                       | What's in it                               |
| -------------------------- | ------------------------------------------ |
| `_pages/`                  | the pages in the top navigation            |
| `_data/members.yml`        | the group roster                           |
| `_news/`                   | news / announcement snippets               |
| `_projects/`               | research themes shown on the Research page |
| `_bibliography/papers.bib` | all publications                           |
| `assets/img/people/`       | member photos                              |
| `assets/img/`              | other images                               |
| `_config.yml`              | site-wide settings (don't edit casually)   |

---

## Technical setup (maintainers only — skip for everyday updates)

The site is built with [Jekyll](https://jekyllrb.com/) on the [al-folio](https://github.com/alshedivat/al-folio) v1.x starter. The visual theme and all runtime logic (layouts, includes, styling, feature JavaScript) live in versioned `al-*` / `al_folio_*` Ruby gems, **not** in this repo — this repo owns only content and configuration. Editing layouts/includes here is the most common mistake; see [docs/BOUNDARIES.md](docs/BOUNDARIES.md) for what's owned where.

- **Style engine:** Tailwind v4. **Domain:** `barnes-research.com` (custom domain, no `baseurl`).
- **Deploy:** GitHub Actions builds and deploys to GitHub Pages on push to `main`. Day-to-day work happens on `dev` and is merged to `main` via pull request.
- **Feature gating is two-layered:** a site-wide flag in `_config.yml` **and** per-page front matter both have to be on for a feature to render; otherwise it silently emits nothing.
- **Keep two lists in sync:** plugin versions in `Gemfile` and the `plugins:` list in `_config.yml` must match.
- **Agent / contributor docs:** [AGENTS.md](AGENTS.md), [CLAUDE.md](CLAUDE.md), [docs/BOUNDARIES.md](docs/BOUNDARIES.md).

Local build (optional — you don't need this just to add content):

```bash
bundle install
bundle exec jekyll serve     # preview at http://localhost:4000/
```

## License

Built on [al-folio](https://github.com/alshedivat/al-folio), MIT-licensed. Site content © Barnes Research Group.
