# Security Measures Applied

- Restricted SSH access to the personal IP address only (via the
  source_ssh_allowed variable in Terraform)
- Enabled unattended-upgrades for automatic security updates
- Changed the default Portainer admin password to a strong one
- Prevented committing any files with sensitive data (.env) via .gitignore