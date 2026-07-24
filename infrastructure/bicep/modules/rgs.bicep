targetScope = 'subscription'

@description('Azure region where the resource groups will be created.')
param location string

@description('Name of the MedCare environment.')
param environment string

@description('Project name used in resource naming.')
param projectName string

resource networkResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-${projectName}-${environment}-network'
  location: location
}

resource securityResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-${projectName}-${environment}-security'
  location: location
}

resource monitoringResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-${projectName}-${environment}-monitoring'
  location: location
}
