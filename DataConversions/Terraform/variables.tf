#ENABLE RESOURCES 
variable "enable_key_vault" {
  type    = bool
  default = false
}

variable "enable_adf" {
  type    = bool
  default = false
}

variable "enable_storage_blob" {
  type        = bool
  description = "Enable the deployment of storage account blob"
  default     = false
}

variable "enable_storage_adls" {
  type        = bool
  description = "Enable the deployment of storage account adls"
  default     = false
}

#NAMING CONVENTION VARIABLES

variable "prefix" {
  type        = string
  description = "Prefix that was used in the dlz that was deployed"
  default     = ""
}

variable "app_prefix" {
  type        = string
  description = "Prefix that will be used in the RG name and component to be deployed as part of the package"
  default     = ""
}

variable "prefix_location" {
  type        = string
  description = "Prefix for the location on naming convention"
  default     = ""
}

variable "prefix_env" {
  type        = string
  description = "Prefix for the environment on naming convention"
  default     = ""
}

variable "service_name" {
  type        = string
  description = "For the different domain services (Ingestion, Exchange, Exploration, AI/ML))"
  default     = "Core"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
  default     = ""
}

variable "create_rg" {
  type        = bool
  description = "set to true to create the resource group"
  default     = true
}

#GENERAL

variable "location" {
  type        = string
  description = "Azure location"
  default     = "South Central US"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "environment_flag" {
  description = "environment in which resources are deployed"
  type        = string
  default     = "dev"
}

variable "CLIENT_SECRET" {
  description = "SPN client secret - Set this as environment variable (e.g. $env:TF_VAR_CLIENT_SECRET = <SECRET VALUE>)"
  type        = string
}

variable "SUBSCRIPTION_ID" {
  description = "Subscription ID - Set this as environment variable (e.g. $env:TF_VAR_SUBSCRIPTION_ID = <SUBSCRIPTION ID>)"
  type        = string
}