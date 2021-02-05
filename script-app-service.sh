#!/bin/bash

# Replace the following URL with a public GitHub repo URL
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

# Copy the result of the following command into a browser to see the web app.
echo http://$webappname.azurewebsites.net