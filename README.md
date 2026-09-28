# Internal Container Management Platform

**Project #12 · CC-RCP-12 · Team: CC-RCP-12-Team-1**

A self-hosted [Portainer](https://www.portainer.io/) environment on Microsoft Azure that gives internal teams one place to view, operate, and monitor Docker workloads. Infrastructure is provisioned with Terraform, the host is prepared with Bash automation, and Portainer runs as a Docker Compose stack.

---

## Team

| Member | Background | Responsibility |
|---|---|---|
| Saeed Alzahrani | IT Graduate | Azure infrastructure and security hardening |
| Ruba Almatag | CS and Technology Graduate | Bash automation and Compose deployment |
| Lama Alshamrani | CS Graduate | Testing and operations documentation |

---

## Problem

Without a dedicated management interface, teams rely on manual host administration or fragmented tooling. The platform must provide:

- Centralized visibility into running services
- Easier operational control for container workloads
- A consistent deployment pattern for internal apps
- Less time spent on manual troubleshooting and maintenance

---

## Scope

**In scope**
- Azure infrastructure provisioning with Terraform
- VM hosting Portainer
- Docker Compose deployment of the Portainer stack
- Container management UI and base operational features
- Bash scripts for automation and startup
- Basic operational documentation

**Out of scope (version one)**
- Large-scale Kubernetes management
- Advanced enterprise fleet management beyond baseline features

---

## Architecture

```
Internal users (HTTPS)
        │
        ▼
┌─────────────── Azure ───────────────────────────────┐
│  Resource Group · VNet + Subnet · Network Security Group │
│                                                      │
│   ┌──────── Azure VM (Linux) · Docker Engine ─────┐  │
│   │  Portainer (Compose stack)                     │  │
│   │  Internal application containers               │  │
│   │  Persistent storage (Portainer config & data)  │  │
│   └────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────┘
```

Single-node, internal-use deployment. Access to the management UI is restricted by NSG rules.

---

## Repository structure

```
.
├── terraform/     # Resource group, VNet/subnet, NSG, VM, storage
├── scripts/       # Bash automation (setup, install, start, health, logs, cleanup)
├── compose/       # docker-compose.yml and .env.example
└── docs/          # Operations guide and troubleshooting
```

### Planned scripts

| Script | Purpose |
|---|---|
| `setup-env.sh` | Prepare the host and environment variables |
| `install-docker.sh` | Install Docker Engine |
| `start-stack.sh` | Start the Portainer Compose stack |
| `health-check.sh` | Check that services are running and healthy |
| `logs.sh` | Review logs for troubleshooting |
| `cleanup.sh` | Clean up or restart the deployment |

---

## Deployment flow (planned)

1. Provision Azure resources with Terraform (`terraform/`)
2. Connect to the VM and run the setup and Docker install scripts (`scripts/`)
3. Copy `compose/.env.example` to `.env` and fill in real values
4. Start the stack with the start script (runs `docker compose up -d`)
5. Run the health check and open the Portainer UI from an allowed network

> Exact commands will be added as each component is completed.

---

## Security notes

- Never commit real secrets. Only `.env.example` with placeholder values goes into Git; `.env` is git-ignored.
- The Portainer UI is not exposed to the public internet; access is limited by NSG rules.
- The host is hardened: minimal packages, patched OS, least-privilege accounts.
- Maintenance and recovery steps are documented in `docs/`.

---

## Deliverables

- [ ] Terraform configuration files
- [ ] Bash automation scripts
- [ ] Docker Compose deployment definition
- [ ] Environment variable templates
- [ ] Operations documentation
- [ ] Basic troubleshooting guidance

## Acceptance criteria

- [ ] Azure infrastructure is created with Terraform
- [ ] Portainer is deployed using Bash automation
- [ ] Docker Compose starts the environment reliably
- [ ] The UI is accessible for operational management tasks
- [ ] Deployment and operational workflow are documented clearly
- [ ] The design reflects a realistic internal container management use case

---

## Timeline

| Week | Work |
|---|---|
| 3 | Proposal presentation |
| 4 | Azure design and Terraform provisioning |
| 5 | Bash automation and Portainer deployment |
| 6 | Operational testing, hardening, and documentation |
| 7 | Final presentation and handover |
