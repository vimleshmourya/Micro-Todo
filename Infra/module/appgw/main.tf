data "azurerm_subnet" "subnet-appgw" {
  name                 = "appgw-subnet"
  virtual_network_name = "aks-vnet"
  resource_group_name  = "rg-aks-01"
}

data "azurerm_public_ip" "pip" {
  name                = "appgw-pip"
  resource_group_name = "rg-aks-01"
}

resource "azurerm_application_gateway" "appgw" {
  name                = "appgw-aks"
  location            = "West Europe"
  resource_group_name = "rg-aks-01"

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = "appgw-ipcfg"
    subnet_id = data.azurerm_subnet.subnet-appgw.id
  }

  frontend_port {
    name = "http"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "public"
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }

  # backend_address_pool {
  #   name = "todo-backend"
  # }

  # backend_http_settings {
  #   name                  = "http-settings"
  #   port                  = 80
  #   protocol              = "Http"
  #   cookie_based_affinity = "Disabled"
  #   request_timeout       = 30
  # }

  # http_listener {
  #   name                           = "http-listener"
  #   frontend_ip_configuration_name = "public"
  #   frontend_port_name             = "http"
  #   protocol                       = "Http"
  # }

  # request_routing_rule {
  #   name                       = "rule-1"
  #   rule_type                 = "Basic"
  #   http_listener_name        = "http-listener"
  #   backend_address_pool_name = "default-backend"
  #   backend_http_settings_name = "http-settings"
  #   priority                  = 100
  # }

  # ----------------------------
  # REQUIRED DUMMY CONFIG
  # ----------------------------
  backend_address_pool {
    name = "dummy-backend-pool"
  }

  backend_http_settings {
    name                  = "dummy-http-settings"
    port                  = 80
    protocol              = "Http"
    cookie_based_affinity = "Disabled"
    request_timeout       = 30
  }

  http_listener {
    name                           = "dummy-listener"
    frontend_ip_configuration_name = "public"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "dummy-rule"
    rule_type                 = "Basic"
    http_listener_name        = "dummy-listener"
    backend_address_pool_name = "dummy-backend-pool"
    backend_http_settings_name = "dummy-http-settings"
    priority                  = 100
  }
}
