#############################
## Application - Variables ##
#############################

variable "description" {
  default = "this is an ecom appservice"
  description = ""
}

# azure region shortname
variable "region" {
  type        = string
  default     = "eastus"
  description = "Azure region where the resource group will be created"
}



variable "tags" {
  type = map(string)
  default = {
    "application"    = "ecom"
    "environment"     = "dev"
    "product_owner"   = ""
    "sensitive_data"  = ""
    "support_contact" = ""
    "tech_owner"      = ""
  }
}
