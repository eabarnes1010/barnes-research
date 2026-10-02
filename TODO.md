# TODO

## Auto-remove `node_modules` so Google Drive stops erroring

Problem: this working tree lives in Google Drive, which cannot sync symlinks;
`npm install` creates `node_modules/.bin/{playwright,playwright-core,prettier,pixelmatch}`
symlinks, producing recurring "Can't upload some files" notices. Drive has no
per-folder ignore, and Node requires `node_modules` inside the project tree, so
the only fix that keeps this repo in Drive is to not leave `node_modules` sitting
there between runs.

Recommended approach — make every script SELF-CONTAINED: install, run, then
delete `node_modules` in one command, so running the command you already run
cleans up after itself with nothing to remember (`node_modules` is only dev
tooling; the Jekyll site build does not need it). Replace `scripts` with:

```json
"scripts": {
  "lint:prettier": "npm ci && prettier . --check ; rm -rf node_modules",
  "lint:style-contract": "npm ci && node test/style_contract.js ; rm -rf node_modules",
  "test:visual": "npm ci && playwright test --config test/visual/playwright.config.js ; rm -rf node_modules",
  "test:visual:update": "npm ci && playwright test --config test/visual/playwright.config.js --update-snapshots ; rm -rf node_modules",
  "check": "npm ci && prettier . --check && node test/style_contract.js && playwright test --config test/visual/playwright.config.js ; rm -rf node_modules"
}
```

- `npm ci &&` installs first; `;` before `rm -rf node_modules` guarantees cleanup
  even when a check fails.
- No on-demand step and no need to remember `npm ci` — each command self-installs
  and self-cleans, so `node_modules` never persists in Drive between runs.
- Tradeoff: each invocation reinstalls (~26 MB); Playwright browsers are cached
  outside the repo, so that part stays fast. Iterative snapshot updates reinstall
  each run — acceptable for an infrequently-touched repo.

Permanent alternative (bigger): migrate this repo to Yarn Plug'n'Play, which
eliminates `node_modules` entirely (deps become zip files Drive can sync) — but
not all tools support PnP cleanly (Playwright in particular), so it needs testing.

Note: `.claude/skills` and `.codex/skills` are symlinks to `.agents/skills` and
will also trip Drive's symlink limitation; they are intentional sharing links, so
leave them unless the skills layout is restructured.

