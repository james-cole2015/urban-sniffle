!#/bin/bash
#installing jre & jdk 
apt update
apt install default-jre -y
apt install default-jdk -y
#verifying installs
java -version
javac -version

#installing jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update
apt install jenkins -y
systemctl start jenkins
