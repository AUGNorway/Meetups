# Terraform Get Started

This shows how you get started with Azure and TerraForm using Visual Studio Code as Tool.
Download and Install Visual Studio Code before the next steps. [code.visualstudio.com](https://code.visualstudio.com)

## Prerequisites

TODO: The following requirements must be already in place or installed as instructed:

NOTE: The following tools are platform independent, so follow the instructions for your device depending if it is Windows, Linux or Mac.

### Terraform and other Tools

Local infrastructure as code (IaC) contributors is recommended to work on a agreed pinned version of TerraForm, so that both locally and DevOps CI/CD pipelines use the same version without conflict.

1. [Install Git](https://git-scm.com/)
2. [Install TerraForm](https://www.terraform.io/downloads)
3. [Install Node.js](https://nodejs.org/)
4. [Install Az CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## VS Code Extension

In Visual Studio Code extensions (CTRL+SHIFT+X), install the "Terraform" extension.

You can also install the Azure Account extension, for signing in to Azure services.

In addition to the TerraForm extension, optionally also install the general Azure TerraForm extension, which will provide possibility to run TerraForm scripts in Cloud Shell (this is an optional method).

## Additional Recommended VS Code Extensions

The following extensions to Code is recommended for working with DevOps, Git and TerraForm:

* HashiCorp Terraform
* Azure Account
* Git Blame
* Git History
* GitLens
* Azure TerraForm (optionally)

## Verify: Check Versions

TODO: Verify versions before proceeding:

Run the following commands in the Terminal:

```azurecli
terraform version
```

Should return the pinned version of TerraForm, as stated above.

```azurecli-interactive
git version
```

Should return version installed of Git (no pinning needed, can use latest available)

```azurecli-interactive
node --version
```

```azurecli-interactive
az --version
```

Shows installed version og Az CLI and dependencies. Upgrade to latest with az upgrade.

## TerraForm 101

This section will serve as a starting point to basic TerraForm understanding. With the above requirements in place, TerraForm commands can now be run inside each "Workspace". 

A *Workspace* is a set of Terraform configuration files for a service or group og services that belong together. This workspace has it's own state file. For example a workspace can have the name of "AzureRM-<workspacealias>". These workspaces are represented as subfolders under the selected repository.

To run TerraForm commands for that workspace, that folder must be the root folder in your Visual Studio Code, so you need to open that sub-folder first.

Inside a workspace folder you can run the following commands:

### terraform validate

Will check for configuration, syntax and reference errors in configuration files. Always useful to run first.

### terraform init

For new workspaces, or if your VS Code environment haven't been set up for this workspace before. Will download the current AzureRM provider, any dependencies, modules etc.

### terraform plan

Will check the .tf configuration files and compare with the state file and related Azure services, and check if there will be an create, change or delete deployment of resources.

### terraform apply

Will both do a plan (check state and summarize changes), and then prompt to type yes/no for actual deployment.

Deployment will both change state file, and change referred Azure resources.

For Production workspaces, apply should generally only be done in Azure DevOps CI/CI pipelines.

### terraform destroy (careful)

Will destroy all Azure resources in the workspace! Don't use on a general basis.
