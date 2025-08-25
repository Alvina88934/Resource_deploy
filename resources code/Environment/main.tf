module "resource_group" {
    source = "../modules/resource-group"
    resource_group = "preprod-rg"
    location = "westeurope"
  
}
module "azurerm_virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../modules/Azurerm_vnet"
    azurerm_virtual_network = "preprod-vnet"
    location = "westeurope"
    resource_group = "preprod-rg"
    address_space = ["10.0.0.0/16"]

  
}
module "azurerm_fronted-subnet" {
    depends_on = [ module.azurerm_virtual_network ]
    source = "../modules/azurerm_subnet"
    azurerm_subnet = "preprod-subnet"
    resource_group = "preprod-rg"
    virtual_network_name = "preprod-vnet"
    address_prefixes = ["10.0.1.0/24"]
  
}
module "azurerm_backend-subnet" {
    depends_on = [ module.azurerm_virtual_network ]
    source = "../modules/azurerm_subnet"
    azurerm_subnet = "backend-subnet"
    resource_group = "preprod-rg"
    virtual_network_name = "preprod-vnet"
    address_prefixes = ["10.0.2.0/24"]
  
}

module "azurerm_fronted_public_ip" {
    depends_on = [ module.azurerm_virtual_network]
    source = "../modules/azurerm_public_ip"
    azurerm_public_ip = "fronted_pip"
    resource_group = "preprod-rg"
    location = "westeurope"
    
  
}
module "azurerm_backend_public_ip" {
    depends_on = [ module.azurerm_virtual_network]
    source = "../modules/azurerm_public_ip"
    azurerm_public_ip = "backend_pip"
    resource_group = "preprod-rg"
    location = "westeurope"
    
  
}
module "azurerm_fronted_vm" {
    source = "../modules/azurerm_vm"
    depends_on =[ module.azurerm_fronted-subnet,module.azurerm_fronted_public_ip,module.azurerm_key_vault,module.azurerm_key_vault_secret_username,module.azurerm_key_vault_secret_password]
    nic_name = "fronted-nic"
    location = "westeurope"
    resource_group = "preprod-rg"
    ip_name = "fronted-ip"
    vm_name = "fronted-vm"
    subnet_name = "preprod-subnet"
    virtual_network_name = "preprod-vnet"
    public_ip_name = "fronted_ip"
    secret_username_name = "vm-username"
    secret_password_name = "vm-password"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-jammy"
    image_sku = "22_04-lts"
    image_version = "latest"
      key_vault_name = "G30-KeyVault"
  
}

module "azurerm_backend_vm" {
    source = "../modules/azurerm_vm"
    depends_on =[ module.azurerm_backend-subnet, module.azurerm_backend_public_ip, module.azurerm_key_vault, module.azurerm_key_vault_secret_username, module.azurerm_key_vault_secret_password] 
    nic_name = "backend-nic"
    location = "westeurope"
    resource_group = "preprod-rg"
    ip_name = "backend-ip"
    subnet_name = "backend-subnet"
    vm_name = "backend-vm"
   public_ip_name = "backend_ip"
    virtual_network_name = "preprod-vnet"
    secret_username_name = "vm-username"
    secret_password_name = "vm-password"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-focal"
    image_sku = "20_04-lts"
    image_version = "latest"
    key_vault_name = "G30-KeyVault"
  
}
module "azurerm_sql_server" {
    depends_on = [ module.resource_group, module.azurerm_key_vault, module.azurerm_key_vault_secret_username, module.azurerm_key_vault_secret_password]
    source = "../modules/azurerm_sql_server"
    sql_server_name = "preprod-sql-server"
    resource_group = "preprod-rg"
    location = "westeurope"
    key_vault_name = "G30-KeyVault"
   secret_username_name = "vm-username"
    secret_password_name = "vm-password"
 }

module "azurerm_sql_database" {
    depends_on = [ module.azurerm_sql_server ]
    source = "../modules/azurerm_sql_database"
    db_name = "preprod-sql-db"
    resource_group = "preprod-rg"
    sql_server_name = "preprod-sql-server"
 
}
# module "azurerm_key_vault" {
#     depends_on = [ module.resource_group ]
#     source = "../modules/azurerm_key_vault"
#     key_vault_name = "G30-KeyVault"
#     location = "westeurope"
#     resource_group = "preprod-rg"
  
# }
module "azurerm_key_vault_secret_username" {
    depends_on = [ module.azurerm_key_vault ]
    source = "../modules/azurerm_key_vault_secret"
    secret_name  = "secret123"
    secret_value = "AzhaaN@123"
    key_vault_name = "B17-G30-kv"
    resource_group = "B17-G30-kv"
}
module "azurerm_key_vault_secret_password" {
    depends_on = [ module.azurerm_key_vault, module.azurerm_key_vault_secret_username]
    source = "../modules/azurerm_key_vault_secret"
     secret_name  = "secret123"
    secret_value = "AzhaaN@123"
    key_vault_name = "B17-G30-kv"
    resource_group = "B17-G30-kv"
  
}