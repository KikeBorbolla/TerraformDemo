#ENABLE RESOURCES
vm_count                          = 0       #Set 0 to disable

#PREFIXES
prefix_env                        = "Dev_sonrisas"
create_rg                         = false


tags = {
  Application                     = "DataConversions"
  Environment                     = "Dev_sonrisas"
  x-data-sensitivity              = "Confidential"
}
rg_core_name                      = "RG-Israel"

#LOG ANALYTICS
law_sku                            = "PerGB2018"
retention_in_days                  = 30

#KEYVAULT
kv_enable_purge_protection         = false
kv_soft_delete_retention_days      = 7

#VIRTUAL MACHINE
vm_size                            = "Standard_D2s_v3"

#STORAGE ACCOUNT ADLS
storage_accounts_adls = {
    storage1 = {
      storage_prefix          = "stg"
      storage_acc_adls_name   = "log"
      index_value             = "01"
      adls_datalake_name      = ["adls1container","adls2container"]
      public_network_access_enabled   = true

    },
    storage2 = {
      storage_prefix          = "stg"
      storage_acc_adls_name   = "log"
      index_value             = "02"
      adls_datalake_name      = ["hola","mundo"]
      public_network_access_enabled   = true

    }
}

#Data Factory
data_factory_name                  = "Adf"
enable_datafactory_pe              = false
create_private_dns_zone_datafactory= false 
create_private_dns_zone_portal     = false 
df_public_network_enabled          = false
df_managed_virtual_network_enabled = false
df_diagnostic_setting_enabled      = false

#SQL SERVER 
sqlserver_name                     = "sql"
sql_server_version                 = "12.0"
sql_administrator_login            = "sqladmin"
sql_administrator_login_password   = ""
database_name                      = "sqldb"
sql_db_sku_name                    = "S0"
sql_db_database_license_type       = null
AAD_authentication_only_enabled    = false
sqldb_retention_days               = 7
sqldb_backup_frequency             = 24
sql_public_network_access_enabled  = false
sqldb_collation                    = "Latin1_General_100_CI_AS_SC_UTF8"