variable "domain_name" {
  description = "Certificate එක issue කරන domain එක"
  type        = string
}

variable "subject_alternative_names" {
  description = "Additional domains (ex: www.example.com)"
  type        = list(string)
  default     = []
}

variable "project_name" {
  type    = string
  default = "student-mgmt"
}

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID (Step 10 එකෙන් ලැබෙනවා)"
  type        = string
}