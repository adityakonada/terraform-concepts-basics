variable "sg-name" {
    type = string
    default = "roboshop-all-aws"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "inbound-from-port" {
    #type = string
    default = 0
}

variable "cidr_blocks" {
    type = list  
    default = ["0.0.0.0/0"]
}

#terraform can identify the datatype even if you dont tell the datatype (line 12)
#but it is better practice to tell the type, 
# because when somebody overrides your value, like giving different datatype : giving string instead of list in that place, terraform will reject. ! 