#!/bin/bash
################################################################################
#  Author: Salvatore Ventura
# Purpose: Create the bundle installer from the github zip file
#    Date: 14 Oct 2015
################################################################################
if [ "`whoami`" != "root"  ]; then
   echo "You must run this script as root"
   echo "Example: sudo install.sh"
   exit 1
fi

#
# Constants
#
IGNITE_ZIP_FILE_URL=https://github.com/salvoventura/ignite/archive/master.zip
SCRIPT_TEMPLATE=templates/ignite.sh.tpl
INSTALLER=ignite-bundle.sh
CURDIR=`pwd`
TMPDIR=`mktemp -d`

# Initial check/update
apt-get update
apt-get -y install unzip

# Get the file, unzip, correct the folder name and tar/bzip2 it
cd ${TMPDIR}
wget ${IGNITE_ZIP_FILE_URL} -O master.zip
unzip master.zip
mv ignite-master/ ignite/
rm -f ignite/package/ignite-bundle.sh  # delete the old bundle file
tar cf ignite.tar ignite/
bzip2 -9 ignite.tar

# Create the bundle installer
cat ${CURDIR}/${SCRIPT_TEMPLATE} > ${INSTALLER}
echo "PAYLOAD:"                 >> ${INSTALLER}
cat ignite.tar.bz2              >> ${INSTALLER}
cp ${INSTALLER} ${CURDIR}/.
rm -rf ${TMPDIR}
