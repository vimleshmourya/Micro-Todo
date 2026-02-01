resource "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet"
  address_space       = ["10.0.0.0/8"]
  location            = "West Europe"
  resource_group_name = "rg-aks-01"
}

