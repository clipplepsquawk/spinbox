FROM nginx:alpine

LABEL org.opencontainers.image.description="Touchscreen Jukebox UI for Subsonic/Navidrome"
LABEL org.opencontainers.image.source="https://github.com/YOUR_GITHUB_USERNAME/jukebox-app"

# Copy static app files into nginx web root
COPY app/ /usr/share/nginx/html/

# Optional: custom nginx config (uncomment if you add nginx.conf)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
