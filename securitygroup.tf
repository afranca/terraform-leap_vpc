resource "aws_security_group" "allow-ssh-sg" {
    vpc_id  =   aws_vpc.main.id
    name    =   "allow-ssh-sg"
    description =   "security group that allows ssh and all egress traffic"

    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks =  ["0.0.0.0/0"]
    }

    ingress{
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow-ssh-sg"
    }
}

resource "aws_security_group" "allow-mariadb-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-mariadb-sg"
  description = "allow-mariadb connections"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.allow-ssh-sg.id] 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    Name = "allow-mariadb-sg"
  }
}

