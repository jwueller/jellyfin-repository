#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <plugin-directory>"
    exit 1
fi

if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate

if ! command -v jprm &> /dev/null; then
    pip install jprm
fi

artifact=$(jprm --verbosity=debug plugin build "$1") && {
    jprm --verbosity=debug repo add \
        --url="https://raw.githubusercontent.com/jwueller/jellyfin-repository/master" \
        . \
        "$artifact"
}
