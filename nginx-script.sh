#!bin/bash
# install the nginx web server
sudo apt-get update
sudo apt install nginx-core -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
sudo apt-get install git -y