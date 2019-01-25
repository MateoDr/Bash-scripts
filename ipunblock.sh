#!/usr/bin/env bash

echo Server\ IP:
read IP

echo Server\ port:
read PORT

echo Root\ password:
read ROOTPW

echo What\'s\ the\ retard\'s\ IP?
read RETARDIP

UNBLOCK="csf -dr $RETARDIP"

BLOCK=$"(/usr/bin/sshpass -p $ROOTPW ssh root@$IP -p$PORT 'grep '$RETARDIP' /etc/csf/csf.deny)"

if [ -z "$BLOCK" ]
then
	echo "This ain't it, chief"
else
	sshpass -p $ROOTPW ssh root@$IP -p$PORT "$UNBLOCK"
fi
