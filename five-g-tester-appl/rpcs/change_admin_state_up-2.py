from netconf_client.connect import connect_ssh
from netconf_client.ncclient import Manager
HOST = "172.31.36.102"
PORT = 31831
session = connect_ssh(host=HOST, port=PORT, username="user", password="user")
mgr = Manager(session, timeout=12000000)
rpc = """
<config xmlns:nc="urn:ietf:params:xml:ns:netconf:base:1.0">
<gnb-cu-up xmlns="http://accelleran.com/ns/yang/accelleran-gnb-cu-up" xmlns:xc="urn:ietf:params:xml:ns:netconf:base:1.0" xc:operation="replace">
	<admin-state>unlocked</admin-state>
</gnb-cu-up>
</config>"""
print(mgr.edit_config(config=rpc, target='running', default_operation=None))
