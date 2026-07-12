variable "repository_names" {
  description = "ECR repositories හදන්න ඕන names list එක"
  type        = list(string)
  default     = ["client", "server"]
}

variable "project_name" {
  type    = string
  default = "student-mgmt"
}