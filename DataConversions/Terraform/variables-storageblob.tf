#STORAGE ACCOUNT BLOB LOG
variable "storage_account_blob_name"{
  description = "name of the storage account"
  default     = ""
}

variable "container_names"{
  description = "names of the storage account container"
  default     = []
}

variable "blob_name"{
  description = "name of the blob container within storage account"
  default     = ""
}

variable "account_replication_type"{
  default     = "LRS"
}

variable "sa_public_network_access_enabled"{
  description = "enable/disable public access"
  default     = false
}