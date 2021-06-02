# Terraform Cloud - Variables Module

## Usage

```hcl
module "tfc_variables" {

  source = "terraform-cloud//modules/tfc_variables"

  # omitted...
}
```

This module will create Variables in a Terraform Cloud Workspace.

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
| [tfe_variable.variable](https://registry.terraform.io/providers/hashicorp/tfe/0.25.3/docs/resources/variable) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_category"></a> [category](#input\_category) | Whether this is a Terraform or environment variable. | `string` | n/a | yes |
| <a name="input_variable_list"></a> [variable\_list](#input\_variable\_list) | Variable List (containing category, description, key, sensitive, value, workspace\_id). | `list(map(string))` | n/a | yes |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | Terraform Workspace to assign the variables. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
