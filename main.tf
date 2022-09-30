# Provider Configuration 
variable "provider_token"{
    type = string
}
provider "fakewebservices" {
  token = var.provider_token
}

# Module Calls (Instanziierung der Bausteine)
module "NAME_VM1_3e53191b-e96d-4e8b-ba66-89bdafbb9dee" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

module "NAME_VM2_3e53191b-e96d-4e8b-ba66-89bdafbb9dee" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

module "NAME_LB_3e53191b-e96d-4e8b-ba66-89bdafbb9dee" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

module "VM1_3e53191b-e96d-4e8b-ba66-89bdafbb9dee" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  # insert required variables here
  official_name = module.NAME_VM1_3e53191b-e96d-4e8b-ba66-89bdafbb9dee.official_name
  vm_type = "db"
}

module "VM2_3e53191b-e96d-4e8b-ba66-89bdafbb9dee" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  # insert required variables here
  official_name = module.NAME_VM2_3e53191b-e96d-4e8b-ba66-89bdafbb9dee.official_name
  vm_type = "db"
}
module "LB_3e53191b-e96d-4e8b-ba66-89bdafbb9dee" {
  source  = "app.terraform.io/team-automation/LB/fakewebservices"
  version = "1.0.0"
  # insert required variables here
  official_name = module.NAME_LB_3e53191b-e96d-4e8b-ba66-89bdafbb9dee.official_name
  servers = tolist([module.VM1_3e53191b-e96d-4e8b-ba66-89bdafbb9dee.vm_id, module.VM2_3e53191b-e96d-4e8b-ba66-89bdafbb9dee.vm_id ])
}
# Output
output "LB_ID" {
  value = module.LB_3e53191b-e96d-4e8b-ba66-89bdafbb9dee.lb_id
}