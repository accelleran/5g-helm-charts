# Official Accelleran 5G Helm Chart Repo

## Helm Chart repository
|NAME   |CHART VERSION   |APP VERSION   |DESCRIPTION   |
|---|---|---|---|
| acc-5g-helm/acc-5g-cu-cp       |         2.0.0   |        release-2.2-chimay-16fb940        |          Accelleran 5G CU CP Components                     |
| acc-5g-helm/acc-5g-cu-up        |        2.0.0      |     release-2.2-chimay-16fb940         |         Accelleran 5G CU UP Components                     |
| acc-5g-helm/acc-5g-infrastructure    |   0.2.0      |       0.2.0                      |        The infrastructure for the Accelleran 5G CU Components |
| acc-5g-helm/nkafka-5g           |        0.3.0     |      0.6.6_proto.16fb94008 |  The NKafka-5G                        |

## Unreleased
### Fixed
- acc-5g-cu-cp [2.0.1-rc.0]
  - Fixed Jaeger DNS issue
- acc-5g-cu-up [2.0.1-rc.0]
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
