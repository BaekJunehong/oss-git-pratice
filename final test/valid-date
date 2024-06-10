#!/bin/bash
# 윤년인지 판별하는 함수

isLeapYear()
{    
  year=$1
  if [ "$((year % 4))" -ne 0 ] ; then
    return 1 # 윤년 아님
  elif [ "$((year % 400))" -eq 0 ] ; then
    return 0 # 윤년
  elif [ "$((year % 100))" -eq 0 ] ; then
    return 1
  else
     return 0
  fi 
}