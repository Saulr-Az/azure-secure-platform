output "log_analytics_id" {
  description = "identificador del Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.this.id

}