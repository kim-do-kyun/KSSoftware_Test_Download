cd C:/KSSoftware_Test_Download
del *.jar
rmdir /S /Q build
echo "jar���� ����"

cd c:/�����ڷ�/KSSoftware
call gradlew bootJar
echo "�׷��� ���� �Ϸ�"

cd build/libs
move *.jar /./KSSoftware_Test_Download
echo "jar���� �̵� �Ϸ�"

cd c:/�����ڷ�/KSSoftware/src/front
call npm run build
echo "run build �Ϸ�"

move build /./KSSoftware_Test_Download
echo "build���� �̵��Ϸ�"

cd /./KSSoftware_Test_Download
git add .
git commit -m "Upload Build"
git push

ssh -i "C:\KSSoftware_Test_Download\KSSoftwareTest_Keypair.pem" ubuntu@ec2-52-64-204-202.ap-southeast-2.compute.amazonaws.com <<\EOF

bash ./auto.sh

EOF

pause