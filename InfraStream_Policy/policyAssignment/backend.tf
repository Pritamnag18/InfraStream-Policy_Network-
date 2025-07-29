terraform {
   
    backend "azurerm" {
        resource_group_name = "rg-infras-wus-03"    
        storage_account_name = "stgtfsinfraswus01"    
        container_name = "continfraswus01"      
        key = "polassterraform.tfstate" 
        
    }
} 


