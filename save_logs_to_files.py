import subprocess
import datetime

cmd = "kubectl get pods "
# pods = subprocess.run(cmd, shell=True)

pods = subprocess.getoutput(cmd)

# print (datetime.datetime.now().year)
print(pods)

time = "{y}-{M}-{d}-{h}-{m}-{s}".format(
                y=datetime.datetime.now().year,
                M=datetime.datetime.now().month,
                d=datetime.datetime.now().day,
                h=datetime.datetime.now().hour,
                m=datetime.datetime.now().minute,
                s=datetime.datetime.now().second
            )

# Create a folder with current date and tim ein the logs folder
subprocess.run(
    "mkdir logs/{folder}".format(folder=time),
    shell=True
    )

for line in str(pods).splitlines():
    if line:
        pod = line.split(" ")[0]
        if "acc-fiveg-" in pod:
            print("Saving logs for pod: [{pod}]...".format(pod=pod))

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

            filename = "{pod}_{time}".format(
                pod=pod,
                time=time
            )

            cmd = "kubectl logs {pod} > logs/{time}/{file}".format(pod=pod, time=time, file=filename)

            cmd_exec = subprocess.run(cmd, shell=True)

            print("Command exit code: {c}".format(c=cmd_exec.returncode))

