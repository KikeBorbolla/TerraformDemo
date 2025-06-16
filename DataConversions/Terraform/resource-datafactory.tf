module "data_factory" {
  source                          = "../../../TerraformDemo-Modules/data-factory"
  count                           = var.enable_adf ? 1 : 0
  data_factory_name               = lower(join("-", [local.name-convention, var.data_factory_name, "${format("%02d", count.index + 1)}"]))
  resource_group_name             = data.azurerm_resource_group.origin.0.name
  location                        = var.location
  public_network_enabled          = true
  managed_virtual_network_enabled = true
  tags = local.tags
}
