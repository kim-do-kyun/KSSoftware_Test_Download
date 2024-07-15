@echo off
cd C:\대학자료\KSSoftware
call gradlew bootJar
cd src/front
npm run build
move build KSSoftware_Test_Download
cd C:\대학자료\KSSoftware\build\libs
move KS*.jar KSSoftware_Test_Download

git add .
git commit -m "new build"
git push

ssh -i "C:\KSSoftware_Test_Download\KSSoftwareTest_Keypair.pem" ubuntu@ec2-52-64-204-202.ap-southeast-2.compute.amazonaws.com