
variable "environment" {
  default = "dev"
}

variable "zone_id" {
  default = "Z06143913AWT2Y6NPPAQL"
}

variable "domain_name" {
  default = "deep90s.online"
}

variable "components" {
  default = {
    catalogue = {
        #rule_priority = 10
        app_version = "v3"
    }
  }
}