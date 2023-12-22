#!/bin/bash
git clone https://github.com/FariusGitHub/dockerize_web_app.git
cd dockerize_web_app
sudo apt-get update
sudo apt-get install -y docker.io
sudo apt update
sudo apt install curl
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo docker-compose up
