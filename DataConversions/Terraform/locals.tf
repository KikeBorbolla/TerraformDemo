locals {
  rg-origin_aqui = "RG-Israel"
  name-convention = lower(join("", [var.prefix, var.prefix_env, var.prefix_location]))


  # # other_tag = "other tag"
  # # tags        = merge(var.tags, other_tag)
  tags = var.tags
}
