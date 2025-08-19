resource "azurerm_public_ip" "pip" {
  name                = var.azurerm_public_ip
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Basic"
}


# resource "azurerm_public_ip" "pip" {
#   name                = "frontend_pip"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   allocation_method   = "Static"

# }