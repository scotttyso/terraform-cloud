# Terraform Cloud - Agent Pool Module

## Usage

```hcl
module "tfc_agent_pool" {

  source = "terraform-cloud//modules/tfc_agent_pool"

  # omitted...
}
```

This module will add a Terraform Cloud agent pool data source.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.25.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.25.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_agent_pool.agent_pool](https://registry.terraform.io/providers/hashicorp/tfe/0.25.3/docs/data-sources/agent_pool) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool"></a> [agent\_pool](#input\_agent\_pool) | Terraform Cloud Agent Pool. | `string` | n/a | yes |
| <a name="input_tfc_org_name"></a> [tfc\_org\_name](#input\_tfc\_org\_name) | Terraform Cloud Organization Name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_agent_pool"></a> [tfc\_agent\_pool](#output\_tfc\_agent\_pool) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
