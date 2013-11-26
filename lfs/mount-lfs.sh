#!/usr/bin/env bash
#
# Steps reference:
# http://www.linuxfromscratch.org/lfs/view/development/chapter02/mounting.html
#

. common.sh
chk_lfs

FS_TYPE=reiserfs
DISK=/dev/sda5

function _alert() {
	echo
	echo -e "Alert!!!"
	echo -e "\tThere is no partition creation or format here."
	echo -e "\tThe job should be done manually to avoid potential data"
	echo -e "\tloss/corruption without caution."
	echo -e "\tShould manually change the settings to your environment"
	echo -e "\tbefore run this script."
	echo
}

function _lfs_refs() {
	echo -e "LFS references:"
	echo -e "* http://www.linuxfromscratch.org/lfs/view/development/chapter02/creatingfilesystem.html"
	echo -e "* http://www.linuxfromscratch.org/lfs/view/development/chapter02/mounting.html"
}

function _sys_settings() {
	echo -e "Default settings:"
	echo -e "\tFilesystem		: $FS_TYPE"
	echo -e "\tPartition 		: $DISK"
	echo -e "\tMount Point (LFS)	: $LFS"
	echo
}

function _mount_lfs() {
	mkdir -pv $LFS
	mount -v -t $FS_TYPE $DISK $LFS
}

_lfs_refs
_alert
_sys_settings
_mount_lfs

