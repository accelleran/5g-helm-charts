import subprocess


pods = """
fg-amf-tester-1-acc-fiveg-amf-tester-7dfb9968b4-shvrq   1/1     Running     0          5m16s
fg-amf-tester-2-acc-fiveg-amf-tester-6c687b66cf-xsjrr   1/1     Running     0          5m16s
fg-cu-cp-acc-fiveg-amf-controller-76f8449b64-j65h8      1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-cu-up-controller-5fdd8fdcc7-6zsst    1/1     Running     0          3m56s
fg-cu-cp-acc-fiveg-ds-ctrl-77d8989865-bpsvp             1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-du-controller-7f6dd8ccd5-s8h7m       1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-f1-ap-75b94b4446-5qdnr               1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-gnb-controller-6cdc9fd95f-wd6lg      1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-pm-controller-674db665db-7q666       1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-res-mgr-6bd7c88bbb-9pxcq             1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-rr-ctrl-78ddcf8cd4-knm7w             1/1     Running     0          3m55s
fg-cu-cp-acc-fiveg-sctp-555685679d-7sjzr                1/1     Running     0          3m55s
fg-cu-up-1-acc-fiveg-cu-up-74b9f7c9d9-86jw2             1/1     Running     0          4m50s
fg-cu-up-1-acc-fiveg-res-mgr-up-56474469d9-b2xhd        1/1     Running     0          4m50s
fg-cu-up-2-acc-fiveg-cu-up-57f86c6697-wcwvx             1/1     Running     0          4m49s
fg-cu-up-2-acc-fiveg-res-mgr-up-68f878f878-xqn7m        1/1     Running     0          4m49s
fg-du-tester-acc-fiveg-du-tester-988cf759b-qj6q9        1/1     Running     0          3m29s
fg-e1-cp-1-acc-fiveg-e1-cp-7f88b5968c-lw88x             1/1     Running     0          3m58s
fg-e1-cp-2-acc-fiveg-e1-cp-6586db989b-t8j4z             1/1     Running     0          3m57s
fg-e1-up-1-acc-fiveg-e1-sctp-up-67f5576bf5-bzbls        1/1     Running     0          4m24s
fg-e1-up-2-acc-fiveg-e1-sctp-up-6cb8b4f79b-bgd2l        1/1     Running     0          4m23s
fg-ng-ap-1-acc-fiveg-ng-ap-9d7c99767-5m54g              1/1     Running     0          3m55s
fg-ng-ap-2-acc-fiveg-ng-ap-6d8d47857b-pfnvm             1/1     Running     0          3m54s
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

