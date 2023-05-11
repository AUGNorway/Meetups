provider "azurerm" {
  features {
    #key_vault {}
    #virtual_machine {
    #  delete_os_disk_on_deletion = true
    #}
  }
  #  subscription_id = var.subscription_id
  #  client_id = var.client_id
  #  client_secret = var.client_secret
  #  tenant_id = var.tenant_id
}

/* terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
} */