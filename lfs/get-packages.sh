#!/usr/bin/env bash

. common.sh
chk_lfs

CONFIG=meta

function _alert() {
	echo
	echo -e "Alert!!!"
	echo -e "\tThe wget-list and md5sums may not be uptodate."
	echo -e "\tPlease download the latest lists manually."
	echo
	echo -e "\twget-list:"
	echo -e "\t    http://www.linuxfromscratch.org/lfs/view/development/wget-list"
	echo -e "\tmd5sums:"
	echo -e "\t    http://www.linuxfromscratch.org/lfs/view/development/md5sums"
	echo -e "\tComplete lists:"
	echo -e "\t    http://www.linuxfromscratch.org/lfs/view/development/chapter03/packages.html"
	echo -e "\t    http://www.linuxfromscratch.org/lfs/view/development/chapter03/patches.html"
	echo
}

function _mk_src_dir() {
	mkdir -v $LFS/sources
	chmod -v a+wt $LFS/sources
	wget -i $CONFIG/wget-list -P $LFS/sources
}

function _chk_md5sums() {
	cp $CONFIG/md5sums $LFS/sources
	pushd $LFS/sources
	md5sum -c md5sums
	popd
}

_alert
_mk_src_dir
_chk_md5sums

