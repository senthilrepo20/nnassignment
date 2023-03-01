$RESOURCE_GROUP_NAME = 
$STORAGE_ACCOUNT_NAME = 
$BACKEND_KEYNAME = 
$KEYVAULT_NAME = 

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY
export ARM_ACCESS_KEY=$(az keyvault secret show --name $BACKEND_KEYNAME --vault-name $KEYVAULT_NAME --query value -o tsv)