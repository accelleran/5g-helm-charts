import subprocess


pods = """
fg-amf-tester-1-acc-fiveg-amf-tester-5bc9b84bf6-w58zw   1/1     Running     0          6m46s
fg-amf-tester-2-acc-fiveg-amf-tester-77db6b5785-nlc7w   1/1     Running     0          6m45s
fg-cu-cp-acc-fiveg-amf-controller-5669b4944d-nmk5h      1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-cu-up-controller-59cf5bffc5-cscj5    1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-ds-ctrl-5854cc9d79-7qnmd             1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-du-controller-7ff8f47cf5-bgr6b       1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-f1-ap-6d8db757c8-gb576               1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-gnb-controller-5667887997-zcrqv      1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-pm-controller-7786fd7c4-zh2vh        1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-res-mgr-59c78b7458-g82vb             1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-rr-ctrl-546dc9cd44-g676h             1/1     Running     0          5m24s
fg-cu-cp-acc-fiveg-sctp-797bc488db-zlddt                1/1     Running     0          5m23s
fg-cu-up-1-acc-fiveg-cu-up-5b89667d7-zvv74              1/1     Running     0          6m19s
fg-cu-up-1-acc-fiveg-res-mgr-up-77f866bd87-b5skk        1/1     Running     0          6m19s
fg-cu-up-2-acc-fiveg-cu-up-8f6cddbdc-grhg6              1/1     Running     0          6m19s
fg-cu-up-2-acc-fiveg-res-mgr-up-7575849bdb-zw56c        1/1     Running     0          6m19s
fg-du-tester-acc-fiveg-du-tester-8b8bc6b9b-kkbwn        1/1     Running     0          4m57s
fg-e1-cp-1-acc-fiveg-e1-cp-7577489db5-pprzl             1/1     Running     0          5m27s
fg-e1-cp-2-acc-fiveg-e1-cp-68cbf55c64-x8x8v             1/1     Running     0          5m25s
fg-e1-up-1-acc-fiveg-e1-sctp-up-7c64954db5-lxdwp        1/1     Running     0          5m53s
fg-e1-up-2-acc-fiveg-e1-sctp-up-5f86fd5d44-hlr8z        1/1     Running     0          5m51s
fg-ng-ap-1-acc-fiveg-ng-ap-68bb49fc69-7gjmj             1/1     Running     0          5m23s
fg-ng-ap-2-acc-fiveg-ng-ap-8477b67f9b-jsd6b             1/1     Running     0          5m23s
"""

for line in pods.splitlines():
    if line:
        pod = line.split(" ")[0]
        print("Pod: [{pod}]".format(pod=pod))

        # words = line.split(" ")[0].split('-')
        #
        # filename = "log"
        # for word in words:
        #     if word == "fg":
        #         continue
        #     if word == "acc":
        #         break
        #     filename = filename + "-" + word
        #
        # print("Saving log to [{f}]".format(f=filename))

        cmd = "kubectl logs {pod} > logs/{file}".format(pod=pod, file=pod)

        cmd_exec = subprocess.run(cmd, shell=True)

        print("Command exit code: {c}".format(c=cmd_exec.returncode))

