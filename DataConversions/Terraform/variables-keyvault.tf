#KEYVAULT
variable "key_vault_name"{
  description = "Key Vault name"
  type        = string
  default     = ""
}

variable "key_vault_name_lnk"{
  description = "Key Vault name identifier"
  type        = string
  default     = ""
}

# # variable "kv_sku_name"{
# #   description = "The Name of the SKU used for this Key Vault"
# #   type        = string
# #   default     = "standard"
# # }

variable "kv_enable_rbac_authorization"{
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions"
  default     = false
}

variable "kv_enable_purge_protection"{
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = false
}

variable "kv_soft_delete_retention_days"{
  type        = string
  description = "The number of days that items should be retained for once soft-deleted."
  default     = 7
}

variable "enable_keyvault_pe" {
  type        = bool
  default     = false
  description = "Enable the deployment of private endpoint with keyvault"
}

variable "kv_public_network_access_enabled"{
  default = false
}