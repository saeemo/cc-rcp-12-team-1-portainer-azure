# Running the Project

## Restart Portainer
scripts/portainer_start.sh

## Health check
scripts/healthcheck.sh

## Simple backup of Portainer data
1. Stop the container: docker compose stop portainer
2. Back up the data volume:
   docker run --rm -v azureuser_portainer_data:/data -v $(pwd):/backup ubuntu tar czf /backup/portainer_backup.tar.gz /data
3. Restart the container: docker compose start portainer