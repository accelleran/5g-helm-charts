#!/bin/bash

# Declare list of images names
declare -a arr=("accFiveGBase" "amfTesterAppl" "amfControllerAppl" "duControllerAppl" "gnbControllerAppl" "resMgrAppl" "duTesterAppl" "cuUpAppl" "e1CpAppl" "resMgrUpAppl" "cuUpControllerAppl" "e1sctpUpAppl" "ngapAppl" "rrCtrlAppl" "dsCtrlAppl" "f1apIntfAppl" "pmControllerAppl" "sctpCpAppl" "netconf")

# Run the create lib folder script to take only needed libs
create_lib_folder.sh

# Convert Docker name to lowercase because docker only accept this using ${i,,}
for i in "${arr[@]}"
do
   echo "Building $i..."
   echo docker build --add-host sign.ant.accelleran.com:10.188.6.149 --add-host jenkins2.ant.accelleran.com:10.188.6.149 --add-host jenkins.ant.accelleran.com:10.188.6.149 -t ${i,,} -f Dockerfile.$i .

   docker build --add-host sign.ant.accelleran.com:10.188.6.149 --add-host jenkins2.ant.accelleran.com:10.188.6.149 --add-host jenkins.ant.accelleran.com:10.188.6.149 -t ${i,,} -f Dockerfile.$i .

done
