terraform {
  required_providers {
    github = {
      source  = "integrations/github"
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

resource "github_repository" "terraform-lab-iac" {
  name        = "terraform-lab-iac"
  description = "Profe pongame 5"
  visibility  = "public"
  template {
    owner                = "MarketingPipeline"
    repository           = "Awesome-Repo-Template"
    include_all_branches = true
  }
}

resource "github_branch" "development" {
    repository = "terraform-lab-iac"
    branch     = "development"
}

resource "github_branch" "test" {
    repository = "terraform-lab-iac"
    branch     = "test"
}

resource "github_branch" "staging" {
    repository = "terraform-lab-iac"
    branch     = "staging"
}