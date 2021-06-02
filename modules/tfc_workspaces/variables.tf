variable "tfc_oath_token" {
  description = "Terraform Cloud OAuth Token for VCS_Repo Integration."
  type        = string
  sensitive   = true
}

variable "tfc_org_name" {
  description = "Terraform Cloud Organization Name."
  type        = string
}

variable "workspace_list" {
  description = "Workspaces (containing agent_pool, description, exec_mode, name, vcs_repo, working_dir)."
  type        = list(map(string))
}
