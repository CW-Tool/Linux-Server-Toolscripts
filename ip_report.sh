#!/bin/bash
# check and send ip address to email
MYIP=$(curl ifconfig.me);
TIME='date';
LASTIPFILE='/SCRIPTLOCATION/LAST_IP';
LASTIP='cat ${LASTIPFILE}';
if [[ ${MYIP} != ${LASTIP} ]]
then
        echo "New IP = ${MYIP}"
        echo "sending email.."
        echo -e "Hello\n\nAt Timestamp = ${TIME} the IP was changed to\nIP = ${MYIP}\n\nThanks, Admin" | \
                /usr/bin/mail -s "[IP Change notification]" ADMIN-EMAIL;
        echo ${MYIP} > ${LASTIPFILE};
else
        echo "no IP change!"
fi