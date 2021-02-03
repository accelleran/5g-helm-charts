#!/bin/bash

###################################################################
# Title:        Running Accelleran 5G applications in order
# Author:       Ensar Zeljkovic
# E-mail:       ensar.zeljkovic@accelleran.com
# Args:         /
# Description:  This script installs Accelleran 5G applications
#               in a pre-defined order. It uses helm as the
#               deployment tool. Each application uses two values
#               files. The order-global-values.yaml is used to
#               define shared values among all helm charts. The
#               second values file is a per-helm chart, specific
#               values file. After each helm install command is
#               executed, there is a waiting period defined in the
#               "waiting_period" variable, to allow for the
#               application to get deployed and run.
#               By default, this script will run both the amfTester
#               and duTester applications as well, to test the
#               complete end-to-end connectivity and message
#               exchange. If you are using a real AMF and/or a real
#               DU, comment out the amfTester and/or duTester
#               sections of the script.
#               You can also choose whether you install NKafka-5G
#               here, or install it manually.
###################################################################

waiting_period=30

echo "Starting NKafka-5G..."
helm install fg-nkafka-5g . --values nkafka-5g-values.yaml --values order-global-values.yaml

echo "Starting CuUps..."
helm install fg-cu-up-1 . --values cu-up-1-values.yaml --values order-global-values.yaml
helm install fg-cu-up-2 . --values cu-up-2-values.yaml --values order-global-values.yaml
#sleep $waiting_period

echo "Starting E1Cps..."
helm install fg-e1-cp-1 . --values e1-cp-1-values.yaml --values order-global-values.yaml
helm install fg-e1-cp-2 . --values e1-cp-2-values.yaml --values order-global-values.yaml
echo "Starting CuCp..."
helm install fg-cu-cp . --values cu-cp-values.yaml --values order-global-values.yaml
echo "Starting NgAps..."
helm install fg-ng-ap-1 . --values ng-ap-1-values.yaml --values order-global-values.yaml
helm install fg-ng-ap-2 . --values ng-ap-2-values.yaml --values order-global-values.yaml
#sleep $waiting_period

echo "Starting e1-sctp-ups..."
helm install fg-e1-up-1 . --values e1-sctp-up-1-values.yaml --values order-global-values.yaml
helm install fg-e1-up-2 . --values e1-sctp-up-2-values.yaml --values order-global-values.yaml

echo "Waiting for CU to become ready..."
sleep $waiting_period

echo "Starting AMF TESTERS..."
helm install fg-amf-tester-1 . --values amf-tester-1-values.yaml --values order-global-values.yaml
helm install fg-amf-tester-2 . --values amf-tester-2-values.yaml --values order-global-values.yaml
#sleep $waiting_period

sleep 10

echo "Starting DU TESTER..."
helm install fg-du-tester . --values du-tester-values.yaml --values order-global-values.yaml
echo "Finished!"
