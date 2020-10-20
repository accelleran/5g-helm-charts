# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

