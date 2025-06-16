# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.21.0" #">=4.21.0" #">= 3.24.0"
      #version = "=3.106.1"
    }
    azuread = {
        version = "~> 2.15.0"
        source  = "hashicorp/azuread"
    }
    azapi = {
      source = "Azure/azapi"
      version= "1.14.0"
    }  
  }
}