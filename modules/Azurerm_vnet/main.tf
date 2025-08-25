resource "azurerm_virtual_network" "vnet_1" {
  name                = var.azurerm_virtual_network
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_space
}
# resource "azurerm_virtual_network" "VNet" {
#   name                = "todoapp_vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }