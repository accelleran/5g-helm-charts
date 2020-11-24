cp ../../../tools/run-test .

create_lib_folder.sh

docker build --add-host sign.ant.accelleran.com:10.188.6.149 --add-host jenkins2.ant.accelleran.com:10.188.6.149 --add-host jenkins.ant.accelleran.com:10.188.6.149 -t 5g-maxi -f Dockerfile.allInOne .
