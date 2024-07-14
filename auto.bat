@echo off

gradlew bootJar

cd src/front 

dir

npm run build

cd C:\KSSoftware_Test_Download

dir

del *.jar
rmdir build

cd C:\대학자료\KSSoftware\src\front

dir

move build C:\KSSoftware_Test_Download

cd C:\대학자료\KSSoftware\build\libs

dir

move KS*.jar C:\KSSoftware_Test_Download

git add .
git commit -m "new build"
git push

ssh -i "C:\KSSoftware_Test_Download\KSSoftwareTest_Keypair.pem" ubuntu@ec2-52-64-204-202.ap-southeast-2.compute.amazonaws.com