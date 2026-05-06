# Jukebox

A touchscreen-friendly jukebox UI for Subsonic-compatible servers (Navidrome, Airsonic, etc.), packaged as a Docker container.

## Repo Structure

```
jukebox-app/
├── .github/
│   └── workflows/
│       └── docker-publish.yml   # Builds & pushes to GHCR on push to main
├── app/
│   └── index.html               # ← The entire UI lives here (single file, no build step)
├── Dockerfile                   # nginx:alpine serving app/
├── docker-compose.yml
├── .env.example
└── .gitignore
```

## How it works

The `Dockerfile` is dead simple:
1. Start from `nginx:alpine`
2. `COPY app/ /usr/share/nginx/html/`
3. Done.

No build step, no Node.js, no bundler. To iterate on the UI, edit `app/index.html` and push.

## Deploy via Portainer

1. Push to GitHub → Actions builds `ghcr.io/YOUR_USERNAME/jukebox-app:latest`
2. Make the GHCR package public (GitHub → Profile → Packages → Package Settings)
3. In Portainer → **Stacks → Add Stack** → paste `docker-compose.yml`
4. Set env vars:
   - `GITHUB_USERNAME` = your GitHub username
   - `JUKEBOX_PORT` = host port (default `3080`)
5. Deploy → navigate to `http://nas-ip:3080`

## Usage

On first load, enter your Subsonic server URL (e.g. `http://nas:4533`), username, and password. Credentials are saved to localStorage so you only log in once per browser.

## Developing locally

```bash
docker compose up
# or just open app/index.html directly in a browser
```

Since it's a static file, you can open `app/index.html` directly without Docker during development. Just note that your browser may block requests to the Subsonic server due to CORS — running it behind nginx (via Docker) avoids that.
