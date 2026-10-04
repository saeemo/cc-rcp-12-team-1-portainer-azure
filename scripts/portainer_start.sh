#!/bin/bash
set -e

cd "$(dirname "$0")/.."

echo ">>> Restarting the Portainer stack..."
docker compose restart portainer

echo ">>> Current status:"
docker ps --filter "name=portainer"