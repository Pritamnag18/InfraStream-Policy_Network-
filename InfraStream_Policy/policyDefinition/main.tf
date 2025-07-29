
module "PCD-AllowList-RHELServerSKUs" {
  source = "./PCD-AllowList-RHELServerSKUs"
}
module "PCD-AllowList-UbuntuServerSKUs" {
  source = "./PCD-AllowList-UbuntuServerSKUs"
}
module "PCD-AppServiceAppsPNA" {
  source = "./PCD-AppServiceAppsPNA"
}

module "PCD-BlockPublicKeyVaults" {
  source = "./PCD-BlockPublicKeyVaults"
}

module "PCD-BlockStrAcc-PubAccess" {
  source = "./PCD-BlockStrAcc-PubAccess"
}

module "PCD-StrAcCrosTenant" {
  source = "./PCD-StrAcCrosTenant"
}

module "PCD-DeployDiagnosticsWebServerFarm" {
  source = "./PCD-DeployDiagnosticsWebServerFarm"
}


module "PCD-DeployDiagnosticsNIC" {
  source = "./PCD-DeployDiagnosticsNIC"
}


module "PCD-DeployDiagnosticsVM" {
  source = "./PCD-DeployDiagnosticsVM"
}


module "PCD-BlockList-ResourceTypes" {
  source = "./PCD-BlockList-ResourceTypes"
}


module "PCD-AddExtensions-Vm-Linx-AMA" {
  source = "./PCD-AddExtensions-Vm-Linx-AMA"
}


module "PCD-Allowed-virtual-machine-size-SKUs" {
  source = "./PCD-Allowed-virtual-machine-size-SKUs"
}
#________________________________________________________________________________________________________________________________________________________________
resource "time_sleep" "wait_for_vnet" {
  create_duration = var.sleep_create_duration
  depends_on      = [module.PCD-AddExtensions-Vm-Linx-AMA,module.PCD-Allowed-virtual-machine-size-SKUs,module.PCD-AllowList-RHELServerSKUs,module.PCD-AllowList-UbuntuServerSKUs,module.PCD-AppServiceAppsPNA,module.PCD-BlockList-ResourceTypes,module.PCD-BlockPublicKeyVaults,module.PCD-BlockStrAcc-PubAccess,module.PCD-DeployDiagnosticsNIC,module.PCD-DeployDiagnosticsVM,module.PCD-DeployDiagnosticsWebServerFarm,module.PCD-StrAcCrosTenant]
}
#________________________________________________________________________________________________________________________________________________________________

