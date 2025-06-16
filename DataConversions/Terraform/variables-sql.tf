variable "enable_sqlserver"{
  type        = bool
  default     = false
}

#SQL SERVER

variable "sqlserver_name"{
  description = "name of the sql server"
  default     = ""
}

variable "sql_server_version"{
  default     = ""
}

variable "sql_administrator_login" {
  type        = string
  description = "login credential to SQL"
  default     = ""
}

variable "sql_administrator_login_password"{
  type        = string
  description = "password credential to SQL"
  default     = ""
}

variable "database_name"{
  description = "SQL database name"
  type        = string
  default     = ""
}

variable "sqldb_collation"{
  description = "Specifies the collation of the database"
  default     = "Latin1_General_100_CI_AS_SC_UTF8"
}

variable "sql_public_network_access_enabled"{
  default     = true
}

#AAD authentication_only
variable "AAD_authentication_only_enabled" {
  type        = bool
  description = "Azure Active Directory authentication allows you to centrally manage identity and access to your Azure SQL Database"
  default     = true
}

variable "sqldb_retention_days"{
  default = 7
} 

variable "sqldb_backup_frequency"{
  default = 24
} 

variable "sql_azuread_administrator"{
  default = null
}

variable "sql_db_sku_name"{
  default     = "S0"
}

variable "sql_db_database_license_type"{
  default     = "LicenseIncluded"
}