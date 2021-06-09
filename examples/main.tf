module "tfc_agent_pool" {
  source       = "../modules/tfc_agent_pool"
  agent_pool   = var.agent_pool
  tfc_org_name = var.tfc_org_name
}

output "tfc_agent_pool" {
  value = module.tfc_agent_pool
}

module "tfc_workspaces_CL1" {
  source = "../modules/tfc_workspaces"
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
      name              = "cloud-iac-cl1_ACI"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/ACI_CL1"
    },
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Workspace"
      exec_mode         = "remote"
      name              = "cloud-iac-cl1_IKS"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKS_CL1"
    },
  ]
}

output "tfc_workspaces_CL1" {
  value = module.tfc_workspaces_CL1
}

module "tfc_workspaces_CL1_outputs" {
  source = "../modules/tfc_workspaces"
  tfc_oath_token = var.tfc_oath_token
  tfc_org_name   = var.tfc_org_name
  workspace_list = [
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Outputs"
      exec_mode         = "remote"
      name              = "cloud-iac-cl1_IKS-outputs"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKS_CL1_Outputs"
    },
  ]
}

output "tfc_workspaces_CL1_outputs" {
  value = module.tfc_workspaces_CL1_outputs
}

module "tfc_variables_ACI_CL1" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL1
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL1.tfe_workspace[0]
  variable_list = [
    {
      description = "APIC Host URL."
      hcl         = false
      key         = "apicHost"
      sensitive   = false
      value       = "https://wakanda-apic01.rich.ciscolabs.com"
    },
    {
      description = "APIC Username for Login."
      hcl         = false
      key         = "apicUser"
      sensitive   = false
      value       = "admin"
    },
    {
      description = "APIC Password for Login."
      hcl         = false
      key         = "apicPass"
      sensitive   = true
      value       = var.apicPass
    }
  ]
}

module "tfc_variables_IKS_CL1" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL1
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL1.tfe_workspace[1]
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

module "tfc_variables_IKS_CL1_Outputs" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL1
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL1_outputs.tfe_workspace[0]
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

module "tfc_workspaces_CL2" {
  source = "../modules/tfc_workspaces"
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
      name              = "cloud-iac-cl2_ACI"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/ACI_CL2"
    },
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Workspace"
      exec_mode         = "remote"
      name              = "cloud-iac-cl2_IKS"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKS_CL2"
    },
  ]
}

output "tfc_workspaces_CL2" {
  value = module.tfc_workspaces_CL2
}

module "tfc_workspaces_CL2_outputs" {
  source = "../modules/tfc_workspaces"
  tfc_oath_token = var.tfc_oath_token
  tfc_org_name   = var.tfc_org_name
  workspace_list = [
    {
      auto_apply        = false
      agent_pool        = ""
      description       = "Cloud IaC IKS Outputs"
      exec_mode         = "remote"
      name              = "cloud-iac-cl2_IKS-outputs"
      queue_all_runs    = false
      terraform_version = "0.15.4"
      vcs_repo          = "scotttyso/iac"
      working_dir       = "demo/IKS_CL2_Outputs"
    },
  ]
}

output "tfc_workspaces_CL2_outputs" {
  value = module.tfc_workspaces_CL2_outputs
}

module "tfc_variables_ACI_CL2" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL2
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL2.tfe_workspace[0]
  variable_list = [
    {
      description = "APIC Host URL."
      hcl         = false
      key         = "apicHost"
      sensitive   = false
      value       = "https://wakanda-apic01.rich.ciscolabs.com"
    },
    {
      description = "APIC Username for Login."
      hcl         = false
      key         = "apicUser"
      sensitive   = false
      value       = "admin"
    },
    {
      description = "APIC Password for Login."
      hcl         = false
      key         = "apicPass"
      sensitive   = true
      value       = var.apicPass
    }
  ]
}

module "tfc_variables_IKS_CL2" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL2
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL2.tfe_workspace[1]
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

module "tfc_variables_IKS_CL2_Outputs" {
  source = "../modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces_CL2
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces_CL2_outputs.tfe_workspace[0]
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
