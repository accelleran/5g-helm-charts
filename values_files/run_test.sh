#helm install acc-5g-redis ~/acc-repos/helm-charts/redis-0.6.0.tgz  --values lab-kit_5g-redis-0-6-0.yaml
helm install acc-5g-cu-cp-1 ../acc-5g-cu-cp/ --values lab-kit_5g-cu-cp-1_0-3-0.yaml
helm install acc-5g-cu-up-1 ../acc-5g-cu-up/ --values lab-kit_5g-cu-up-1_0-3-0.yaml
helm install acc-5g-cu-up-2 ../acc-5g-cu-up/ --values lab-kit_5g-cu-up-2_0-3-0.yaml 
#helm install acc-5g-nkafka-5g ../nkafka-5g/ --values ../values_files/lab-kit_nkafka-5g.yaml --values ../acc-five-g/order-global-values.yaml

helm install acc-5g-nkafka-5g nkafka-5g/ --values values_files/lab-kit-nkafka5g.yaml --values acc-five-g/order-global-values.yaml