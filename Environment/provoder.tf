terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name  = "Rg_123"
#     storage_account_name = "myappstorage01"
#     container_name = "mycontainer01"
#     key    = "terraform.tfstate.preprod"
# }
}

provider "azurerm" {
 features {}
 subscription_id = "3142e9bb-dc6c-403c-9fcf-cbf1d0163394"
   
 
}