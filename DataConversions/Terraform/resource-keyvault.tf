module "key_vault" {
  # # source                            = "../../../TerraformDemo-Modules/keyvault"
  source                            = "../../../../TerraformDemo-Modules/keyvault"
  count                             = var.enable_key_vault ? 1 : 0
  key_vault_name                    = lower(join("", [local.name-convention,"-", var.key_vault_name, "-", "${format("%02d", count.index + 1)}"]))
  # # resource_group_name               = data.azurerm_resource_group.origin.0.name
  location                          = var.location
  sku_name                          = var.kv_sku_name
  enable_rbac_authorization         = var.kv_enable_rbac_authorization
  enable_purge_protection           = var.kv_enable_purge_protection
  soft_delete_retention_days        = var.kv_soft_delete_retention_days
  
  #   depends_on = [
  #     module.azurerm_resource_group
  #   ]  
}