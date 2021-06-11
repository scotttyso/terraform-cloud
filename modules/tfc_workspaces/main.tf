resource "tfe_workspace" "workspace" {
  auto_apply          = var.workspace_list[count.index].auto_apply
  agent_pool_id       = var.workspace_list[count.index].agent_pool
  description         = var.workspace_list[count.index].description
  execution_mode      = var.workspace_list[count.index].exec_mode
  name                = var.workspace_list[count.index].name
  global_remote_state = var.workspace_list[count.index].global_remote_state
  organization        = var.tfc_org_name
  queue_all_runs      = var.workspace_list[count.index].queue_all_runs
  terraform_version   = var.workspace_list[count.index].terraform_version
  vcs_repo {
    identifier     = var.workspace_list[count.index].vcs_repo
    oauth_token_id = var.tfc_oath_token
  }
  working_directory   = var.workspace_list[count.index].working_dir
  count               = length(var.workspace_list)
}
