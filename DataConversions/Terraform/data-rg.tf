################################################## RESOURCE GROUPS #######################################################

data "azurerm_resource_group" "origin" {
  count = var.create_rg ? 0 : 1
  # # name = local.rg-origin
}