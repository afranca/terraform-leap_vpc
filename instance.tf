resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the public SSH key
  key_name = aws_key_pair.leapkeypair.key_name  

  # the VPC subnet
  subnet_id = aws_subnet.main-public-sb.id

 # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]  

}