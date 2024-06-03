#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

check_user="$1"

while true; do
    if who | grep -q "^$check_user "; then
        echo "$check_user 로그인함!"
        exit 0
    fi
    sleep 60     # 60초 동안 대기
done
