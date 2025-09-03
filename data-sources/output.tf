output "ami_id" {  #ami_id = we named it for our reference of this output
    value = data.aws_ami.centos8.id    #data=file; aws_ami.centos8=first line in file; centos8=terraform reference; .id = grabbing only id information of the AMI
}

output "ami_name_amazon" { 
    value = data.aws_ami.amazon_linux_2023.id
}

output "ami_id_amazon" { 
    value = data.aws_ami.amazon_linux_2023.name
}

output "vpc_id" {
    value = data.aws_vpc.dafault
}