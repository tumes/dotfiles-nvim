# Hard Rules

- **Never code from a plan without explicit go-ahead.**
- **Bugs are hypotheses until verified.** Suggest what _may_ be wrong — don't declare it fixed until we confirm.
- **Say "I don't know" when you don't know.** Don't fabricate confident explanations. State uncertainty clearly and investigate further.
- **Bash: absolute paths only.** The working directory is not the repo root. Every relative path is a wasted command.
- **Never `git reset --hard` or destructive git commands.** Use `git revert`.
- **Never manually write types when typegen exists** (wrangler, Astro, Sanity). Run typegen instead.

# Docs-First Development

Check context7 docs before writing ANY code for: Cloudflare, Astro, htmx, Zod, Hono.

1. `resolve-library-id` first, then `query-docs` with focused queries (method names > natural language).
2. If a design doc provides specific doc links (beta/prerelease), use those instead of context7.
3. Docs beat your training data. Always.

# Cloudflare

- `wrangler.jsonc`, never `.toml`.
- Never suggest Cloudflare Pages (deprecated).
- Scaffold: `npm create cloudflare@latest <name> -- --framework=astro --yes`

# Astro

- `astro add` for integrations, not `npm install`.
- `--skip-houston` when starting projects.

## Feature Architecture

1. **Frontend** — Vanilla HTML + htmx for progressive enhancement. No client-side JS frameworks.
2. **Endpoints** (`src/pages/*.ts`) — Routing, params, Response objects. Call actions, decide what to render/redirect.
3. **Actions** (`src/actions/`) — Zod validation + business logic. Return `{ success, data }` or `{ success: false, errors }`. Never return Response objects.
