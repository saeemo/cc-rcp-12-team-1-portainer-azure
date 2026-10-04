# Issues Encountered and Their Fixes

## Issue: Portainer showed as unhealthy
Cause: The healthcheck command in docker-compose.yml used wget, which is not
available inside the Portainer image.
Fix: Removed the healthcheck section entirely and ran docker compose up -d again.

## Issue: Permission denied (publickey) on SSH
Cause: The public key being used did not match the key registered on the VM.
Fix: Confirmed the correct key type (id_rsa instead of id_ed25519), or
re-uploaded the public key via "Reset SSH public key" in the Azure portal.

## Issue: Docker permissions after installation
Cause: Activating docker group membership requires logging out and back in.
Fix: exit, then reconnect via ssh.