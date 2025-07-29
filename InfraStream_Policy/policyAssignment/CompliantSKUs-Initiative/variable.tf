variable "management_group_id" {
  type = string
}

variable "effect-CompliantSKUsAPIManagementServiceVnet" {type = string}
variable "listOfAllowedSKUs-CompliantSKUsAPIManagementServiceVnet" {type = list}
variable "effect-CompliantSKUsAppConfigUsePrivateLink" {type = string}
variable "effect-CompliantSKUsAppServiceAppUsePrivateLink" {type = string}
variable "effect-CompliantSKUsAzureCognitiveSearchUsePrivateLink" {type = string }
variable "effect-CompliantSKUsContainerRegistriesUsePrivateLink" {type = string}
variable "allowedSkuNames-CompliantSKUsPCDNonCompliantSKUEventHub" {type = list}
variable "effect-CompliantSKUsPCDNonCompliantSKUEventHub" {type = string}
variable "effect-CompliantSKUsPCDNonCompliantSKUsAGW" {type = string }
variable "effect-CompliantSKUsStrAccountLimitAllowedSKUs" {type = string}
variable "effect-DenyNonPremiumDatabricks" {type = string}
variable "listOfAllowedSKUs-CompliantSKUsStrAccountLimitAllowedSKUs" {type = list}









