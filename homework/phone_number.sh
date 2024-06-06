#!/bin/bash

PHONEBOOK="phonebook.txt"

# 지역번호와 지역명 매핑
declare -A regions
regions["02"]="서울"
regions["031"]="경기"
regions["032"]="인천"
regions["051"]="부산"
regions["053"]="대구"

function add_or_update_entry {
    local name=$1
    local phone=$2
    local region_code=${phone%%-*}
    local region=${regions[$region_code]}

    if [[ -z $region ]]; then
        region="기타"
    fi

    if [ ! -f $PHONEBOOK ]; then
        touch $PHONEBOOK
    fi

    local found=0
    local temp_file=$(mktemp)
    while IFS= read -r line; do
        if [[ "$line" =~ ^$name\  ]]; then
            found=1
            local existing_phone=${line#* }
            existing_phone=${existing_phone%% *}
            if [[ "$existing_phone" == "$phone" ]]; then
                echo "$name 의 전화번호는 이미 존재합니다: $phone"
                rm $temp_file
                exit 0
            else
                echo "$name $phone $region" >> $temp_file
                continue
            fi
        fi
        echo "$line" >> $temp_file
    done < $PHONEBOOK

    if [[ $found -eq 0 ]]; then
        echo "$name $phone $region" >> $temp_file
    fi

    mv $temp_file $PHONEBOOK
    sort $PHONEBOOK -o $PHONEBOOK
    echo "$name 의 새로운 전화번호가 추가/업데이트 되었습니다: $phone ($region)"
}

function validate_phone {
    if ! [[ $1 =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
        echo "전화번호는 숫자와 '-'로 구성되어야 합니다."
        exit 1
    fi
}

function main {
    if [ $# -ne 2 ]; then
        echo "사용법: $0 이름 전화번호"
        exit 1
    fi

    local name=$1
    local phone=$2

    validate_phone $phone
    add_or_update_entry $name $phone
}

main "$@"
