targetScope = 'subscription'

@description('Azure region where MedCare resources will be deployed.')
param location string = 'westeurope'

@description('Environment name for this deployment.')
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string = 'dev'

@description('Name of the MedCare platform.')
param projectName string = 'medcare'

// Platform foundation will be added here.
