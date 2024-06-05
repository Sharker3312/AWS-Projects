# //////////////////////////////
# VARIABLES
# //////////////////////////////

variable "region" {
  type        = string
  description = "The region of the aws account"
}

variable "access_token" {
  type        = string
  description = "The details of the github token"
}

variable "repository" {
  type        = string
  description = "github repo url"
  default     = "The link to your repo comes here"
}

variable "app_name" {
  type        = string
  description = "AWS Amplify App Name"
  default     = "hello-world"
}

variable "branch_name" {
  type        = string
  description = "AWS Amplify App Repo Branch Name"
  default     = "main"
}

variable "domain_name" {
  type        = string
  default     = "awsamplifyapp.com" #change this to your custom domain
  description = "AWS Amplify Domain Name"
}