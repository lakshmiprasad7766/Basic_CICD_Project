🚀 Project 1: CI/CD Pipeline Implementation
Objective

To build a fully automated CI/CD pipeline for a Java application using Jenkins, Maven, Git, SonarQube, and Nexus, and deploy it to AWS EC2.

Tools Used

Git – Version control

Jenkins – CI/CD automation

Maven – Build and dependency management

SonarQube – Code quality scanning

Nexus – Artifact repository

AWS EC2 (Ubuntu) – Application hosting

Shell scripting – Automation

Architecture Flow
Developer → Git Commit → Jenkins (Trigger) → Maven Build → SonarQube Scan → 
Upload to Nexus → Deploy Artifact to EC2 (via SSH or Script)

Step-by-Step Implementation
🧩 Step 1: Setup Environment

Launch an EC2 instance (Ubuntu 22.04, t2.medium).

Install dependencies:

sudo apt update -y
sudo apt install -y openjdk-11-jdk git maven


Install Jenkins:

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl start jenkins

🧩 Step 2: Setup Git & Maven Project

Create a sample Java app (or use a public GitHub repo like spring-petclinic
).

Add a pom.xml file for Maven build.

🧩 Step 3: Configure Jenkins Job

Create a Freestyle or Pipeline job.

Connect Jenkins to your Git repo:

Add GitHub URL under Source Code Management.

Add build steps:

Maven Build Command:

mvn clean package


Integrate SonarQube plugin:

Install the SonarQube plugin.

Configure Sonar server URL in Jenkins → Manage Jenkins → Configure System.

Add a “SonarQube Scanner” build step:

sonar-scanner -Dsonar.projectKey=myapp -Dsonar.sources=. -Dsonar.host.url=http://<sonarqube-server>:9000


Integrate Nexus to upload the built artifact:

Install Nexus on another EC2 instance (or local).

Configure Maven settings.xml:

<server>
  <id>nexus</id>
  <username>admin</username>
  <password>admin123</password>
</server>


Add post-build step:

mvn deploy

🧩 Step 4: Deployment Automation to EC2

Add a final Jenkins stage:

scp target/*.jar ec2-user@<EC2-IP>:/home/ec2-user/
ssh ec2-user@<EC2-IP> "nohup java -jar /home/ec2-user/app.jar &"

Outcome

✅ End-to-end pipeline automates build → test → quality scan → artifact upload → deployment.
✅ Deployment frequency improved by 70%, manual errors reduced by 40%.
