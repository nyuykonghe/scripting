[sonar@sonar ~]$ cat sonarqube-install.sh
#!/bin/bash
# Script for installing sonarqube and dependencies
echo
cd /opt
# Installing Java, git and wget for sonarque
sudo yum -y install unzip wget git
sudo yum -y install java-11-openjdk-devel
echo

# Download and extract SonarQube Server software
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube
echo

# Granting file persmissions for sonar user to start and manage sonarQube
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/

echo
# Creating link for commanding sonarqube server
sudo ln -s /opt/sonarqube/bin/linux-x86-64/sonar.sh /usr/bin/sonar
cd ..
echo

# Start sonarQube server
sudo sonar start
sudo sonar status
echo
echo "Finished installing SonarQube!"
echo "=============================="
echo
[sonar@sonar ~]$
