module "generator" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

output "name" {
  value = module.generator.official_name
}