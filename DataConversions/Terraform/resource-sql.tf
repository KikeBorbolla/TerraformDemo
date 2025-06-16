resource "random_password" "sql_password" {
  length = 20
  special = true
}

module "sql_database"{
  source                            = "../../../TerraformDemo-Modules/databases/mssql_db"
  count                             = var.enable_sqlserver ? 1 : 0
  sqlserver_name                    = lower(join("-", [local.name-convention, var.sqlserver_name, "${format("%02d", count.index + 1)}"]))
  resource_group_name               = data.azurerm_resource_group.origin.0.name
  location                          = "Central US"
  public_network_access_enabled     = var.sql_public_network_access_enabled
  version_sql                       = var.sql_server_version
  admin_username                    = var.sql_administrator_login
  admin_password                    = random_password.sql_password.result
  database_name                     = lower(join("-", [local.name-convention, var.database_name, "${format("%02d", count.index + 1)}"]))
  collation                         = var.sqldb_collation
  sku_name                          = var.sql_db_sku_name
  database_license_type             = var.sql_db_database_license_type

  #AAD authentication_only
  AAD_authentication_only_enabled     = var.AAD_authentication_only_enabled
  AAD_authentication_login_username   = null #data.azurerm_key_vault_secret.AAD_authentication_login_username[0].value
  AAD_authentication_login_object_id  = null #data.azurerm_key_vault_secret.AAD_authentication_login_object_id[0].value

  tags                              = var.tags
}