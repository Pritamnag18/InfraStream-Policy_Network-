
variable "app_name" {
  type = string
}
variable "region_name" {
  type = string
}
variable "environment_name" {
  type = string
}
variable "environment_name1" {
  type = string
}
variable "win_os_name" {
  type = string
}
variable "lin_os_name" {
  type = string
}

#__________________________________________________________________________________________________________________________________________________
#Resource_Group

variable "rg_location" {
  type    = string
  
}

#_________________________________________________________________________________________________________________________________________________________________
#Vnet
#prod
variable "vnet_address_space" {
  type = list
}

#dev
variable "vnet_address_space_dev" {
  type = list
}
#_________________________________________________________________________________________________________________________________________________________________
#storage_account

variable "st_account_replication_type" {
  type = string
}

variable "st_account_kind" {
  type = string
}

#_________________________________________________________________________________________________________________________________________________________________

#subnet_pep
variable "address_prefixes_pep" {
  type = list(string)
}
variable "service_endpoints_pep" {
  type = list(string)
}
#________________________________________________________________________________________________________________________________________________________________
#time_sleep
variable "sleep_create_duration" {
  type = string 
}
#________________________________________________________________________________________________________________________________________________________________