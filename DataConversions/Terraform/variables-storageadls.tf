variable "storage_accounts_adls"{
  type    = map(any)

  default = {
    storage1 = {
      storage_prefix          = ""
      storage_acc_adls_name   = ""
      index_value             = ""
      adls_datalake_name      = []

    },
    storage2 = {
      storage_prefix          = ""
      storage_acc_adls_name   = ""
      index_value             = ""
      adls_datalake_name      = []

    }

  }
}
