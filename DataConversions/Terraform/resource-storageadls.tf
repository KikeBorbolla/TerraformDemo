module "storage_account_adls_services"{
  # # source                            = "../../../TerraformDemo-Modules/storage-account-adls"
  source                            = "../../../TerraformDemo-Modules/storage-account-adls_aquiestoy"
  for_each                          = var.enable_storage_adls ? var.storage_accounts_adls : {}
  storage_account_name              = lower(join("", [local.name-convention, each.value.storage_prefix, each.value.storage_acc_adls_name, each.value.index_value]))
  resource_group_name               = var.create_rg ? local.rg-origin : data.azurerm_resource_group.origin.0.name
  location                          = var.location
  datalake_names                    = each.value.adls_datalake_name
  tags                              = local.tags  

  public_network_access_enabled     = each.value.public_network_access_enabled
  
}