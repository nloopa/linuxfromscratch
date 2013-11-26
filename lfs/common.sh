#!/usr/bin/env bash

function chk_lfs() {
	if [ "x$LFS" = "x" ]; then
		echo "\$LFS is not set."
		echo "Abort!"
		echo
		exit
	fi
}

