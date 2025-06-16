#ENABLE RESOURCES
vm_count                          = 0       #Set 0 to disable

#PREFIXES
prefix_env                        = "Prod"

tags = {
  Application                     = "data"
  Environment                     = "Prod"
  x-data-sensitivity              = "Confidential"
}

#BASTION
bastion_subnet_address_prefixes    = ["172.24.23.0/28"]

#LOG ANALYTICS
law_sku                            = "PerGB2018"
retention_in_days                  = 90

#KEYVAULT
kv_enable_purge_protection         = true
kv_soft_delete_retention_days      = 7

#SYNAPSE

#SYNAPSE KV INTEGRATION

#DATABRICKS
dbricks_private_subnet_address_prefixes       = ["172.24.18.0/23"]
dbricks_public_subnet_address_prefixes        = ["172.24.16.0/23"]

#DATABRICKS CLUSTER
dbricks_autotermination_minutes               = 20
dbricks_autoscale_min_workers                 = 1
dbricks_autoscale_max_workers                 = 4
dbricks_node_type                             = "Standard_DS3_v2"

#EVENTHUB NAME SPACE
eventhub_namespace_name                       = "evh"  ##"EHN"
eventhub_namespace_capacity                   = "1"
enable_eventhub_namespace_pe                  = true
eventhub_namespace_auto_inflate_enabled       = true
eventhub_namespace_maximum_throughput_units   = 3
eventhub_public_network_access_enabled        = true

#EVENTHUBS
eventhub_instances = {
    eventhub1 = {
      eventhub_prefix                      = ""
      eventhub_name                        = "eh"
      eventhub_index_value                 = "01"
      eventhub_partition_count             = 3
      eventhub_message_retention           = 7
      eventhub_capture_enabled             = true
      eventhub_capture_encoding            = "Avro"
      eventhub_capture_interval_in_seconds = "300"
      eventhub_capture_size_limit_in_bytes = "314572800"
      eventhub_capture_skip_empty_archives = false
      eventhub_storage_account_name        = "storage_stage"    # data-resources file  - Reference.
      eventhub_capture_container_name      = "data1" ## ADLS Stage.
      eventhub_capture_archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
      eventhub_consumer_groups_enabled     = true
      eventhub_consumer_groups             = ["consumer_group1", "consumer_group2"]
    }
    eventhub2 = {
      eventhub_prefix                      = ""
      eventhub_name                        = "eh"
      eventhub_index_value                 = "02"
      eventhub_partition_count             = 4
      eventhub_message_retention           = 10
      eventhub_capture_enabled             = true
      eventhub_capture_encoding            = "Avro"
      eventhub_capture_interval_in_seconds = "600"
      eventhub_capture_size_limit_in_bytes = "524288000"
      eventhub_capture_skip_empty_archives = false
      eventhub_storage_account_name        = "storage_logs"    # data-resources file  - Reference.
      eventhub_capture_container_name      = "data2" ## ADLS Stage.
      eventhub_capture_archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
      eventhub_consumer_groups_enabled     = true
      eventhub_consumer_groups             = ["consumer_group3", "consumer_group4"]
    }
}

#STORAGE ACCOUNT ADLS

#VIRTUAL MACHINE
vm_size                            = "Standard_D2s_v3"

#STORAGE ACCOUNT BLOB LOG

#INTEGRATION VARIABLES
synuser_login_object_id   = ""

#SPN IDS
aad_group_object_id       = ""
purview_object_id         = ""
databricks_spn_id         = ""

