resource "aws_instance" "web" {
  #count = 11 # count.index is a special variable given by terraform
  count = length(var.instance_names) #length is the lenght function, calculating lenth of list 
  ami           = var.ami_id #devops-practice
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t3.micro"
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "www" {
  #count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip] #condition
}

# name    = "${var.instance_names[count.index]}.adityakonada.site " snytax to mix variable & static text
#implemented : loops, conditions, variables & data-types