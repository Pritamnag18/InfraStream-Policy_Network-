
app_name       = "infras"
environment_name = "prod"
environment_name1 = "dev"
region_name = "wus"
win_os_name = "w"
lin_os_name = "l"

#_________________________________________________________________________________________________________________________________________________________________

#Resource_group

rg_location = "West US"    
#________________________________________________________________________________________________________________________________________________________________
#Vnet
#prod
vnet_address_space = ["10.0.0.0/16"]  

#dev
vnet_address_space_dev = ["10.1.0.0/16"]  
#_________________________________________________________________________________________________________________________________________________________________
#storage_account

st_account_replication_type = "RAGRS"
st_account_kind             = "StorageV2" 
#_________________________________________________________________________________________________________________________________________________________________

#Subnet_pep
address_prefixes_pep = ["10.0.0.0/27"]     
service_endpoints_pep = ["Microsoft.ContainerRegistry", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web", "Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB", "Microsoft.CognitiveServices", "Microsoft.EventHub", "Microsoft.ServiceBus"]

#________________________________________________________________________________________________________________________________________________________________
#time_sleep
sleep_create_duration = "500s"
#________________________________________________________________________________________________________________________________________________________________
