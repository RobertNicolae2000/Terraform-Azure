#!/bin/bash

VAULT="KeyVault-Robert"

export ARM_CLIENT_ID=$(az keyvault secret show --vault-name $VAULT --name TF-Client-ID --query value -o tsv)
export ARM_CLIENT_SECRET=$(az keyvault secret show --vault-name $VAULT --name TF-Client-Secret --query value -o tsv)
export ARM_TENANT_ID=$(az keyvault secret show --vault-name $VAULT --name TF-Tenant-ID --query value -o tsv)
export ARM_SUBSCRIPTION_ID=$(az keyvault secret show --vault-name $VAULT --name TF-Subscription-ID --query value -o tsv)
