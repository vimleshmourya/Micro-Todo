data "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet"
  resource_group_name = "rg-aks-01"
}

data "azurerm_subnet" "subnet-aks" {
  name                 = "aks-subnet"
  virtual_network_name = "aks-vnet"
  resource_group_name  = "rg-aks-01"
}


data "azurerm_application_gateway" "appgw" {
  name                = "appgw-aks"
  resource_group_name = "rg-aks-01"
}

data "azurerm_container_registry" "acr" {
  name                = "todoacr01"
  resource_group_name = "rg-aks-01"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-agic"
  location            = "West Europe"
  resource_group_name = "rg-aks-01"
  dns_prefix          = "aksagic"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_B2ls_v2"
    vnet_subnet_id = data.azurerm_subnet.subnet-aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

ingress_application_gateway {
  gateway_id = data.azurerm_application_gateway.appgw.id
}
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

