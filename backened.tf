terraform {
  backend "s3" {
    bucket = "jenkins-terraform-aws"
    key    = "nginx/terraform.tfstate"
    region = "eu-west-2"
  }
}