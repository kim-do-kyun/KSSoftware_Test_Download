cd C:/KSSoftware_Test_Download
del *.jar
echo "jar파일 삭제"

cd c:/대학자료/KSSoftware
call gradlew bootJar
echo "그래들 빌드 완료"

move build/libs/K*.jar C:/KSSoftware_Test_Download
echo "jar파일 이동 완료"

cd src/front
call npm run build
echo "run build 완료"

move build /./KSSoftware_Test_Download
echo "build파일 이동완료"

cd /./KSSoftware_Test_Download
git add .
git commit -m "Upload Build"
git push

ssh -i "C:\KSSoftware_Test_Download\KSSoftwareTest_Keypair.pem" ubuntu@ec2-52-64-204-202.ap-southeast-2.compute.amazonaws.com