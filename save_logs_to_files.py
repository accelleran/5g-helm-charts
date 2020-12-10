import subprocess


pods = """
fg-amf-tester-1-acc-fiveg-amf-tester-7987dd54cb-tz8gv   1/1     Running     0          13m
fg-amf-tester-2-acc-fiveg-amf-tester-574c5545c9-cbqrv   1/1     Running     0          13m
fg-cu-cp-acc-fiveg-amf-controller-57cd544b84-jsvtt      1/1     Running     0          12m
fg-cu-cp-acc-fiveg-cu-up-controller-79c567c7-4sxrn      1/1     Running     0          12m
fg-cu-cp-acc-fiveg-ds-ctrl-65b7999489-9drjs             1/1     Running     0          12m
fg-cu-cp-acc-fiveg-du-controller-564c955c49-gnrld       1/1     Running     0          12m
fg-cu-cp-acc-fiveg-f1-ap-7478b4744b-s6qbv               1/1     Running     0          12m
fg-cu-cp-acc-fiveg-gnb-controller-899bc678c-rk8gn       1/1     Running     0          12m
fg-cu-cp-acc-fiveg-pm-controller-5467558ccd-lgnx4       1/1     Running     0          12m
fg-cu-cp-acc-fiveg-res-mgr-9d97bf786-nwzs9              1/1     Running     0          12m
fg-cu-cp-acc-fiveg-rr-ctrl-59c4d7676d-9l5sf             1/1     Running     0          12m
fg-cu-cp-acc-fiveg-sctp-6f44b75bcd-g8mpn                1/1     Running     0          12m
fg-cu-up-1-acc-fiveg-cu-up-8487bd8d8f-2sr6r             1/1     Running     0          13m
fg-cu-up-1-acc-fiveg-res-mgr-up-57cd9745fc-nrljt        1/1     Running     0          13m
fg-cu-up-2-acc-fiveg-cu-up-7cd7964c7-g8fbd              1/1     Running     0          12m
fg-cu-up-2-acc-fiveg-res-mgr-up-79c6674b4b-qzv46        1/1     Running     0          12m
fg-du-tester-acc-fiveg-du-tester-6df79694c6-qtp5q       1/1     Running     0          11m
fg-e1-cp-1-acc-fiveg-e1-cp-64b9455bdc-8xfr9             1/1     Running     0          12m
fg-e1-cp-2-acc-fiveg-e1-cp-7454fc977b-6mbhs             1/1     Running     0          12m
fg-e1-up-1-acc-fiveg-e1-sctp-up-6894868f55-zpgd4        1/1     Running     0          12m
fg-e1-up-2-acc-fiveg-e1-sctp-up-b87f94756-jb78n         1/1     Running     0          12m
fg-ng-ap-1-acc-fiveg-ng-ap-6f75cd6f55-l7swf             1/1     Running     0          12m
fg-ng-ap-2-acc-fiveg-ng-ap-59ffb6b7d4-m87td             1/1     Running     0          12m
"""

for line in pods.splitlines():
    if line:
        pod = line.split(" ")[0]
        print("Pod: [{pod}]".format(pod=pod))

        words = line.split(" ")[0].split('-')

        filename = "log"
        for word in words:
            if word == "fg":
                continue
            if word == "acc":
                break
            filename = filename + "-" + word

        print("Saving log to [{f}]".format(f=filename))

        cmd = "kubectl logs {pod} > logs/{file}".format(pod=pod, file=filename)

        cmd_exec = subprocess.run(cmd)

        print("Command exit code: {c}".format(c=cmd_exec.returncode))

