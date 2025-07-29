module "AllowList-Initiative" {
  source = "./AllowList-Initiative"
}
module "DeployDiagnosticsSettings-Initiative" {
  source = "./DeployDiagnosticsSettings-Initiative"
}

module "ApprovedVMExtensions-Initiative" {
  source = "./ApprovedVMExtensions-Initiative"
}
module "Disable-PubNetAccess-Initiative" {
  source = "./Disable-PubNetAccess-Initiative"
}

module "ResourceControl_Initiative" {
  source = "./ResourceControl-Initiative"
}

module "CompliantSKUs-Initiative" {
  source = "./CompliantSKUs-Initiative"  
}

#________________________________________________________________________________________________________________________________________________________________

resource "time_sleep" "wait_for_vnet" {
  create_duration = var.sleep_create_duration
  depends_on      = [module.AllowList-Initiative,module.ApprovedVMExtensions-Initiative,module.CompliantSKUs-Initiative,module.DeployDiagnosticsSettings-Initiative,module.Disable-PubNetAccess-Initiative,module.ResourceControl_Initiative]
}
#________________________________________________________________________________________________________________________________________________________________