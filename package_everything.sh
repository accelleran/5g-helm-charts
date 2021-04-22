helm package cu-up-controller ds-ctrl e1-cp res-mgr-up amf-controller du-controller e1-sctp-up pm-controller rr-ctrl amf-tester cu-up du-tester f1-ap gnb-controller ng-ap res-mgr sctp nkafka-5g

#find -maxdepth 1 -mindepth 1 \( \! -name ".git" \! -name "*.tgz" \! -name "index.yaml" \! -name "*.sh*" \! -name "" \! -name "CHANGELOG.md" \! -name "README.md" \) -exec sh -c '
# for i do
#   helm package "$i"
# done' sh {} +


#mv *.tgz acc-five-g/charts/