#STORAGE ACCOUNT ADLS
storage_accounts_adls = {
    storage1 = {
      storage_prefix          = "stg"
      storage_acc_adls_name   = "raw"
      index_value             = "01"
      adls_datalake_name      = ["landing","conformed"]
      create_private_dns_zone = false
      create_public_ip        = false
      create_dns_vnet_link    = false
      public_ip_name          = "pip"
      dns_record_name         = "dns_rec"
      pendp_name              = "PeRaw"
      enable_time_sleep       = true

      enable_storage_adls_pe  = true
      public_network_access_enabled   = false
      account_replication_type  = "RAGRS"
      blob_properties           = {
          delete_retention_policy = null
          container_delete_retention_policy = null
          versioning_enabled    = false
      }
      storage_enable_management_policy = true
      storage_management_policy_rule = {
        name             = "adls_raw_mgmt_policy"
        enabled          = true
        filters = {
            blob_types     = ["blockBlob"]
        }
        actions = {
            base_blob = {
            tier_to_cool_after_days_since_modification_greater_than    = 365
            # # tier_to_archive_after_days_since_modification_greater_than = 50
            # # delete_after_days_since_modification_greater_than          = 100
            }
        }
      }      

    },
    storage2 = {
      storage_prefix          = "stg"
      storage_acc_adls_name   = "enrsen"
      index_value             = "01"
      adls_datalake_name      = ["enriched-sensitive","curated-sensitive"]
      create_private_dns_zone = false
      create_public_ip        = false
      create_dns_vnet_link    = false
      public_ip_name          = "pip"
      dns_record_name         = "dns_rec"
      pendp_name              = "PeEnriched"
      enable_time_sleep       = true

      enable_storage_adls_pe  = true
      public_network_access_enabled   = false
      account_replication_type  = "RAGRS"
      blob_properties           = {
          delete_retention_policy = null
          container_delete_retention_policy = null
          versioning_enabled    = false
      }
      storage_enable_management_policy = true
      storage_management_policy_rule = {
        name             = "adls_sen_mgmt_policy"
        enabled          = true
        filters = {
            blob_types     = ["blockBlob"]
        }
        actions = {
            base_blob = {
            tier_to_cool_after_days_since_modification_greater_than    = 365
            # # tier_to_archive_after_days_since_modification_greater_than = 50
            # # delete_after_days_since_modification_greater_than          = 100
            }
        }
      }  

    },
    storage3 = {
      storage_prefix          = "stg"
      storage_acc_adls_name   = "enrgen"
      index_value             = "01"
      adls_datalake_name      = ["enriched-general","curated-general"]
      create_private_dns_zone = false
      create_public_ip        = false
      create_dns_vnet_link    = false
      public_ip_name          = "pip"
      dns_record_name         = "dns_rec"
      pendp_name              = "PeDevelop"
      enable_time_sleep       = true

      enable_storage_adls_pe  = true
      public_network_access_enabled   = false
      account_replication_type  = "RAGRS"
      blob_properties           = {
          delete_retention_policy = null
          container_delete_retention_policy = null
          versioning_enabled    = false
      }
      storage_enable_management_policy = true
      storage_management_policy_rule = {
        name             = "adls_gen_mgmt_policy"
        enabled          = true
        filters = {
            blob_types     = ["blockBlob"]
        }
        actions = {
            base_blob = {
            tier_to_cool_after_days_since_modification_greater_than    = 365
            # # tier_to_archive_after_days_since_modification_greater_than = 50
            # # delete_after_days_since_modification_greater_than          = 100
            }
        }
      }        

    }
}

storage_accounts_adls_paas = {
    storage1 = {
      storage_prefix          = "stg"
      storage_acc_adls_name   = "paas"
      index_value             = "01"
      adls_datalake_name      = ["synapse"]
      create_private_dns_zone = false
      create_public_ip        = false
      create_dns_vnet_link    = false
      public_ip_name          = "pip"
      dns_record_name         = "dns_rec"
      pendp_name              = "PePaas"
      enable_time_sleep       = true
      storage_acc_adls_name_lnk   = "StoragePaas"

      enable_storage_adls_pe  = true
      public_network_access_enabled   = false
      account_replication_type  = "RAGRS"
      blob_properties           = {
          delete_retention_policy = null
          container_delete_retention_policy = null
          versioning_enabled    = false
      }
      storage_enable_management_policy = true
      storage_management_policy_rule = {
        name             = "adls_paas_mgmt_policy"
        enabled          = true
        filters = {
            blob_types     = ["blockBlob"]
        }
        actions = {
            base_blob = {
            tier_to_cool_after_days_since_modification_greater_than    = 365
            # # tier_to_archive_after_days_since_modification_greater_than = 50
            # # delete_after_days_since_modification_greater_than          = 100
            }
        }
      }      

    }
}

