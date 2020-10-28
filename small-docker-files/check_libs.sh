#!/bin/bash

: '
Output for all should be:
	linux-vdso.so.1 (0x00007ffc1038b000)
	libsctp.so.1 => /usr/lib/x86_64-linux-gnu/libsctp.so.1 (0x00007fde20c2e000)
	libssl.so.1.0.0 => lib/libssl.so.1.0.0 (0x00007fde209bc000)
	libcrypto.so.1.0.0 => lib/libcrypto.so.1.0.0 (0x00007fde2055c000)
	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fde2033d000)
	librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007fde20135000)
	libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007fde1fdac000)
	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007fde1fb94000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fde1f7a3000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fde1f59f000)
	/lib64/ld-linux-x86-64.so.2 (0x00007fde20e31000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fde1f201000)
'

LD_LIBRARY_PATH=lib/ ldd native/amfControllerAppl.exe
LD_LIBRARY_PATH=lib/ ldd native/amfControllerAppl.exe  
LD_LIBRARY_PATH=lib/ ldd native/cuUpControllerAppl.exe  
LD_LIBRARY_PATH=lib/ ldd native/duTesterAppl.exe  
LD_LIBRARY_PATH=lib/ ldd native/f1apIntfAppl.exe       
LD_LIBRARY_PATH=lib/ ldd native/ngapAppl.exe          
LD_LIBRARY_PATH=lib/ ldd native/resMgrUpAppl.exe
LD_LIBRARY_PATH=lib/ ldd native/amfTesterAppl.exe      
LD_LIBRARY_PATH=lib/ ldd native/dsCtrlAppl.exe          
LD_LIBRARY_PATH=lib/ ldd native/e1CpAppl.exe      
LD_LIBRARY_PATH=lib/ ldd native/gnbControllerAppl.exe  
LD_LIBRARY_PATH=lib/ ldd native/pmControllerAppl.exe  
LD_LIBRARY_PATH=lib/ ldd native/rrCtrlAppl.exe
LD_LIBRARY_PATH=lib/ ldd native/cuUpAppl.exe           
LD_LIBRARY_PATH=lib/ ldd native/duControllerAppl.exe    
LD_LIBRARY_PATH=lib/ ldd native/e1sctpUpAppl.exe  
LD_LIBRARY_PATH=lib/ ldd native/monAppl.exe            
LD_LIBRARY_PATH=lib/ ldd native/resMgrAppl.exe        
LD_LIBRARY_PATH=lib/ ldd native/sctpCpAppl.exe

