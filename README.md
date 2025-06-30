This repository contains all source files, essays, atomic notes, book summaries, and configuration for [pq3.ru](https://pq3.ru) -- 
an engineering knowledge base and digital garden focused on system architecture, organizational memory, and operational leadership.

## Structure

- `/content/` -- all essays, notes, book summaries (TLDRs), and longreads, organized in folders.
- `/quartz.config.ts`, `/quartz.layout.ts` -- site configuration and custom layouts.

## Tech stack

- Markdown -- content source of truth, portable, minimal dependencies.
- Quartz4 ([github/jackyzha0/quartz](https://github.com/jackyzha0/quartz)) -- knowledge management/static site generator.
- Node.js (v22+), Docker/Docker Compose for reproducible builds and serving.

## Local development

Run with docker/podman compose, access at http://localhost:8080: `docker compose up --build`.

This will mount your local `/content`, `/data`, and configs into the container for instant live-reload development.
The site always uses a pinned, reproducible Quartz4 version and separates my content/config from upstream code.

## Contribution

PRs are welcome -- especially for content, cross-linking, typo fixes, or structural/UX suggestions.

## License

This work is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
You are free to share, adapt, and build upon it -- with attribution.
