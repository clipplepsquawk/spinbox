#!/bin/sh
# Write runtime config from environment variables into a JS file
# so the static frontend can access them without a build step.

cat > /usr/share/nginx/html/config.js <<EOF
window.SPINBOX_CONFIG = {
  lastfmApiKey: "${LASTFM_API_KEY:-}"
};
EOF

echo "Config written. LASTFM_API_KEY present: ${LASTFM_API_KEY:+yes}"

# Hand off to nginx
exec nginx -g "daemon off;"
