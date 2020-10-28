#!/bin/bash
mkdir lib
cd native/lib
tar cf - *so* | tar xvf - -C ../../lib
