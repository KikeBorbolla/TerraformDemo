#ENABLE RESOURCES
enable_key_vault                  = false 
enable_adf                        = false
enable_sqlserver                  = false
enable_storage_blob               = false
enable_storage_adls               = false
enable_sqlmi                      = false
enable_postgresql                 = false
vm_count                          = 0       #Set 0 to disable
create_rg                         = false

#NAMING CONVENTION VARIABLES
#PREFIXES
prefix                            = "dconv"
prefix_location                   = "sc"

#GENERAL
location = "South Central US"

use_existing_rg_pe                = true
use_existing_vnet_pe              = false
use_existing_subnet_pe            = false

#VNET
virtual_network_name              = "vnet"


#KEYVAULT
key_vault_name                     = "Kv"
# # kv_sku_name                        = "premium"
kv_enable_rbac_authorization       = true
kv_enable_purge_protection         = true  ##false
kv_soft_delete_retention_days      = 2
enable_keyvault_pe                 = false
key_vault_name_lnk                 = "lnk-Kv"
kv_public_network_access_enabled   = false

#STORAGE ACCOUNT BLOB LOG
storage_account_blob_name = "blob"
container_names            = ["hola","mundo"]
enable_storage_blob_pe    = true
storage_account_blob_name_lnk = "Storageblob"
sa_public_network_access_enabled   = true


#SQLMI
sql_mi_name                        = "sql-mi"
sql_mi_license_type                = "BasePrice"
# # sql_mi_sku_name                    = "GP_Gen5"
sql_mi_storage_size_in_gb          = 32
sql_mi_vcores                      = 4
sql_mi_administrator_login         = "mradministrator"
sql_mi_administrator_login_password= "thisIsDog11"
sql_mi_create_nsg                  = false
sql_mi_create_vnet                 = false
sql_mi_create_subnet               = false
sql_mi_naming_rules                = null
sql_mi_subnet_cidrs                = null
sql_mi_service_endpoints           = null
sql_mi_subnet_allow_internet_outbound= null
sql_mi_subnet_allow_lb_inbound     = null
sql_mi_subnet_allow_vnet_inbound   = null
sql_mi_subnet_allow_vnet_outbound  = null
sql_mi_subnet_settings             = null
sql_mi_create_udr                  = false
sql_mi_bgp_route_propagation_enabled= null
sql_mi_udr_routes                  = null