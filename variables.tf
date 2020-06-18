variable "tfehostname" {
  description = "Your TFE app url, without the https://. Example: tfe.example.com"
}

variable "orgname" {
  default = "load-test-org"
}

variable "email" {
  default = "test@example.com"
}

variable "oauthtoken" {
  description = "The token string given by your VCS provider"
}

variable "workspacecount" {
  default     = "10"
  description = "The number of workspaces to create. Defaults to 100."
}

variable "workspacename" {
  default     = "load-test-workspace"
  description = "Name of the created workspaces."
}

variable "terraformversion" {
  default     = "latest"
  description = "Version of terraform to use in the created workspaces."
}

variable "githubidentifiers" {
  description = "List of github org and repos specified as :org/:repo"
  type = list(string)
}

variable "githubbranch" {
  default     = "master"
  description = "The GitHub repo branch to use."
}

variable "ingresssubmodules" {
  default     = "true"
  description = "Should submodules be ingressed."
}