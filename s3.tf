resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-jenkins-packer-093005032020"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}

