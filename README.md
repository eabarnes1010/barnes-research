# Barnes Research Group website

Source for **[barnes-research.com](https://barnes-research.com)** — the Barnes Research Group, Environmental Data Science @ Boston University. We study Earth-system variability, predictability, and change using explainable & interpretable AI.

Built on [al-folio](https://github.com/alshedivat/al-folio) v1.x (a pluginized Jekyll starter) and deployed via GitHub Pages.

## Stack

- **Jekyll** static site, **al-folio v1** (`theme: al_folio_core`). Runtime — layouts, includes, Sass, feature JS — lives in versioned `al-*` / `al_folio_*` Ruby gems, not in this repo. This repo owns content + config wiring only.
- **Tailwind v4** style engine.
- Custom domain `barnes-research.com` (no `baseurl`).

## Repo layout

Content this repo owns:

| Path | What |
| --- | --- |
| `_config.yml` | site settings, plugin list, feature flags |
| `_pages/` | top-nav pages: home, prof-barnes, group, projects, publications, teaching, scicomm, news, blog, contact, cv |
| `_data/members.yml` | group roster (current + former) rendered by `_pages/group.md` |
| `_news/` | news/announcement snippets |
| `_projects/` | research themes (explainable AI, S2D prediction, variability & change, climate intervention, novel data science) |
| `_bibliography/papers.bib` | publications — `/publications/` generated from this BibTeX |
| `assets/img/people/` | member + people photos |
| `Gemfile` | pinned gem versions (must stay in sync with `_config.yml` `plugins:`) |

Editing layouts/includes/tags/filters here is the recurring mistake — that's gem-owned. See [docs/BOUNDARIES.md](docs/BOUNDARIES.md) for the area→gem ownership table.

## Common edits

- **Add/remove a group member** → edit `_data/members.yml`, drop photo in `assets/img/people/`. No image = auto initials avatar.
- **Add a publication** → append to `_bibliography/papers.bib`.
- **Add news** → new `announcement_*.md` in `_news/`.
- **Edit a page** → matching file in `_pages/`.

## Local build

```bash
bundle install
bundle exec jekyll serve            # dev → http://localhost:4000/  (no baseurl, custom domain)
bundle exec jekyll build            # production build to _site/
```

Optional Python tooling (notebook conversion, CV render, scholar citations): `bin/setup-python-deps`.

## Deploy

CI builds + deploys to GitHub Pages on push to `main`. Work on `dev`, PR into `main`.

## Agent / plugin notes

- Two-part feature gating: site flag in `_config.yml` **and** per-page front matter. A feature renders only when its gem is in the plugin list and its flag is on; otherwise it silently emits nothing.
- `Gemfile` versions and `_config.yml` `plugins:` are two parallel lists — change both together.
- Upstream agent docs: [AGENTS.md](AGENTS.md), [CLAUDE.md](CLAUDE.md), [docs/BOUNDARIES.md](docs/BOUNDARIES.md).

## License

Site built on [al-folio](https://github.com/alshedivat/al-folio), MIT-licensed. Site content © Barnes Research Group.
