del /./KSSoftware_Test_Download/*.jar
del /./KSSoftware_Test_Download/build

cd c:/�����ڷ�/KSSoftware
call gradlew bootJar
move build/libs/*.jar /./KSSoftware_Test_Download

cd src/front
call npm run build
move build /./KSSoftware_Test_Download

cd /./KSSoftware_Test_Download
git add .
git commit -m "Upload Build"
git push

ssh -i "C:\KSSoftware_Test_Download\KSSoftwareTest_Keypair.pem" ubuntu@ec2-52-64-204-202.ap-southeast-2.compute.amazonaws.com
