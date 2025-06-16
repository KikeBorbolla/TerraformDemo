# Storage account Blob module for Log
module "storage_account_blob_log"{
  # # source                            = "../../../TerraformDemo-Modules/storage-account-blob" 
  source                            = "../../../../TerraformDemo-Modules/storage-account-blob-hola-aqui" 
  count                             = var.enable_storage_blob ? 1 : 0
  storage_account_name              = lower(join("", [local.name-convention,var.storage_account_blob_name]))
  resource_group_name               = var.create_rg ? local.rg-origin : data.azurerm_resource_group.origin.0.name
  location                          = var.location
  public_network_access_enabled     = var.sa_public_network_access_enabled
  access_tier                       = "Cool"
  container_names                   = var.container_names
  account_replication_type          = var.account_replication_type
  tags                              = local.tags
}