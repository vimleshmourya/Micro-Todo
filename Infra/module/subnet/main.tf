resource "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  resource_group_name  = "rg-aks-01"
  virtual_network_name = "aks-vnet"
  address_prefixes     = ["10.240.0.0/16"]
}

resource "azurerm_subnet" "appgw" {
  name                 = "appgw-subnet"
  resource_group_name  = "rg-aks-01"
  virtual_network_name = "aks-vnet"
  address_prefixes     = ["10.241.0.0/16"]
}