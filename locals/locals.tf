locals {
    name = "sivakumar"
    training = "terraform"
    instance_type = var.isProd? "t3.small" : "t3.micro"
}