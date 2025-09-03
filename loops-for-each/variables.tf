
variable "instance_names" {
  type = map
  default = {
    mongodb = "t3.small"
    redis = "t3.micro"
    mysql = "t3.small"
    rabbitmq = "t3.micro"
    catalogue = "t3.micro"
    cart = "t3.micro"
    user = "t3.micro"
    shipping = "t3.small"
    payment = "t3.micro"
    dispatch = "t3.micro"
    web = "t3.micro"
  }
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