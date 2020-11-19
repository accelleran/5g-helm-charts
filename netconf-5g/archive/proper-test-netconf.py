from netconf_client.connect import connect_ssh
from netconf_client.ncclient import Manager
import time

HOST = "10.55.1.2"
PORT = 30359

while True:
    try:
        session = connect_ssh(host=HOST, port=PORT, username="helm", password="helm")
        mgr = Manager(session, timeout=120)
        print(session.server_capabilities)
        break
    except:
        print('failed to connect to netconf!')

    time.sleep(1)


