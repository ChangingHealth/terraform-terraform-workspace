output "vcs_workspace_id" {
  value = tfe_workspace.vcs.*.id
}

output "workspace_id" {
  value = tfe_workspace.no_vcs.*.id
}
