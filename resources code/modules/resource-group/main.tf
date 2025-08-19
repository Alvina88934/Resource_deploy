resource "azurerm_resource_group" "example" {
  name     = var.resource_group
  location = var.location
}
# resource "azurerm_resource_group" "RG" {
#   name     = "todo_app_rg"
#   location = "West US"
# }