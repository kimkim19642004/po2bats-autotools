#!/usr/bin/env bash
# -*- coding : utf-8 -*-

## Root user?
_i=0; _i=${EUID:-${UID}}
if ! _s=$( ((_i>0)) 2>&1 ) ; then
	# Yes
	exit 0
fi
## Unknown error?
if ((${#_s}>0)) ; then
	# Yes
	exit 0
fi
# No
exit 1

