resource "azurerm_public_ip" "appgw" {
  name                = "appgw-pip"
  location            = "West Europe"
  resource_group_name = "rg-aks-01"
  allocation_method   = "Static"
  sku                 = "Standard"
}