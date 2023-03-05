#!/usr/bin/env bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <plugin-directory>"
	exit 1
fi

artifact=$(jprm --verbosity=debug plugin build "$1") && {
	jprm --verbosity=debug repo add \
		--url="https://raw.githubusercontent.com/jwueller/jellyfin-repository/master" \
		. \
		"$artifact"
}
