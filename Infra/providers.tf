terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id = "b1399a26-1031-4b82-ade8-1389b5d8212a"
  # client_id       = "8f664e62-0134-4e0b-b17c-25d2d34ef974"
  # client_secret   = "zPe8Q~Qz9qlS4BOSdEXyKrge2s7tYulmPP4m9cuM"
  # tenant_id       = "b919a8b7-4aae-4ced-b494-2f19a9993250"
}
