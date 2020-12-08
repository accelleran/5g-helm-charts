#!/bin/bash
waiting_period=10

echo "Starting AMF TESTERS..."
helm install fg-amf-tester-1 . --values amf-tester-1-values.yaml 
helm install fg-amf-tester-2 . --values amf-tester-2-values.yaml 
sleep $waiting_period
echo "Starting CuUps..."
helm install fg-cu-up-1 . --values cu-up-1-values.yaml 
helm install fg-cu-up-2 . --values cu-up-2-values.yaml 
sleep $waiting_period
echo "Starting e1-sctp-ups..."
helm install fg-e1-up-1 . --values e1-sctp-up-1-values.yaml 
helm install fg-e1-up-2 . --values e1-sctp-up-2-values.yaml 
sleep $waiting_period
echo "Starting CuCp..."
helm install fg-cu-cp . --values cu-cp-values.yaml 
sleep $waiting_period
echo "Starting DU TESTER..."
helm install fg-du-tester . --values du-tester-values.yaml 
echo "Finished!"
