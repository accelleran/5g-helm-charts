# Official Accelleran 5G Helm Chart Repo

## Helm Chart repository
|NAME   |CHART VERSION   |APP VERSION   |DESCRIPTION   |
|---|---|---|---|
| acc-5g-helm/acc-5g-cu-cp       |         3.0.0   |        release-2.3-duvel-f608a008        |          Accelleran 5G CU CP Components                     |
| acc-5g-helm/acc-5g-cu-up        |        3.0.0      |     release-2.3-duvel-f608a008         |         Accelleran 5G CU UP Components                     |
| acc-5g-helm/acc-5g-infrastructure    |   3.0.0      |       3.0.0                      |        The infrastructure for the Accelleran 5G CU Components |
| acc-5g-helm/nkafka-5g           |        3.0.0     |      0.6.10_proto.f608a0084 |  The NKafka-5G                        |

## Unreleased [3.0.0-rc5]
### Added
  - Intra gNB Intra-Frequency Handover: Completion of inter DU handover - implementation of full user plane handling: nrUpp switch to target ul/dl tnl info
  - DNS support: Support in CU-CP and CU-UP, allowing addresses to be configured as Fully Qualified Domain Names: REDIS, NATS, NG link addresses and E1 link address towards CU-CP.
  - E2KPI Service Model: "Support E2SmKpm v1.0 basic scenario's: subscriptions and indications"
### Updated
  - Updated 5G CU to release-2.3-duvel-2fc276e4
  - Updated 5G Infrastructure to match version 
  - Updated NKafka-5G to 0.6.10_proto.2fc276e4d to match 5G CU version
### Fixed
  - CU-CP controller:   UE connection not cleared in AMF at NgErrorIndication cause=semantic_error
  - CU-CP controller:   Unnecessary error trace at valid race condition - activation attempt of cell and sctp association failure towards the cells DU
  - CU-CP controller:	RRC Setup Request lost in CU-UP when all dsCtrls busy, no RRC Reject sent to UE 
  - CU-CP controller:	FQDN resolution failure of all AMF addresses should result in retry 
  - CU-CP controller:	regular expression issue in fqdn pattern 
  - CU-CP controller:	ErrorIndication in response to NgUeCtxtReleaseRequest should trigger UE RESET procedure 
  - CU-CP controller:	AvailablePlmnID list not included in F1 GnbCuConfigUpdate when one or more servedPlmns are not supported 
### Limitations
  - Errors detected during execution of UE control procedure will trigger UE release - no support for rollback to previous configuration

## 18.10.2021. [2.0.1]
### Fixed
- acc-5g-cu-cp [2.0.1]
  - Fixed Jaeger DNS issue
- acc-5g-cu-up [2.0.1]
  - Fixed Jaeger DNS issue

## 20.09.2021.
### Removed
- acc-5g-cu-cp [2.0.0]
  - Removing DS CTRL parameter rel_msecs
### Added
- acc-5g-cu-cp [2.0.0]
  - Adding NATS_SERVICE_URL as env variable to netconf pod
  - Adding Handover Tester application, with default install set to false
  - Exposing Handover Tester port 1337 on nodePort 31337
  - Adding Jaeger agent host configuration as env var
- acc-5g-cu-up [2.0.0]
  - Adding NATS_SERVICE_URL as env variable to netconf pod
  - Adding Jaeger agent host configuration as env var
- acc-5g-infrastructure [0.3.0]
  - Adding Jaeger 
### Changed
- acc-5g-cu-cp [2.0.0]
  - Updating to use "release-2.2-chimay-fb09544" as 5G software
- acc-5g-cu-up [2.0.0]
  - Updating to use "release-2.2-chimay-fb09544" as 5G software
- nkafka-5g [0.3.0]
  - Updated to use version "0.6.6_proto.16fb94008"
  - Updated helm chart for latest version
- acc-netconf-5g [0.6.1]
  - Update to use "release-2.2-chimay-966d907" as 5G software

## 2021-07-23
### Changed
- acc-5g-infrastructure [0.2.0]
  - Updating Redis to use official Redis Docker image, version 6.2.4
  - Updating Nats to use official Redis Docker image, version 2.3.2
  - Setting default NodePorts: NATS to 31100; Redis to 32200  

## 2021-07-08
### Changed
- acc-5g-cu-cp [1.0.0]:
  - Names of Helm charts changed! Please update the values files used!
  - If you wish to use the previous version of the values files, the change is that each subchart has changed its name. The names of the subcharts (which are root keys in the values files) used to have a prefix “acc-fiveg-”, which is now removed. You can find-and-replace the “acc-fiveg-” string to delete it. For example, the “acc-fiveg-sctp” key should now be “sctp”.
  - Instance ID can now be 16 characters long!
  - Setting default NATS port to 31100  
- acc-5g-cu-up [1.0.0]: 
  - Names of Helm charts changed! Please update the values files used!
  - If you wish to use the previous version of the values files, the change is that each subchart has changed its name. The names of the subcharts (which are root keys in the values files) used to have a prefix “acc-fiveg-”, which is now removed. You can find-and-replace the “acc-fiveg-” string to delete it. For example, the “acc-fiveg-cu-up” key should now be “cu-up”.
  - Instance ID can now be 16 characters long!
  - Setting default NATS port to 31100  

## 2021-07-01
### Changed
- acc-5g-infrastructure [0.1.1]:
  - Enabled MetalLB installation by default.

## 2021-06-28
### Added
- acc-5g-cu-cp [0.8.0]: 
  - Added Instance ID length check (max 7 characters long).
- acc-5g-cu-up [0.8.0]: 
  - Added Instance ID length check (max 7 characters long).
