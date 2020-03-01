#!/bin/bash

# Start Sundtek
/opt/bin/mediaclient --start

# Wait for sundtek driver
while [ ! -d /dev/dvb ]; do
    echo Waiting for DVB device...
    sleep 1
done

# Start minisatip
cd /minisatip
./minisatip -f -x 8080 $RUN_OPTS
