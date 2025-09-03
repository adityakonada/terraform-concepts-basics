variable "ingress_rules" {
  default = [
    {
        description      = "Allow port 80"
        from_port        = 80 # 0 means all ports
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allow port 443"
        from_port        = 443 # 0 means all ports
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allow port 22"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    #adding another inbound rule 3306, to understand the concept of desired state & current state
    {
        description      = "Allow port 3306"
        from_port        = 3306
        to_port          = 3306
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  ]
}