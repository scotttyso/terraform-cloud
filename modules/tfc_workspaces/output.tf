output "tfe_workspace_id" {
  value = tfe_workspace.workspace.*.id
}

output "tfe_workspace_name" {
  value = tfe_workspace.workspace.*.name
}
