#!/bin/sh
set -e

echo "[entrypoint] Generating env-config.js..."
cat <<EOF > /usr/share/nginx/html/env-config.js
window._env_ = {
  REACT_APP_API_BASE_URL: "${REACT_APP_API_BASE_URL}",
  REACT_APP_NODE_ENV: "${REACT_APP_NODE_ENV}"
};
EOF

echo "[entrypoint] Replacing placeholders in .js files..."
find /usr/share/nginx/html -name "*.js" -exec sed -i \
  -e "s|__REACT_APP_API_BASE_URL__|${REACT_APP_API_BASE_URL}|g" \
  -e "s|__REACT_APP_NODE_ENV__|${REACT_APP_NODE_ENV}|g" {} \;

echo "[entrypoint] Starting NGINX..."
exec "$@"
