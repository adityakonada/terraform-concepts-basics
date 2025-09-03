resource "aws_instance" "web" {
  ami           = var.ami_id            #centos-8-devops-practice ami id
  instance_type = var.instance_name=="mongodb" ? "t3.small" : "t3.micro"
}