variable "github_token" {
    description = "The GitHub personal access token"
    type        = string
    sensitive   = true
}

variable "github_owner" {
    description = "The GitHub organization or user name"
    type        = string
}