#COSMOS DB
cosmosdb_name                      = "cdb"
offer_type                         = "Standard"
kind                               = "MongoDB"
total_throughput_limit             = -1
cosmosdb_enable_free_tier          = false
cosmosdb_backup_type               = "Continuous"
cosmosdb_backup_tier               = "Continuous7Days"
consistency_level                  = "Session"
cosmosdb_identity                  = {
    type         = "SystemAssigned"
    identity_ids = null 
}
cosmosdb_create_sql_database       = false
cosmosdb_sqldb_name                = "DB"
# # cosmosdb_sqldb_throughput          = 1000
sql_container_name                 = []
sql_container_throughput           = 400
enable_cosmosdb_pe                 = false
cosmosdb_public_network_access_enabled = true
create_mongo_db                    = true
cosmos_mongodb_name                = "mongo"
cosmos_mongodb_throughput          = 400
cosmos_mongodb_autoscale_settings  = null

#COSMOSDB MONITOR
cosmosdb_monitor_metric_alert_enabled   = true
cosmosdb_monitor_metric_alert_name      = "cdb-monitor-data-01"
cosmosdb_monitor_description            = "testing out azure monitor for cosmosdb"
cosmosdb_monitor_severity               = 3
cosmosdb_monitor_target_resource_type   = "Microsoft.DocumentDB/databaseAccounts"
cosmosdb_monitor_enabled                = true
cosmosdb_monitor_auto_mitigate          = true
cosmosdb_monitor_frequency              = "PT1M"
cosmosdb_monitor_target_resource_location= null
cosmosdb_monitor_window_size            = "PT5M"
cosmosdb_monitor_criteria               = {
    metric_namespace = "Microsoft.DocumentDB/databaseAccounts"
    metric_name      = "TotalRequestUnits"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
}
cosmosdb_monitor_dynamic_criteria       = null
cosmosdb_monitor_action_groups          = null
#COSMOSDB MONITOR ACTION GROUP
cosmosdb_monitor_enable_action_group             = true
cosmosdb_monitor_ag_name                         = "ag-cdb-wus-ing-dev01"
cosmosdb_monitor_ag_short_name                   = "ag_cdb"
cosmosdb_monitor_ag_enabled                      = true
cosmosdb_monitor_ag_arm_role_receiver            = null
cosmosdb_monitor_ag_automation_runbook_receiver  = null
cosmosdb_monitor_ag_azure_app_push_receiver      = null
cosmosdb_monitor_ag_azure_function_receiver      = null
cosmosdb_monitor_ag_email_receivers              = null
cosmosdb_monitor_ag_event_hub_receiver           = null
cosmosdb_monitor_ag_itsm_receiver                = null
cosmosdb_monitor_ag_logic_app_receiver           = null
cosmosdb_monitor_ag_sms_receiver                 = null
cosmosdb_monitor_ag_voice_receiver               = null
cosmosdb_monitor_ag_webhook_receiver             = null


#LINUX VM SCALE SETS
linux_vm_scale_set_name            = "test-vm-scale-set"
linux_vm_scale_set_sku             = "Standard_F2"
linux_vm_scale_set_instances       = 1
linux_vm_scale_set_admin_username  = "adminuser"
linux_vm_scale_set_disable_password_authentication = false
linux_vm_scale_set_source_image_id = null
linux_vm_scale_set_storage_account_type= "StandardSSD_LRS"
linux_vm_scale_set_caching         = "ReadWrite"
linux_vm_scale_set_network_interface_name= "test-nic-ethan"
linux_vm_scale_set_dns_servers     = null
linux_vm_scale_set_enable_ip_forwarding= false
linux_vm_scale_set_network_security_group_id= null
linux_vm_scale_set_enable_accelerated_networking= false
linux_vm_scale_set_ip_configuration_name= "test-ip-config-ethan"
create_vm_image                    = false
linux_vm_name                      = "already-existing-vm"
linux_vm_scale_set_vm_image_name   = "already-existing-image"
linux_vm_scale_set_create_vm_image = false