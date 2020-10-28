#!/usr/bin/python3
import sys
import argparse
import os
import yaml

PACKAGES_FILE_NAME = '/tmp/mini-packages.yml'

parser = argparse.ArgumentParser()
parser.add_argument("target", help="ap or ttcn")
args = parser.parse_args()

if args.target == 'ttcn':
	target = 'ttcn'
else:
	target = 'ap'

install_string = 'apt-get install -qq '

with open(PACKAGES_FILE_NAME, 'r') as stream:
	data = yaml.load(stream, Loader=yaml.SafeLoader)
	for architecture in data['packages'][target]:
		for package_name in data['packages'][target][architecture]:
			for package_versions in data['packages'][target][architecture][package_name]:
				for package_version in package_versions.keys():
					#target_release = package_versions[package_version]
					if architecture != 'amd64':
						install_string += '{}:{}={} '.format(package_name, architecture, package_version)
					else:
						install_string += '{}={} '.format(package_name, package_version)

os.system('dpkg --add-architecture i386')
os.system('apt-get update')
sys.exit(os.WEXITSTATUS(os.system(install_string)))
