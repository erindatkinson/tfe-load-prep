provider "tfe" {
  hostname = "${var.tfehostname}"
}

resource "tfe_organization" "loadtest" {
  name  = "${var.orgname}"
  email = "${var.email}"
}

resource "tfe_oauth_client" "github" {
  organization     = "${tfe_organization.loadtest.id}"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = "${var.oauthtoken}"
  service_provider = "github"
}

resource "tfe_workspace" "loadtest" {
  count                 = "${var.workspacecount}"
  name                  = "${var.workspacename}-${count.index}"
  organization          = "${var.orgname}"
  auto_apply            = true
  file_triggers_enabled = false
  queue_all_runs        = true
  terraform_version     = "${var.terraformversion}"
  vcs_repo {
    identifier         = "${var.githubidentifier}"
    oauth_token_id     = "${tfe_oauth_client.github.oauth_token_id}"
    branch             = "${var.githubbranch}"
    ingress_submodules = "${var.ingresssubmodules}"
  }
}