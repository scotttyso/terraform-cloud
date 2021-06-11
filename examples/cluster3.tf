module "tfc_workspaces_CL3" {
  source = "../modules/tfc_workspaces"
  depends_on = [
    module.tfc_agent_pool
  ]
  tfc_oath_token = var.tfc_oath_token
  tfc_org_name   = var.tfc_org_name
  workspace_list = [
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Workspace"
      exec_mode         = "remote"
      name              = "cloud-iac-cl3_IKS"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKS_CL3"
    },
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Outputs"
      exec_mode         = "remote"
      name              = "cloud-iac-cl3_IKS-outputs"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKS_CL3_Outputs"
    },
  ]
}

output "tfc_workspaces_CL3" {
  value = module.tfc_workspaces_CL3
}

module "tfc_variables_IKS_CL3" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL3
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL3.tfe_workspace[0]
  variable_list = [
    {
      description = "Intersight URL."
      hcl         = false
      key         = "endpoint"
      sensitive   = false
      value       = "https://www.intersight.com"
    },
    {
      description = "Intersight API Key for Authentication."
      hcl         = false
      key         = "api_key"
      sensitive   = true
      value       = var.api_key
    },
    {
      description = "Intersight Secret Key for Authentication."
      hcl         = false
      key         = "secret_key"
      sensitive   = true
      value       = var.secret_key
    },
    {
      description = "Intersight Organization Name."
      hcl         = false
      key         = "organization"
      sensitive   = false
      value       = "Wakanda"
    },
    {
      description = "Virtual Center (vCenter) Hostname."
      hcl         = false
      key         = "vc_target_name"
      sensitive   = false
      value       = "wakanda-vcenter.rich.ciscolabs.com"
    },
    {
      description = "vCenter Password for Authentication.  Note: This Must be the same password used for Intersight Target Registration."
      hcl         = false
      key         = "vc_password"
      sensitive   = true
      value       = var.vc_password
    },
    {
      description = "SSH User for Kubernetes Cluster Login."
      hcl         = false
      key         = "ssh_user"
      sensitive   = false
      value       = "iksadmin"
    },
    {
      description = "SSH Key for Kubernetes Cluster Authentication."
      hcl         = false
      key         = "ssh_key"
      sensitive   = true
      value       = var.ssh_key
    },
    {
      description = "Tags to Assign to the Kubernetes Cluster."
      hcl         = true
      key         = "tags"
      sensitive   = false
      value       = "[ { key = \"Terraform\", value = \"Module\" }, { key = \"Owner\", value = \"tyscott\" } ]"
    }
  ]
}

module "tfc_variables_IKS_CL3_Outputs" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL3
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL3.tfe_workspace[1]
  variable_list = [
    {
      description = "Intersight URL."
      hcl         = false
      key         = "endpoint"
      sensitive   = false
      value       = "https://www.intersight.com"
    },
    {
      description = "Intersight API Key for Authentication."
      hcl         = false
      key         = "api_key"
      sensitive   = true
      value       = var.api_key
    },
    {
      description = "Intersight Secret Key for Authentication."
      hcl         = false
      key         = "secret_key"
      sensitive   = true
      value       = var.secret_key
    },
    {
      description = "Intersight Organization Name."
      hcl         = false
      key         = "organization"
      sensitive   = false
      value       = "Wakanda"
    }
  ]
}
