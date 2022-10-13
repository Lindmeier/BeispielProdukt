module "NAME_VM1_28388383838" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  providers = {
    random = "random.random_28388383838"
  }
  type = "VM"
}
provider "random" {
  alias = "random_28388383838"
}
module "NAME_VM2_28388383838" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  providers = {
    random = "random.random_28388383838"
  }
  type = "VM"
}
module "NAME_LB_28388383838" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  providers = {
    random = "random.random_28388383838"
  }
  type = "LB"
}
module "VM1_28388383838" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  providers = {
    fakewebservices = "fakewebservices.fakewebservices_28388383838"
  }
  vm_type       = "webserver"
  official_name = module.NAME_VM1_28388383838.official_name
}
provider "fakewebservices" {
  alias = "fakewebservices_28388383838"
  token = var.token
}
variable "token" {
  type = string
}
module "VM2_28388383838" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  providers = {
    fakewebservices = "fakewebservices.fakewebservices_28388383838"
  }
  vm_type       = "webserver"
  official_name = module.NAME_VM2_28388383838.official_name
}
module "LB_28388383838" {
  source  = "app.terraform.io/team-automation/LB/fakewebservices"
  version = "1.0.0"
  providers = {
    fakewebservices = "fakewebservices.fakewebservices_28388383838"
  }
  official_name = module.NAME_LB_28388383838.official_name
  servers       = tolist([module.VM1_28388383838.vm_id, module.VM2_28388383838.vm_id ])
}
output "lb_id_28388383838" {
  description = "Loadbalancer ID"
  value       = module.LB_28388383838.lb_id
}
