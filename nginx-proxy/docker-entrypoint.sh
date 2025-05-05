#!/bin/bash
set -e

echo "ENVIRONMENT is: '$ENVIRONMENT'"

if [ "$ENVIRONMENT" = "production" ]; then
    echo "Using production nginx config..."
    cp /etc/nginx/templates/default.production.conf /etc/nginx/conf.d/default.conf
else
    echo "Using development nginx config..."
    cp /etc/nginx/templates/default.dev.conf /etc/nginx/conf.d/default.conf
fi

exec "$@"
