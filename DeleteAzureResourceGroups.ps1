# --------------------------------------------------------------------------------------#
# Title: Delete resources from Azure
# Author: Guilherme Matheus
# Date: Script created on 06.10.2021
# Script and data info: This script can delete all or specific resource groups from Azure
# --------------------------------------------------------------------------------------#

# Reference taken from the official link https://docs.microsoft.com/en-us/powershell/module/azurerm.profile/?view=azurermps-6.13.0
# To work, it is necessary to install some modules, link: https://docs.microsoft.com/en-us/powershell/azure/azurerm/install-azurerm-ps?view=azurermps-6.13.0

# To execute the script without agreeing with the execution policy
Set-ExecutionPolicy Bypass -Scope Process

# Import Azure module
Import-Module AzureRM

# Account and password to be able to access
$UserEmail = “youremail@email.com”
$UserPassword = “yourpassword”

# Run the credential according to the login, password and tenant ID above
$SecPasswd = ConvertTo-SecureString $UserPassword -AsPlainText -Force

# Create credential
$myCred = New-Object System.Management.Automation.PSCredential($UserEmail,$SecPasswd)

# Get all resources group from Azure and delete those without confirmation
#Get-AzureRmResourceGroup | Remove-AzureRmResourceGroup -verbose -Force

# Get specific resources group within in a list and delete from your Azure account without confirmation
Get-AzureRmResourceGroup | Where-Object {$_.ResourceGroupName -in "DEMO", "DEMO2"} | Remove-AzureRmResourceGroup -verbose -Force