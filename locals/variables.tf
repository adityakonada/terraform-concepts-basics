variable "isProd" {
    type = bool
    default = false
}

variable "ami_id" {
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "zone_id" {
    type = string
    default = "Z06052533ER7D19715K92"
}

variable "domain_name" {
  default = "adityakonada.site"
}