$resourceGroupName = Read-Host "rg name"
$location = Read-Host "location"
$storageAccountName = Read-Host "enter sa name"
$sku = Read-Host "enter sku"
$kind = Read-Host "enter kind of storage account (Sku)"

Write-Host "Creating storage account: $storageAccountName in resource group: $resourceGroupName"



New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName $sku `
    -Kind $kind



Write-Host "Retrieving storage account context for: $storageAccountName"

$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountContext = $storageAccount.Context


Write-Host "Creating blob container: mycontainer in storage account: $storageAccountName"
$containerName = "mycontainer"
New-AzStorageContainer -Name $containerName -Context $storageAccountContext

Write-Host "Storage account $storageAccountName created and container $containerName configured successfully."

Write-Host "Script execution completed."
