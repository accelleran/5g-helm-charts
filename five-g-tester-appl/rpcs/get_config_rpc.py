from netconf_client.connect import connect_ssh
from netconf_client.ncclient import Manager
HOST = "10.55.1.2"
PORT = 31830 # cuup-1
PORT = 31833 # cuup-2
PORT = 31832 # cucp-1
session = connect_ssh(host=HOST, port=PORT, username="helm", password="helm")
mgr = Manager(session, timeout=1200000000)
print(mgr.get().data_xml)