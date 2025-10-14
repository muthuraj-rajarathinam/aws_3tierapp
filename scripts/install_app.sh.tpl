
#!/bin/bash
sudo yum update -y

sudo yum install docker git -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose version


# --- Clone and Setup ---
cd /home/ec2-user
mkdir -p app
cd app


echo "Cloning repository..."
git clone https://github.com/muthuraj-rajarathinam/aws_3tierapp.git
cd demorepo
chown -R ec2-user:ec2-user .

export DB_HOST=${db_endpoint}
export DB_USER=${db_user}
export DB_PASS=${db_pass}

cat > .env <<EOF
DB_HOST=${db_endpoint}
DB_USER=${db_user}
DB_PASS=${db_pass}
EOF

docker compose up -d --build 

echo "Deployment complete at $(date)" > /home/ec2-user/deploy.log
