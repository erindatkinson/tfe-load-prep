# tfe-load-prep
Used for load testing against a TFE server/cluser


## Required

After you've build a TFE Server or Cluster, all you need to do is create the initial admin user, and grab the admin token. Store that token as `TFE_TOKEN`.

GitHub.com - This config assumes you'll be using a GitHub.com repo.

* `tfehostname` - The URL of your TFE server
* `oauthtoken` - Token from GitHub.com [On the settings page](https://github.com/settings/tokens) create a personal access token with `admin:org, admin:org_hook, admin:repo_hook, repo` privileges. 
* `githubidentifier` - The GitHub org and repo name

## Optional

* `orgname` - The name of the TFE org to be created
* `email` - The email to associate with the org
* `workspacecount` - How many workspaces to create - note, there's a known issue: setting this above 10 intially will cause terraform errors. 
* `workspacename` - The default workspace name to use
* `terraformversion` - What version of tf to use
* `githubbranch` - Used to specify a non-default branch of the repo
* `ingresssubmodules` - Should sub-modules be ingressed