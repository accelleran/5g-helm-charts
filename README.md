# Official Accelleran 5G Helm Chart Repo

## Helm Chart repository
|NAME   |CHART VERSION   |APP VERSION   |DESCRIPTION   |
|---|---|---|---|
| acc-5g-helm/acc-5g-cu-cp       |         2.0.1   |        release-2.2-chimay-f87340a        |          Accelleran 5G CU CP Components                     |
| acc-5g-helm/acc-5g-cu-up        |        2.0.1      |     release-2.2-chimay-f87340a         |         Accelleran 5G CU UP Components                     |
| acc-5g-helm/acc-5g-infrastructure    |   2.0.1      |       2.0.0                      |        The infrastructure for the Accelleran 5G CU Components |
| acc-5g-helm/nkafka-5g           |        2.0.1     |      0.6.10_proto.f87340abc |  The NKafka-5G                        |

## 18.10.2021.
### Updated
- nkafka-5g [2.0.1]
  - Updated NKafka-5G to 0.6.10_proto.f87340abc to match 5G CU release-2.2-chimay-f87340a
- acc-5g-infrastructure [2.0.1]
  - Updated to 2.0.1 to sync with 5G CU
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