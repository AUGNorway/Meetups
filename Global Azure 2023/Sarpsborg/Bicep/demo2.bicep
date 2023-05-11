targetScope = 'resourceGroup'

param location string = 'norwayeast'

resource myResource 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'elvsabicepdemo001'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
