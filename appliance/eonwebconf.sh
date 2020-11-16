#!/bin/sh

# Define values
<<<<<<< HEAD
eonconfpath=$(readlink -f "$0")
eonconfdir=$(dirname "$eonconfpath")
=======
eonconfdir="/srv/eyesofnetworkconf/eonweb"
>>>>>>> bd6a96b1588b3e530bdbf0470a9e78a80851bef1
eondir="/srv/eyesofnetwork"
datadir="$eondir/eonweb"
eonwebdb="eonweb"
nagiosbpdb="nagiosbp"
<<<<<<< HEAD
notifierdb="notifier"

# change right acces for this files
chmod 775 ${datadir}/cache
chmod 664 /srv/eyesofnetwork/notifier/etc/notifier.cfg
chmod 664 /srv/eyesofnetwork/notifier/etc/notifier.rules
chown root:eyesofnetwork /srv/eyesofnetwork/notifier/etc/notifier.cfg
chown root:eyesofnetwork /srv/eyesofnetwork/notifier/etc/notifier.rules

# change own user for eonweb directory
chown -R root:eyesofnetwork ${datadir}*
=======
snmpdir="/etc/snmp"
backupdir="/etc"

# change right acces for this files
chmod 777 ${datadir}/cache
chmod 666 ${snmpdir}/snmpd.conf
chmod 666 ${snmpdir}/snmptrapd.conf
chmod 666 ${backupdir}/backup-manager.conf

# change own user for eonweb directory
chown -R apache:eyesofnetwork ${datadir}*
>>>>>>> bd6a96b1588b3e530bdbf0470a9e78a80851bef1

# create the eonweb database
mysqladmin -u root --password=root66 create ${eonwebdb}
mysqladmin -u root --password=root66 create ${nagiosbpdb}
<<<<<<< HEAD
mysqladmin -u root --password=root66 create ${notifierdb}

# create the database content
mysql -u root --password=root66 ${eonwebdb} < ${eonconfdir}/eonweb.sql
=======

# create the database content
mysql -u root --password=root66 ${eonwebdb} < ${eonconfdir}/eonweb.sql
mysql -u root --password=root66 ${nagiosbpdb} < ${eonconfdir}/nagiosbp.sql
>>>>>>> bd6a96b1588b3e530bdbf0470a9e78a80851bef1

# Change DocumentRoot for apache
sed -i 's/^DocumentRoot.*/DocumentRoot\ \"\/srv\/eyesofnetwork\/eonweb\"/g' /etc/httpd/conf/httpd.conf

<<<<<<< HEAD
# Change own user for itsm directory
chown apache:apache /srv/eyesofnetwork/eonweb/module/admin_itsm/uploaded_file

=======
>>>>>>> bd6a96b1588b3e530bdbf0470a9e78a80851bef1
# crons for eon
cp -rf ${eonconfdir}/eonbackup /etc/cron.d/
cp -rf ${eonconfdir}/eondowntime /etc/cron.d/
cp -rf ${eonconfdir}/eonwebpurge /etc/cron.d/

# start the services
/etc/init.d/httpd restart   > /dev/null 2>&1

