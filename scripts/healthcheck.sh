#!/bin/bash
echo "=== Docker containers status ==="
docker ps

echo ""
echo "=== Resource usage ==="
docker stats --no-stream

echo ""
echo "=== Portainer health status ==="
docker inspect --format='{{.State.Health.Status}}' portainer 2>/dev/null || echo "No health check defined, or container not found"

echo ""
echo "=== Disk space ==="
df -h /