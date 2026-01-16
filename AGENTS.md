# AGENTS.md

## Project summary

This repository contains the source for the **Master Hotwire** marketing site (https://masterhotwire.com/).

It is a **Bridgetown** static site (Ruby) with an **esbuild + PostCSS** frontend pipeline (Node).

## Tech stack

- **Ruby**: Bridgetown `~> 1.3.4` (see `Gemfile`)
- **Node**: esbuild bundling, PostCSS
- **Hotwire**: Turbo + Stimulus (frontend interactivity)
- **Payments**: Paddle (Paddle.js on the frontend + Paddle API sync task)
- **Analytics**: Plausible (`plausible(...)` events are used in JS)

## High-level architecture

- **Static content**: `src/` is the Bridgetown source directory.
- **Layouts/partials**: ERB templates in `src/_layouts` and `src/_partials`.
- **Data**: YAML in `src/_data`.
- **Assets**: bundled from `frontend/` into `output/_bridgetown/static` by esbuild.

### Content rendering flow (typical page)

- A page like `src/index.md` declares front matter (e.g. `layout: default`).
- `src/_layouts/default.erb` wraps the page.
- The `<head>` is rendered via `src/_partials/_head.erb`.
- Page content may include ERB (example: `src/index.md` sets variables and calls `<%= render "cta" %>`).
- Reviews are rendered via `src/_partials/_reviews.erb` reading `src/_data/reviews.yml`.

## Key directories & files

### Site content (what visitors read)

- `src/index.md`
  - Homepage content.
  - Uses ERB at the top to set variables like `sales_count` and `price`.
  - Uses `paddle: true` in front matter to enable Paddle scripts in the `<head>`.
- `src/_pages/privacy.md`, `src/_pages/terms.md`
  - Legal pages linked from the footer.
- `src/images/`
  - Site images referenced from Markdown.
- `src/_data/site_metadata.yml`
  - Site title/tagline/description/email.
- `src/_data/reviews.yml`
  - Testimonials shown on the homepage.

### Layout & UI composition

- `src/_layouts/default.erb`
  - Main HTML skeleton.
- `src/_partials/_head.erb`
  - Loads bundled CSS/JS via `webpack_path`.
  - Conditionally loads Paddle.js + `Paddle.Initialize(...)` when `data.paddle` is set.
- `src/_partials/_cta.erb`, `src/_partials/_buy_button.erb`, `src/_partials/_reviews.erb`, `src/_partials/_footer.erb`
  - Reusable homepage blocks.
- `src/_components/`

### Frontend assets

- `frontend/javascript/index.js`
  - JS entrypoint.
  - Imports `frontend/styles/index.css`, `homepage.css`, `syntax-highlighting.css`.
  - Starts Stimulus and auto-registers controllers under `frontend/javascript/controllers`.
- `frontend/javascript/controllers/checkout_controller.js`
  - Handles Paddle checkout and Plausible event logging.
- `frontend/styles/*.css`
  - Styling is plain CSS (processed through PostCSS).

### Tooling & configuration

- `bridgetown.config.yml`
  - Global Bridgetown settings. Note: changes require a server restart.
- `config/initializers.rb`
  - Enables `dotenv` + `bridgetown-seo-tag`.
- `esbuild.config.js`
  - Project-specific esbuild overrides.
- `config/esbuild.defaults.js`
  - Bridgetown-managed defaults. **Do not edit directly** (overwritten by updates).
- `postcss.config.js`
  - PostCSS configuration.
- `Rakefile`
  - Defines `frontend:build`, `frontend:dev`, database migration helpers, and a Paddle sync task.

## Development workflow

### Preferred workflow: Devcontainer

The repo is set up to run in a devcontainer via Docker Compose.

- Ensure your root `.env` sets:
  - `COMPOSE_FILE=.devcontainer/docker-compose.yml`
- Start:
  - `docker-compose up`
- Visit:
  - http://localhost:4000

If you are editing JS/CSS and changes aren’t reflected, run the asset watcher in another terminal (inside the container), e.g.:

- `docker-compose run app rake frontend:dev`

## Environment variables & secrets

The site uses environment variables for payment + server integrations.

- **Frontend (Paddle Checkout)**
  - `PADDLE_TOKEN` (required when `paddle: true` pages are rendered)
  - `PADDLE_LIVE` (`"true"` to use production; otherwise sandbox)
  - `PADDLE_PRICE_ID` (used by checkout buttons)
- **Paddle API / back office sync**
  - `PADDLE_API_KEY` (required for `bin/bridgetown paddle:sync` / `rake paddle:sync` task)
  - `PADDLE_WEBHOOK_SECRET_KEY` (mentioned in `README.md` for validating webhooks)
- **DB**
  - `DATABASE_URL` (examples used in devcontainer: `sqlite://db/storage/development.db`)
- **Sentry**
  - `SENTRY_DSN` (optional)

Do **not** commit secrets. Local `.env` is gitignored.

## Build & deployment

### Local build

- Build frontend assets:
  - `rake frontend:build` (runs `yarn run esbuild`)
- Build the site:
  - `bin/bridgetown deploy` (Rake default task calls deploy)

Output goes to:

- `output/`

### CI: GitHub Pages

- Workflow: `.github/workflows/gh-pages.yml`
- Trigger: push to `main`
- Build runs `bin/bridgetown deploy` and uploads `./output`.
- Paddle config is injected via GitHub Secrets/Vars:
  - `secrets.PADDLE_TOKEN`
  - `vars.PADDLE_LIVE`
  - `vars.PADDLE_PRICE_ID`

## Testing

- Tests are Minitest + Rack::Test under `test/`.
- `plugins/test_output.rb` loads tests after build when not in development.
- The suite uses `DatabaseCleaner` against SQLite (see `test/minitest_helper.rb`).

## Common change recipes (where to edit)

- **Change homepage copy, pricing, sales count, CTA placement**
  - Edit `src/index.md`.
- **Change testimonials**
  - Edit `src/_data/reviews.yml` and adjust markup in `src/_partials/_reviews.erb` if needed.
- **Change site title/SEO description/email**
  - Edit `src/_data/site_metadata.yml`.
- **Change global layout/head scripts (Plausible/Paddle)**
  - Edit `src/_layouts/default.erb` and `src/_partials/_head.erb`.
- **Change styling**
  - Start at `frontend/styles/index.css` (global) and `frontend/styles/homepage.css` (homepage-specific).
  - Design references live in `doc/design-system.md` and `doc/typography.md`.
- **Change checkout behavior**
  - Edit `frontend/javascript/controllers/checkout_controller.js`.
  - Ensure the HTML button has `data-controller="checkout"` and `data-checkout-price-id-value`.

## Gotchas / invariants

- `template_engine: erb` is configured; Markdown pages can embed ERB.
- Pages that need Paddle must set `paddle: true` in front matter; otherwise Paddle.js is not loaded.
- `config/esbuild.defaults.js` is Bridgetown-managed; put overrides in `esbuild.config.js`.
- The bundled asset paths are resolved via `webpack_path :css` and `webpack_path :js` in `_head.erb`.

## Design / UX guidelines

The design system is minimal and documented under `doc/`:

- `doc/design-system.md`
- `doc/typography.md`

When changing styles, keep the system font stack, spacing scale, and semantic color intent consistent unless you intentionally redesign.
