helm install acc-5g-cu-cp-1 ../acc-5g-cu-cp/ --values aws-lab-kit_5g-cu-cp-1_0-2-0.yaml
helm install acc-5g-cu-up-1 ../acc-5g-cu-up/ --values aws-lab-kit_5g-cu-up-1_0-2-0.yaml
helm install acc-5g-cu-up-2 ../acc-5g-cu-up/ --values aws-lab-kit_5g-cu-up-2_0-2-0.yaml 
helm install acc-5g-nkafka-5g ../acc-five-g/ --values ../acc-five-g/nkafka-5g-values.yaml --values ../acc-five-g/order-global-values.yaml
