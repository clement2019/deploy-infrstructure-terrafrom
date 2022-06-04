provider "aws" {
  profile = "myaws"
  region  = var.region

}

resource "aws_instance" "mydocker-server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "devopskey"
  vpc_security_group_ids = ["${aws_security_group.firewall.id}"]

  #Now run into the resource and run the following application

  connection {

    type        = "ssh"
    user        = "ec2-user"
    port        = 22
    private_key = file("C:/Users/IDEAPAD/Downloads/devopskey.pem")
    host        = aws_instance.mydocker-server.public_ip

  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum isntall httpd -y",
      "sudo systectl start httpd",
      "sudo systectl enable httpd",
      "sudo yum install git -y"


    ]

  }
  tags = {
    Name = "Firewall"
  }

}