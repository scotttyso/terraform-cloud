module "tfc_agent_pool" {
  source       = "./modules/tfc_agent_pool"
  agent_pool   = var.agent_pool
  tfc_org_name = var.tfc_org_name
}

output "tfc_agent_pool" {
  value = module.tfc_agent_pool
}

module "tfc_workspaces" {
  source = "./modules/tfc_workspaces"
  depends_on = [
    module.tfc_agent_pool
  ]
  tfc_oath_token = var.tfc_oath_token
  tfc_org_name   = var.tfc_org_name
  workspace_list = [
    {
      auto_apply        = false
      agent_pool        = module.tfc_agent_pool.tfc_agent_pool
      description       = "Cloud IaC ACI Workspace"
      exec_mode         = "agent"
      name              = "Cloud_iac_ACI"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/ACIv3"
    },
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Workspace"
      exec_mode         = "remote"
      name              = "Cloud_iac_IKS"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKSv3"
    }
  ]
}

output "tfc_workspaces" {
  value = module.tfc_workspaces
}

module "tfc_variables_ACI" {
  source = "./modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace[0]
  variable_list = [
    {
      description = "APIC Host URL."
      key         = "apicHost"
      sensitive   = false
      value       = "https://wakanda-apic01.rich.ciscolabs.com"
    },
    {
      description = "APIC Username for Login."
      key         = "apicUser"
      sensitive   = false
      value       = "admin"
    },
    {
      description = "APIC Password for Login."
      key         = "apicPass"
      sensitive   = true
      value       = var.apicPass
    }
  ]
}

module "tfc_variables_IKS" {
  source = "./modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace[1]
  variable_list = [
    {
      description = "Intersight URL."
      key         = "endpoint"
      sensitive   = false
      value       = "https://www.intersight.com"
    },
    {
      description = "Intersight API Key for Authentication."
      key         = "api_key"
      sensitive   = true
      value       = var.api_key
    },
    {
      description = "Intersight Secret Key for Authentication."
      key         = "secret_key"
      sensitive   = true
      value       = var.secret_key
    },
    {
      description = "Intersight Organization Name."
      key         = "organization"
      sensitive   = false
      value       = "Wakanda"
    },
    {
      description = "Virtual Center (vCenter) Hostname."
      key         = "vc_target_name"
      sensitive   = false
      value       = "wakanda-vcenter.rich.ciscolabs.com"
    },
    {
      description = "vCenter Password for Authentication.  Note: This Must be the same password used for Intersight Target Registration."
      key         = "vc_password"
      sensitive   = true
      value       = var.vc_password
    },
    {
      description = "SSH User for Kubernetes Cluster Login."
      key         = "ssh_user"
      sensitive   = false
      value       = "iksadmin"
    },
    {
      description = "SSH Key for Kubernetes Cluster Authentication."
      key         = "ssh_key"
      sensitive   = true
      value       = var.ssh_key
    },
    {
      description = "Tags to Assign to the Kubernetes Cluster."
      key         = "tags"
      sensitive   = false
      value       = "test"
    }
  ]
}
