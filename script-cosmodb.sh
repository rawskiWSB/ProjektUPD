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


COSMOS_DB_CONNECTION_STRING=$(az cosmosdb keys list \
        -g $resourceGroupName \
        -n $accountName \
        --type connection-strings \
        --query connectionStrings[0].connectionString \
        --output tsv)

echo $COSMOS_DB_CONNECTION_STRING