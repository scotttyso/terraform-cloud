output "tfe_workspace_id" {
  value = values(tfe_workspace.workspace)[*].id
}

output "tfe_workspace_name" {
  value = values(tfe_workspace.workspace)[*].name
}
