#!/usr/bin/env bash
set -e

cd /home/prodesk/live-site

git fetch origin main

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "$(date): Updates found, pulling..."
    git pull origin main

    echo "$(date): Restarting docker container..."
    docker restart 49cf803425d2

    echo "$(date): Update complete."
else
    echo "$(date): No updates."
fi
