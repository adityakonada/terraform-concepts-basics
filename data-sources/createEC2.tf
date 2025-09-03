resource "aws_instance" "web" {
    ami = data.aws_ami.centos8.id
    instance_type = "t3.micro"
    tags = {
        Name = "Using data-source"
    }
}