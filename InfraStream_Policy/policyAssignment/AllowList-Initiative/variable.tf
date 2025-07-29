variable "management_group_id" {
  type = string
}
variable "listOfAllowedLocations-AllowedLocationsForResourceGroups" {type = list }
variable "listOfAllowedLocations-AllowedLocationsForResources" {type = list}
variable "effect-AllowedLocationsForResourceGroups" {type = string}
variable "effect-AllowedLocationsForResources" {type = string}
variable "effect-AllowListWinServerLicenceVmss" {type = string}
variable "effect-AllowList-UbuntuServerSKUs" {type = string}
variable "effect-AllowList-RHELServerSKUs" {type = string}
variable "effect-AllowList-WinServerSKUs" {type = string}
variable "effect-AllowList-ResourceTypes" {type = string}
variable "effect-PIP-LimitSvcs" {type = string}
variable "allowListResourceTypesForAppTeams" {type = list}
variable "allowListResourceTypesPlatform" {type = list}
variable "allowListRscProvidersPlatform" {type = list}