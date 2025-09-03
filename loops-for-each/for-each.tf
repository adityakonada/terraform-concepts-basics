# resource "aws_instance" "web" {
#   #count = 11 # count.index is a special variable given by terraform
#   count = length(var.instance_names) #length is the lenght function, calculating lenth of list 
#   ami           = var.ami_id #devops-practice
#   instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t3.micro"
#   tags = {
#     Name = var.instance_names[count.index]
#   }
# }

#THE ABOVE IS FOR LIST TYPE VARIABLES, WE USED count & special variable = [count.index]

#THE BELOW IS FOR MAP TYPE VARIABLES, WE USE for_each & special vairable = each

resource "aws_instance" "web" {
  for_each = var.instance_names
  ami           = var.ami_id 
  instance_type = each.value #value=t3.micro
  tags = {
    Name = each.key #key = mongodb
  }
}

# resource "aws_route53_record" "www" {
#   #count = 11
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain_name}" #interpolation
#   type    = "A"
#   ttl     = 1
#   records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
# }

resource "aws_route53_record" "www" {
  for_each = aws_instance.web # we are iterating output of the above blue code L15 to 22 using for_each
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}

# output "instances_info" {
#   value = aws_instance.web
# }