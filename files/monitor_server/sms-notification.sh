#!/bin/bash
message=`cat <<EOF
TEMPLATE
Notification Type: $NOTIFICATIONTYPE
User: $USEREMAIL
Service: $SERVICEDESC
Host: $HOSTALIAS
Address: $HOSTADDRESS
State: $SERVICESTATE
Date/Time: $LONGDATETIME
Additional Info: $SERVICEOUTPUT
Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT
TEMPLATE
`

echo "FUU \$SMSNUMBER \$message" > /tmp/gurka
