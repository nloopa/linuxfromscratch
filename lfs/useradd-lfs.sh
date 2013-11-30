#!/usr/bin/env bash
#
# Add the LFS user
# http://www.linuxfromscratch.org/lfs/view/development/chapter04/addinguser.html
#

if [ "$USER" != 'root' ] ; then
	echo "Current user: $USER"
	echo 'Non root privilege. Should change to root first!'
	exit
fi

. common.sh
chk_lfs

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

su - lfs

