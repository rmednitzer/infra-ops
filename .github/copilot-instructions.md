# Copilot Coding Instructions for infra-ops

## Repository Purpose

`infra-ops` is an OpenTofu infrastructure provisioning repository. It manages KVM/libvirt VMs, networks, and storage. All tooling uses `tofu` commands. Never reference Terraform as the active tool.

---

## Repository Layout

```
modules/libvirt-vm/   — Reusable VM provisioning module (dmacvicar/libvirt)
environments/lab/     — Lab environment, local state backend
environments/production/ — Production environment, remote state backend
scripts/              — Operational helper scripts
```

---

## HCL Conventions

- 2-space indentation, no tabs
- One blank line between top-level blocks
- All variables must have `description` and `type`
- All outputs must have `description`
- Use `locals {}` for computed values, never inline complex expressions in resource arguments
- No hardcoded values in resource blocks — use variables or locals
- Files end with a single newline

---

## Module Design Rules

- Every module contains exactly: `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`, `README.md`
- Modules are self-contained and reusable — no environment-specific hardcoding
- All inputs are validated with `type` constraints
- All outputs are documented with `description`
- Provider versions are pinned in `versions.tf` using `~>` pessimistic constraint

---

## Variable Naming

- Use `snake_case` throughout
- Prefix variables by module context when in environment root configs (e.g., `libvirt_vm_vcpus`)
- Sensitive variables are marked `sensitive = true`

---

## Provider Pinning

Always pin both major and minor version using pessimistic constraint:

```hcl
required_providers {
  libvirt = {
    source  = "dmacvicar/libvirt"
    version = "~> 0.8"
  }
}
```

---

## State Safety

- Never run `tofu apply` without a prior `tofu plan`
- Never edit state files manually
- Remote backends must have locking enabled and encryption at rest
- Lab environments may use local backend

---

## Secrets

- Mark sensitive variables: `sensitive = true`
- Never hardcode credentials in `.tf` files or `terraform.tfvars`
- Use `TF_VAR_<name>` environment variables for secrets in CI
- Never commit `.auto.tfvars` or any `.tfvars` containing secrets

---

## OpenTofu Terminology

- Tool: **OpenTofu**
- Binary: **`tofu`**
- Commands: `tofu init`, `tofu plan`, `tofu apply`, `tofu destroy`, `tofu fmt`, `tofu validate`
- Do not write "terraform" as an active command or tool name anywhere
