#!/bin/bash
# Update and install Docker
sudo yum update -y
sudo yum install -y jq docker


# Enable Docker service
sudo service docker start
sudo usermod -a -G docker ec2-user

# Get the latest version of Docker Compose 
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


