module "NAME_VM1_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  providers = {
    random = "random_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  }
  type = "VM"
}
provider "random" {
  alias = "random_685e9199-2ab2-49ee-a878-7b7005eb0f50"
}
module "NAME_VM2_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  providers = {
    random = "random_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  }
  type = "VM"
}
module "NAME_LB_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  providers = {
    random = "random_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  }
  type = "LB"
}
module "VM1_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  providers = {
    fakewebservices = "fakewebservices_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  }
  vm_type       = "webserver"
  official_name = module.NAME_VM1_685e9199-2ab2-49ee-a878-7b7005eb0f50.official_name
}
provider "fakewebservices" {
  alias = "fakewebservices_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  token = var.token
}
module "VM2_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  providers = {
    fakewebservices = "fakewebservices_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  }
  vm_type       = "webserver"
  official_name = module.NAME_VM2_685e9199-2ab2-49ee-a878-7b7005eb0f50.official_name
}
module "LB_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  source  = "app.terraform.io/team-automation/LB/fakewebservices"
  version = "1.0.0"
  providers = {
    fakewebservices = "fakewebservices_685e9199-2ab2-49ee-a878-7b7005eb0f50"
  }
  official_name = module.NAME_LB_685e9199-2ab2-49ee-a878-7b7005eb0f50.official_name
  servers       = tolist([module.VM1_685e9199-2ab2-49ee-a878-7b7005eb0f50.vm_id, module.VM2_685e9199-2ab2-49ee-a878-7b7005eb0f50.vm_id ])
}
output "lb_id_685e9199-2ab2-49ee-a878-7b7005eb0f50" {
  description = "Loadbalancer ID"
  value       = module.LB_685e9199-2ab2-49ee-a878-7b7005eb0f50.lb_id
}
