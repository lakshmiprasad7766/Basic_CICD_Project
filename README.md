# Basic_CICD_Project
This is a basic CICD project using Jenkins, Maven using AWS


Install and configure Jenkins
-> Login to AWS console and lauch instances name = Jenkins_server server = Amazon_linux_2 t2 micro Lanuch instance

-> copy public IP -> open Git bash -> connect ssh ec2

-> goto Root user


Project Document:
https://chatgpt.com/share/68885417-d538-8007-b3ec-75e9b3833e9c


complete beginner-friendly DevOps project that walks you through CI/CD using:

Git Bash (for version control and command line)

Linux (Ubuntu environment)

Docker (for containerization)

AWS EC2 (for cloud deployment)

🔧 Project Overview
We'll build and deploy a simple Python Flask web app using CI/CD. The steps include:

Create and version control the code with Git.

Dockerize the app.

Push the code to GitHub.

Setup a CI/CD pipeline:

CI using GitHub Actions

CD on AWS EC2 using Docker

🚀 Step-by-Step DevOps Project
✅ 1. Create a Simple Flask App
File Structure:

Copy
Edit
flask-app/
├── app.py
├── requirements.txt
├── Dockerfile
├── .github/
│   └── workflows/
│       └── ci.yml
app.py
python
Copy
Edit
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Flask App deployed using CI/CD!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
requirements.txt
ini
Copy
Edit
Flask==2.3.2
Dockerfile
dockerfile
Copy
Edit
# Base image
FROM python:3.9-slim

# Working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Run the app
CMD ["python", "app.py"]
✅ 2. Initialize Git Repository
bash
Copy
Edit
git init
git add .
git commit -m "Initial commit - Flask app with Docker"
✅ 3. Push to GitHub
Create a repo on GitHub: https://github.com/yourusername/flask-cicd-app

Connect and push:

bash
Copy
Edit
git remote add origin https://github.com/yourusername/flask-cicd-app.git
git branch -M main
git push -u origin main
✅ 4. Create CI Workflow using GitHub Actions
.github/workflows/ci.yml
yaml
Copy
Edit
name: CI Build

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.9'

    - name: Install dependencies
      run: |
        pip install -r requirements.txt

    - name: Run app test
      run: |
        python app.py &
        sleep 5
        curl -f http://localhost:5000 || exit 1
✔ This pipeline:

Installs dependencies

Runs the app and checks if it works

✅ 5. Setup AWS EC2 and Docker
EC2 Setup
Launch EC2 (Ubuntu)

Open port 5000 in security group

SSH into EC2:

bash
Copy
Edit
ssh -i your-key.pem ubuntu@your-ec2-ip
Install Docker:

bash
Copy
Edit
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
newgrp docker
✅ 6. CD: Deploy Flask Docker App on EC2
On EC2:

bash
Copy
Edit
# Clone your repo
git clone https://github.com/yourusername/flask-cicd-app.git
cd flask-cicd-app

# Build and run Docker
docker build -t flask-cicd .
docker run -d -p 5000:5000 flask-cicd
Access: http://your-ec2-ip:5000

🧠 What You’ve Learned
Git & GitHub for version control

Docker for containerization

GitHub Actions for CI

AWS EC2 for cloud deployment

Manual CD (can be automated with GitHub secrets and SSH)

Would you like me to extend this to:

Add automated CD (deploy automatically to EC2 on push)?

Include Nginx + HTTPS?

Use ECR (Elastic Container Registry) and ECS?
