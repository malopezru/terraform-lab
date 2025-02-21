terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 5.0"
        }
    }
}

provider "github" {
    token = var.github_token
    owner = var.github_org
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "GitHub organization name"
  type        = string
}

resource "github_membership" "membership_for_malopezru" {
    username = "malopezru"
    role     = "admin"
}