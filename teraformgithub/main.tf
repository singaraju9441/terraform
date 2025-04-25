resource "github_repository" "secure_repo" {
  name        = "secure-repo"
  description = "Repository with all GHAS features enabled"
  visibility  = "private"

  auto_init = true
  has_issues = true
  has_projects = false
  has_wiki = false

  security_and_analysis {
    advanced_security {
      status = "enabled"
    }
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}
