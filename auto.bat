@echo off
git add .
git commit -m "new build"
git push

ssh -i "C:\KSSoftware_Test_Download\KSSoftwareTest_Keypair.pem" ubuntu@ec2-52-64-204-202.ap-southeast-2.compute.amazonaws.com

timeout /t 5

cd ~
cd /usr/local
sudo rm -rf app
sudo git clone https://github.com/kim-do-kyun/KSSoftware_Test_Download.git app
cd app
sudo java -jar K*.jar
pause