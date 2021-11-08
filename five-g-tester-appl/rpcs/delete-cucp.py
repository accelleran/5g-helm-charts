from netconf_client.connect import connect_ssh
from netconf_client.ncclient import Manager

HOST = "10.55.1.2"
PORT = 31832

session = connect_ssh(host=HOST, port=PORT, username="helm", password="helm")
mgr = Manager(session, timeout=120)

defPathCuCp = """<config>
<gnb-cu-cp xmlns="http://accelleran.com/ns/yang/accelleran-gnb-cu-cp" xmlns:xc="urn:ietf:params:xml:ns:netconf:base:1.0" xc:operation="delete"/>
</config>"""

print(mgr.edit_config(config=defPathCuCp,target='running', default_operation=None))
