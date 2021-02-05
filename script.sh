#!/bin/bash

# Create a MongoDB API database

# Variables for MongoDB API resources
resourceGroupName=myResourceGroup
location=westeurope
accountName=cosmosdb$RANDOM

# Create a resource group
az group create -n $resourceGroupName -l $location

# Create a Cosmos account for MongoDB API
az cosmosdb create \
    -n $accountName \
    -g $resourceGroupName \
    --kind MongoDB \
    --default-consistency-level Eventual \

# Create a MongoDB API database
az cosmosdb mongodb database create \
    -a $accountName \
    -g $resourceGroupName \
    -n cosmodbPR \

# CosmosDB Connection String
COSMOS_DB_CONNECTION_STRING=$(az cosmosdb keys list \
        -g $resourceGroupName \
        -n $accountName \
        --type connection-strings \
        --query connectionStrings[0].connectionString \
        --output tsv)

echo $COSMOS_DB_CONNECTION_STRING

gitrepo=https://github.com/rawskiWSB/ProjektUPD
webappname=mywebapp$RANDOM

# Create a resource group.
az group create --location westeurope --name myResourceGroup

# Create an App Service plan in `FREE` tier. --is-linux
az appservice plan create --name $webappname --resource-group myResourceGroup --sku FREE --is-linux

# Create a web app.
az webapp create --name $webappname --resource-group myResourceGroup --plan $webappname --runtime "node|12-lts"

# Deploy code from a public GitHub repository.
az webapp deployment source config --name $webappname --resource-group myResourceGroup \
--repo-url $gitrepo --branch main
#--manual-integration

# Set a environment variable for DB connection
az webapp config appsettings set --name $webappname --resource-group myResourceGroup \
  --settings "DB_CONNECT=$COSMOS_DB_CONNECTION_STRING"

# Copy the result of the following command into a browser to see the web app.
echo http://$webappname.azurewebsites.net

