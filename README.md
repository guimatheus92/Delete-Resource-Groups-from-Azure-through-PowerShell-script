# How to delete Resource Groups from Azure through PowerShell script

A PowerShell script that can delete all resources automatically from your Azure account.

A document repository can also be found in my profile article at [Medium](https://guimatheus92.medium.com/how-to-delete-resource-groups-from-azure-through-powershell-script-21f1539d43cb "Medium").

------------

The first step is to install Azure modules on PowerShell:
```shell
 Install-Module -Name AzureRM -Force
```

The second step is to change your Azure connections:
```shell
# Account and password to be able to access
$UserEmail = “youremail@email.com”
$UserPassword = “yourpassword”
```

If you want, you can change how you can delete your resources by deleting all or deleting specific ones
This code delete all resources:
```shell
# Get all resources group from Azure and delete those without confirmation
Get-AzureRmResourceGroup | Remove-AzureRmResourceGroup -verbose -Force
```
This code delete specific resources:
```shell
# Get specific resources group within in a list and delete from your Azure account without confirmation
Get-AzureRmResourceGroup | Where-Object {$_.ResourceGroupName -in "DEMO", "DEMO2"} | Remove-AzureRmResourceGroup -verbose -Force
```
