variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "leapkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "leapkey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    eu-central-1 = "ami-0b418580298265d5c"
    eu-west-2 = "ami-006a0174c6c25ac06"
  }
}

variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "JENKINS_VERSION" {
  default = "2.204.1"
}

variable "TERRAFORM_VERSION" {
  default = "0.12.18"
}

variable "APP_INSTANCE_COUNT" {
  default = "0"
}
