# hyperverse.world

Source code for [hyperverse.world](https://hyperverse.world) — the landing site for the hyperverse R ecosystem.

Built with [Quarto](https://quarto.org). Deployed automatically to GitHub Pages on push to `main`.

## Local preview

```bash
quarto preview
```

## Structure

```
├── index.qmd          # Home page
├── ecosystem.qmd      # Full ecosystem page
├── docs.qmd           # Documentation entry point
├── _data/
│   └── packages.yml   # Package registry (name, badge, links)
├── R/
│   └── packages.R     # Card rendering logic
└── styles.scss        # Custom styles
```

## Adding a package

Edit `_data/packages.yml`:

```yaml
- name: mypackage
  desc: "Short description."
  badge: In development
  badge_class: badge-dev
  github: https://github.com/hyperverse-r/mypackage
  pkgdown: ~
```

`badge_class` accepts `badge-cran`, `badge-dev`, or `badge-planned`.
