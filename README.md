# Terraform Cloud / Enterprise Workspace Module

A Terraform module which creates Workspace on Terraform Cloud / Enterprise with the following characteristics:
- Ability to configure all kind of Variables (HCL, Non HCL, Sensitive, Non Sensitive, Terraform or ENV)
- Allow to enable or not notification at the workspace level
- Allow you to enable or not vcs connection at the workspace level

## Terraform versions

Tested with Terraform 0.14.7.

## Usage

Workspace **without** notification and vcs example: 

```hcl

module "my_workspace_1" {
  source                        = "app.terraform.io/<ORG_NAME>/workspace/terraform"
  version                       = "1.0.0"

  vcs = false

  workspace                     = [
    {
        "name"                  = "test1"
        "organization"          = "your_organization"
        "auto_apply"            = false
        "file_triggers_enabled" = false
        "operations"            = true
        "ssh_key_id"            = ""
        "trigger_prefixes"      = "[]"
        "working_directory"     = ""
        "tf_version"            = "0.14.7"
        "queue_all_runs"        = false
    }
  ]
  workspace_variables           = [
    {
        key                     = "mykey"
        value                   = "myvalue"
        category                = "terraform"
        hcl                     = "false"
        sensitive               = "false"
    } 
  ]

  notification_configuration = [
    {
      notification = false
    }
  ]

```

Workspace **with** notification and vcs example: 

```hcl
module "my_workspace_1" {
  source                        = "app.terraform.io/<ORG_NAME>/workspace/terraform"
  version                       = "1.0.0"

  vcs = true

  workspace                     = [
    {
        "name"                  = "test1"
        "organization"          = "your_organization"
        "auto_apply"            = false
        "file_triggers_enabled" = false
        "operations"            = true
        "ssh_key_id"            = ""
        "trigger_prefixes"      = "[]"
        "working_directory"     = ""
        "tf_version"            = "0.14.7"
        "queue_all_runs"        = false
        "identifier"            = "mygithub/myrepos"
        "branch"                = ""
        "ingress_submodules"    = false
        "oauth_token_id"        = "ot-12hhhzypoazoia771"
    }
  ]

  workspace_variables           = [
    {
        key                     = "mykey"
        value                   = "myvalue"
        category                = "terraform"
        hcl                     = "false"
        sensitive               = "false"
    } 
  ]



  notification_configuration    = [
    {
        "name"                  = "test_notifaction"
        "enabled"               = true
        "token"                 = "my_token"
        "destination_type"      = "slack"
        "url"                   = "https://hooks.slack.com/services/TF5C9US83/BF4P634NL/JTiCBZemQeXzU3mkdUHssjU"
        "triggers"              = "run:needs_attention"
    }
  ]
}

```

## Authors

* **Nicolas Ehrman** - *Initial work* - [Hashicorp](https://www.hashicorp.com)
* **Emil Engfors** - *updated with VCS toggle*



