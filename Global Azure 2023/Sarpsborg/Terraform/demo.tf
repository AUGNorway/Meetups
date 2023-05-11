
resource "azurerm_resource_group" "myRG" {
  name = "rg-terraform-demo"
  location = "westeurope"
}

resource "azurerm_storage_account" "myStorage" {
    name = "elvensademo001"
    location = "norwayeast"
    resource_group_name      = azurerm_resource_group.myRG.name
    account_tier             = "Standard"
    account_replication_type = "LRS"    
}