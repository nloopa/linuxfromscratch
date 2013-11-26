#!/usr/bin/env bash

. common.sh
chk_lfs

function _prompt() {
	echo
	echo -e "Ref:"
	echo -e "\thttp://www.linuxfromscratch.org/lfs/view/development/chapter04/creatingtoolsdir.html" 
	echo
}

function _mk_tools_dir() {
	mkdir -v $LFS/tools
	ln -sv $LFS/tools /
}

_prompt
_mk_tools_dir

