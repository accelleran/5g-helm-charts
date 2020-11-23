#!/bin/bash
mkdir lib
cp ../../../framework/netconf/entry/nc-testkey .
cd native/lib
tar cf - *so* | tar xvf - -C ../../lib
cp -r libyang ../../lib
