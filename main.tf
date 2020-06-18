locals {
  countlist = [for i in range(var.workspacecount): i]
  permutations = setproduct(var.githubidentifiers, local.countlist)
  perm_map = {
    for i in range(length(local.permutations)): i => local.permutations[i][0]
    }
  }


provider "tfe" {
  hostname = var.tfehostname
  version = "0.17.1"
}

resource "tfe_organization" "loadtest" {
  name  = var.orgname
  email = var.email
}

resource "tfe_oauth_client" "github" {
  organization     = tfe_organization.loadtest.id
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauthtoken
  service_provider = "github"
}

resource "tfe_workspace" "loadtest" {
  for_each = local.perm_map
  
  name                  = "${var.workspacename}-${each.key}"
  organization          = var.orgname
  auto_apply            = true
  file_triggers_enabled = false
  queue_all_runs        = true
  terraform_version     = var.terraformversion
  vcs_repo {
    identifier         = each.value
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
    branch             = var.githubbranch
    ingress_submodules = var.ingresssubmodules
  }
}
