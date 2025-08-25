resource "azurerm_subnet" "azurerm_subnet" {
  name                 = var.azurerm_subnet
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

# resource "azurerm_subnet" "subnet" {
#   name                 = "frontend-subnet"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.1.0/24"]
# }