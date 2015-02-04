#!/bin/bash
#sudo truncate -s0 `ls -r /var/log/tomcat7/localhost*`
#sudo service tomcat7 restart
cd /var/lib/tomcat7/logs
cat /dev/null >  `ls -rt|tail -1`
