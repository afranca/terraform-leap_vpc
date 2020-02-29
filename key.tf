resource "aws_key_pair" "leapkeypair" {
  key_name   = "leapkeypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}