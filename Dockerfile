FROM nginx:alpine

LABEL org.opencontainers.image.description="Spinbox - Touchscreen Jukebox for Navidrome/Subsonic"
LABEL org.opencontainers.image.source="https://github.com/clipplepsquawk/spinbox"

COPY app/ /usr/share/nginx/html/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
