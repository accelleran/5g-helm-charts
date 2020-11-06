#!/bin/bash

# Declare list of images names
declare -a arr=("amfTesterAppl" "amfControllerAppl" "duControllerAppl" "gnbControllerAppl" "resMgrAppl" "duTesterAppl" "cuUpAppl" "e1CpAppl" "resMgrUpAppl" "cuUpControllerAppl" "e1sctpUpAppl" "ngapAppl" "rrCtrlAppl" "dsCtrlAppl" "f1apIntfAppl" "pmControllerAppl" "sctpCpAppl")

mkdir lib
cd native/lib && tar cf - *so* | tar xvf - -C ../../lib
cd ../../
ls



# Convert Docker name to lowercase because docker onlty accept this using ${i,,}
for i in "${arr[@]}"
do
   echo "Building $i..."
   echo docker build --add-host sign.ant.accelleran.com:10.188.6.149 --add-host jenkins2.ant.accelleran.com:10.188.6.149 --add-host jenkins.ant.accelleran.com:10.188.6.149 -t ${i,,} -f Dockerfile.$i .

   docker build --add-host sign.ant.accelleran.com:10.188.6.149 --add-host jenkins2.ant.accelleran.com:10.188.6.149 --add-host jenkins.ant.accelleran.com:10.188.6.149 -t ${i,,} -f Dockerfile.$i .

done



