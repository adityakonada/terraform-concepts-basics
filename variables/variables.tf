variable "ami_id" {
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "tags" {
    type = map 
    default = {
        name = "hello terraform"
        project = "roboshop"
        environment = "DEV"
        component = "web"
        terraform = "true" #meaning instance created using terraform, not manually
    }
}


variable "sg-name" {
    type = string
    default = "roboshop-all-aws"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "inbound-from-port" {
    #type = number
    default = 0
}

variable "cidr_blocks" {
    type = list  
    default = ["0.0.0.0/0"]
}

#terraform can identify the datatype even if you dont tell the datatype (line 12)
#but it is better practice to tell the type, 
# because when somebody overrides your value, like giving different datatype : giving string instead of list in that place, terraform will reject. ! 