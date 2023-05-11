# Bicep Get Started

This shows how you get started with Azure and Bicep using Visual Studio Code as Tool.
Download and Install Visual Studio Code before the next steps. [code.visualstudio.com](https://code.visualstudio.com)

## Prerequisites

TODO: The following requirements must be already in place or installed as instructed:

NOTE: The following tools are platform independent, so follow the instructions for your device depending if it is Windows, Linux or Mac.

### Bicep and other Tools

Bicep can be installed via Azure CLI, or with an installable executable for Windows, homebrew for Mac, chocolatey etc. See links below for more info.

1. [Install Az CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
2. [Install Git](https://git-scm.com/)
3. [Install Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)

## VS Code Extension

In Visual Studio Code extensions (CTRL+SHIFT+X), install the "Bicep" extension.

You can also install the Azure Account extension, for signing in to Azure services.

## Additional Recommended VS Code Extensions

The following extensions to Code is recommended for working with DevOps, Git and Bicep:

* Azure Account
* Git Blame
* Git History
* GitLens

## Verify: Check Versions

TODO: Verify versions before proceeding:

Run the following commands in the Terminal:

```azurecli
az bicep version
```

Should return the pinned version of TerraForm, as stated above.

```azurecli-interactive
git version
```

Should return version installed of Git (no pinning needed, can use latest available)

```azurecli-interactive
az bicep upgrade
```

For updating Bicep.

```azurecli-interactive
az --version
```

Shows installed version og Az CLI and dependencies. Upgrade to latest with az upgrade.

## Bicep 101

This section will serve as a starting point to basic Bicep understanding. With the above requirements in place, Bicep deployment commands can now be run inside each "workspace".

A *workspace* is a set of .bicep configuration files for a service or group of services that belong together. These workspaces are represented as subfolders under the selected repository.

To run Bicep commands for that workspace, set the location to the folder in your Visual Studio Code, so you need to open that folder first.

Bicep deployments can be run for a specified scope as shown below.

### resource group scope

```azurecli
az deployment group create \
  --name demoRGDeployment \
  --resource-group ExampleGroup \
  --template-file main.bicep \
  --parameters storageAccountType=Standard_GRS
```

### subscription scope

```azurecli
az deployment sub create \
  --name demoSubDeployment \
  --location NorwayEast \
  --template-file main.bicep \
  --parameters rgName=demoResourceGroup rgLocation=centralus
```

### management group scope

```azurecli
az deployment mg create \
  --name demoMGDeployment \
  --location WestEurope \
  --management-group-id myMG \
  --template-file main.bicep
```

### tenant scope

```azurecli
az deployment tenant create \
  --name demoTenantDeployment \
  --location WestEurope \
  --template-file main.bicep
```
