variable "ami_id" {
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "instance_name" {
    type = string
    default = "mongodb" #if web is given in mongodb place, t3.micro will be installed
}
