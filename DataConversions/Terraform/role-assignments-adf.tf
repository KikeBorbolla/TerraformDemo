
# # resource "azurerm_role_assignment" "adf_access_to_develop_adls_contributor" {
# #   count                = var.enable_adf ? 1 : 0
# #   scope                = data.azurerm_storage_account.develop_datalake.id
# #   role_definition_name = "Storage Blob Data Contributor"
# #   principal_id         = module.data_factory.0.identity.0.principal_id
# # }