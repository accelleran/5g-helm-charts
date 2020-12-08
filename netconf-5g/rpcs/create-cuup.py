from netconf_client.connect import connect_ssh
from netconf_client.ncclient import Manager

HOST = "10.55.1.2"
PORT = 30876

session = connect_ssh(host=HOST, port=PORT, username="helm", password="helm")
mgr = Manager(session, timeout=120)

defPathCuUp = """<config>
<gnb-cu-up xmlns="http://accelleran.com/ns/yang/accelleran-gnb-cu-up" xmlns:xc="urn:ietf:params:xml:ns:netconf:base:1.0" xc:operation="create">
        <gnb-cu-up-name>accelleran-cu-up-1</gnb-cu-up-name>
        <gnb-cu-up-id>1</gnb-cu-up-id>


        <e1-link-policy xc:operation="create">
                <sctp-policy xc:operation="create">
                        <in-streams>1</in-streams>
                        <out-streams>1</out-streams>
                </sctp-policy>
        </e1-link-policy>
        
        <e1-link xc:operation="create">
                <dest-ip-address>10.55.1.31</dest-ip-address>
        </e1-link>
        <supported-plmn-slices xc:operation="create">
                <plmn-id>00101</plmn-id>
                <s-nssai xc:operation="create">
                	<sst>embb</sst>
                	<sd>1</sd>
                </s-nssai>
                <s-nssai xc:operation="create">
                	<sst>embb</sst>
                	<sd>2</sd>
                </s-nssai>
        </supported-plmn-slices>

        
</gnb-cu-up>

</config>"""

print(mgr.edit_config(config=defPathCuUp,target='running', default_operation=None))
