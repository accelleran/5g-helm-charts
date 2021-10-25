from netconf_client.connect import connect_ssh
from netconf_client.ncclient import Manager

HOST = "10.55.1.2"
PORT = 31832

session = connect_ssh(host=HOST, port=PORT, username="helm", password="helm")
mgr = Manager(session, timeout=120)

defPathCuCp = """<config>
<gnb-cu-cp xmlns="http://accelleran.com/ns/yang/accelleran-gnb-cu-cp" xmlns:xc="urn:ietf:params:xml:ns:netconf:base:1.0" xc:operation="create">
	<plmn-id>00101</plmn-id>
	<gnb-id>1</gnb-id>
	<gnb-id-length>27</gnb-id-length>
	<gnb-cu-cp-name>accelleran-gnb</gnb-cu-cp-name>
	<admin-state>unlocked</admin-state>
	

	<allowed-ciphering-algorithm xc:operation="create">128-nea1</allowed-ciphering-algorithm>
	<allowed-ciphering-algorithm xc:operation="create">nea0</allowed-ciphering-algorithm>	
	
	<allowed-integrity-algorithm xc:operation="create">128-nia1</allowed-integrity-algorithm>
	<allowed-integrity-algorithm xc:operation="create">nia0</allowed-integrity-algorithm>	
	
	<e1-link-policy xc:operation="create">
		<sctp-policy xc:operation="create">
			<in-streams>1</in-streams>
			<out-streams>1</out-streams>
		</sctp-policy>
	</e1-link-policy>
	
	<f1-c-link-policy xc:operation="create">
		<sctp-policy xc:operation="create">
			<in-streams>1</in-streams>
			<out-streams>1</out-streams>
		</sctp-policy>
	</f1-c-link-policy>
	
	<operator xc:operation="create">
		<operator-id>operator-1</operator-id>
		<ng-c-link-policy xc:operation="create">
			<sctp-policy xc:operation="create">
				<in-streams>1</in-streams>
				<out-streams>1</out-streams>
			</sctp-policy>
		</ng-c-link-policy>
		
		<ng-c-link xc:operation="create">			
			<dest-address>acc-5g-tester-acc-fiveg-tester-appl-ng-control</dest-address>
			<default-amf>true</default-amf>
		</ng-c-link>
		<ng-c-link xc:operation="create">
			<dest-address>10.55.1.42</dest-address>
			<default-amf>false</default-amf>
		</ng-c-link>
		
	</operator>
	
	
	
	
</gnb-cu-cp>

</config>"""

print(mgr.edit_config(config=defPathCuCp,target='running', default_operation=None))
