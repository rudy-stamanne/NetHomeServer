#!/bin/sh
PID_ROOT=/var/run/nethome
PID_FILE=$PID_ROOT/nethome.pid
CONFIGURATION_ROOT=/etc/opt/nethome
SCRIPTFILE=$0
cd lib
rm librxtxSerial.so
cp ../os/librxtxSerial_raspian.so librxtxSerial.so
PID=`ps -ef | grep ${SCRIPTFILE} | head -n1 |  awk ' {print $2;} '`
echo ${PID} > ${PIDFILE}
chmod a+w ${PIDFILE}
java -Djava.library.path=. -jar home.jar $CONFIGURATION_ROOT/config.xml "$@"
