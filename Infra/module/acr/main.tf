resource "azurerm_container_registry" "acr" {
  name                = "todoacr01"
  resource_group_name = "rg-aks-01"
  location            = "West Europe"
  sku                 = "Premium"
  admin_enabled       = false
}