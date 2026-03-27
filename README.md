# infra-ops

Infrastructure provisioning repository for KVM/libvirt virtual machines, networks, and storage, managed with [OpenTofu](https://opentofu.org/). Designed for production-grade operations with compliance-aligned practices, CI-gated changes, and documented module interfaces.

## Scope

This repository defines the **infrastructure layer**: what gets created and destroyed. It is decoupled from configuration management concerns (e.g., Ansible, Salt). Current providers:

- **KVM/libvirt** (`dmacvicar/libvirt`) — VM provisioning on bare-metal hosts

Planned future expansion:
- **Hetzner Cloud** (`hetznercloud/hcloud`)
- Additional cloud providers as required

## Regulatory and Compliance Context

State files are encrypted at rest. Sensitive variables are never committed. Remote state backends use locking to prevent concurrent modifications. All changes flow through CI-gated pull requests.

## Quick Start

```bash
# Install OpenTofu: https://opentofu.org/docs/intro/install/

# Initialize the lab environment
cd environments/lab
tofu init
tofu plan
tofu apply
```

## Repository Structure

```
infra-ops/
├── CLAUDE.md                    # AI assistant guide
├── README.md                    # This file
├── LICENSE                      # Apache 2.0
├── .gitignore                   # OpenTofu-specific ignores
├── .github/
│   ├── copilot-instructions.md  # Copilot coding guidelines
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── SECURITY.md
│   ├── dependabot.yml
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml
│   │   ├── feature_request.yml
│   │   └── documentation.yml
│   └── workflows/
│       └── ci.yml               # tofu fmt, tofu validate, tflint
├── modules/
│   └── libvirt-vm/              # KVM/libvirt VM provisioning module
├── environments/
│   ├── lab/                     # Lab environment (local state)
│   └── production/              # Production environment (remote state)
└── scripts/
    └── init-backend.sh          # Backend initialization helper
```

## Common Commands

| Command | Purpose |
|---------|---------|
| `tofu init` | Initialize working directory and download providers |
| `tofu plan` | Preview changes before applying |
| `tofu apply` | Apply planned changes |
| `tofu destroy` | Destroy all managed resources |
| `tofu fmt` | Format HCL files |
| `tofu validate` | Validate configuration syntax |
| `tofu state list` | List resources in state |
| `tofu output` | Show output values |

## License

Apache 2.0 — see [LICENSE](LICENSE).