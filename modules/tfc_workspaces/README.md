# Terraform Cloud - Workspace Module

## Usage

```hcl
module "tfc_workspaces" {

  source = "terraform-cloud//modules/tfc_workspaces"

  # omitted...
}
```

This module will Create a Terraform Cloud Workspace.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfc_oath_token"></a> [tfc\_oath\_token](#input\_tfc\_oath\_token) | Terraform Cloud OAuth Token for VCS\_Repo Integration. | `string` | n/a | yes |
| <a name="input_tfc_org_name"></a> [tfc\_org\_name](#input\_tfc\_org\_name) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_workspace_list"></a> [workspace\_list](#input\_workspace\_list) | Workspaces (containing agent\_pool, description, exec\_mode, name, vcs\_repo, working\_dir). | `list(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfe_workspace"></a> [tfe\_workspace](#output\_tfe\_workspace) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
