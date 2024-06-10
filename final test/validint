#!/bin/bash
# 입력값이 정수인지 판별한다. 음수도 허용한다.

validint()
{
  # $1을 판별하는 함수로,
  # $2가 최소값이고 $3이 최대값일 때 $1이 올바른 범위에 있는지 확인
  # $1이 숫자인지도 확인

  number="$1";      min="$2";      max="$3"

  if [ -z $number ] ; then
    echo "You didn't enter anything. Please enter a number." >&2 ; return 1
  fi

  # 첫 글자가 '-'인지 확인:
  if [ "${number%${number#?}}" = "-" ] ; then
    testvalue="${number#?}" # 확인하기 위해 1번째 제외한 글자 매칭
  else
    testvalue="$number"
  fi

  # 확인을 위해 숫자가 아닌 변수 생성:
  nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"

  # 숫자 아닌 글자 확인:
  if [ ! -z $nodigits ] ; then
    echo "Invalid number format! Only digits, no commas, spaces, etc" >&2
    return 1
  fi

  if [ ! -z $min ] ; then
    # 입력값이 최소값보다 작은지 확인:
    if [ "$number" -lt "$min" ] ; then
      echo "$number is too small: smallest acceptable value is $min" >&2
      return 1
    fi
  fi
  if [ ! -z $max ] ; then
    # 입력값이 최대값보다 큰지 확인:
    if [ "$number" -gt "$max" ] ; then
      echo "Your value is too big: largest acceptable value is $max" >&2
      return 1
    fi
  fi
  return 0
}