#!/bin/bash

###################################################################
# Title:        Delete Accelleran 5G applications
# Author:       Ensar Zeljkovic
# E-mail:       ensar.zeljkovic@accelleran.com
# Args:         /
# Description:  This script deletes the Accelleran 5G applications
#               that were installed using the
#               run-microservice-test.sh script.
###################################################################

helm delete fg-amf-tester-1 fg-amf-tester-2 fg-cu-cp fg-cu-up-1 fg-cu-up-2 fg-du-tester fg-e1-up-1 fg-e1-up-2 fg-e1-cp-1 fg-e1-cp-2 fg-ng-ap-1 fg-ng-ap-2
helm delete fg-nkafka-5g
