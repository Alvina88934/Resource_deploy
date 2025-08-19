terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Rg_dev1"
    storage_account_name = "storagealdi1"
    container_name       = "containeraldi1"
    key                  = "terraform.tfstate.preprod"
}
}

provider "azurerm" {
 features {}
 subscription_id = "805cc58a-b2c1-4e91-97ec-b0ba35c3dc96"
   
 
}