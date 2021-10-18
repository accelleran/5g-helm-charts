# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

## 0.2.0

### Added

- Added generic-five-g-template which is used for every other chart
- Added testerappl           
- Added pmcontrollerappl     
- Added cuupappl        
- Added e1sctpupappl         
- Added resmgrupappl         
- Added resmgrappl      
- Added dsctrlappl       
- Added rrctrlappl         
- Added gnbcontrollerappl  
- Added amfcontrollerappl  
- Added cuupcontrollerappl 
- Added ducontrollerappl   
- Added ngapappl    
- Added sctpcpappl  
- Added f1apintfappl  
- Added e1cpappl 

## 0.1.1

### Changed

- Fix error when no extraEnv present

## 0.1.0

### Added

- Added amfControllerAppl/
- - Made 0.1.0 version of amfControllerAppl helm chart
- Added	docker-files/
- - All files to se used inside the .../GNB/GNB/product/do/APPL-TCC/production folder
- - Adding Dockerfiles for creating Docker images for all 5G Appls
- - Adding Dockerfile.in for creating all-in-one Docker image with all Appls
- - Adding deploy.yaml for deploying the all-in-one Docker Image
- - Adding big\_make script that creates the all-in-one docker image
- - Adding make\_docker\_images.sh that creates each individual 5G Appl Docker image

