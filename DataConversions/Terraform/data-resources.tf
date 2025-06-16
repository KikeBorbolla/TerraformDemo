# data "azurerm_key_vault" "key_vault" {
#   name                = local.kv_core
#   resource_group_name = local.rg-core-name
# }

# data "azurerm_storage_account" "storageadls_develop" {
#   name                = local.storageadls_name_develop
#   resource_group_name = local.rg-datalake-name
# }