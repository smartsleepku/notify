#!/bin/bash
/opt/app/bin/solo -port=8071 java -jar /opt/app/build/libs/notify-1.0-SNAPSHOT-all.jar &>> /var/log/notify.log
