#!/usr/bin/env bash
#
# Add the LFS user
# http://www.linuxfromscratch.org/lfs/view/development/chapter04/addinguser.html
#

echo 'Should su - to root first!'

. common.sh
chk_lfs

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

su - lfs

