
module "dynamic_keyvault_secrets" {
  source  = "aztfmod/caf/azurerm"
  version = "5.7.0"

  for_each = try(var.dynamic_keyvault_secrets, {})

  settings = each.value
  keyvault = module.launchpad.keyvaults[each.key]
  objects  = module.launchpad
}
