targetScope = 'subscription'

param location string = 'norwayeast'

resource myRg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bicep-demo'
  location: location
}

