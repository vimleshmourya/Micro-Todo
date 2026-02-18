# module "rg" {
#   source = "./module/rg"
# }

#  module "vnet" {
#    depends_on = [module.rg]
#    source     = "./module/vnet"
#  }

#  module "subnet" {
#    depends_on = [module.vnet]
#    source     = "./module/subnet"
#  }

#  module "piblicIP" {
#    depends_on = [module.rg]
#    source     = "./module/publicIP"
#  }

#  module "appgw" {
#    depends_on = [module.subnet]
#    source     = "./module/appgw"
#  }

#  module "aks" {
#    depends_on = [module.rg, module.appgw]
#    source     = "./module/aks"
#  }

#  module "acr" {
#    depends_on = [module.rg]
#    source     = "./module/acr"
#  }

#  module "sqldb" {
#    depends_on = [module.rg]
#    source     = "./module/sqldb"
#  }
