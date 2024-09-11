# Define variables for the new storage account
$resourceGroupName = "powershell-testing"
$location = "UK South"
$storageAccountName = "sa$(Get-Random)"
$sku = "Standard_LRS"  # Options: Standard_LRS, Standard_GRS, Standard_ZRS, Premium_LRS
$kind = "StorageV2"     # Options: Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage

Write-Host "Creating storage account: $storageAccountName in resource group: $resourceGroupName"
# Create the storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName $sku `
    -Kind $kind

Write-Host "Retrieving storage account context for: $storageAccountName"
# Get the storage account context
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountContext = $storageAccount.Context

# Optional: Disable public access if it is explicitly needed
# Write-Host "Disabling public access for the storage account: $storageAccountName"
# Set-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -AllowBlobPublicAccess $false

Write-Host "Creating blob container: mycontainer in storage account: $storageAccountName"
# Create a new container in the storage account without public access
$containerName = "mycontainer"
New-AzStorageContainer -Name $containerName -Context $storageAccountContext

Write-Host "Storage account $storageAccountName created and container $containerName configured successfully."

Write-Host "Script execution completed."
