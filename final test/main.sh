#!/bin/bash
# 만든 프로그램 3개를 테스트하는 스크립트 파일
# 'library.sh' 파일을 읽어들이는 것부터 시작한다.

. library.sh

# 1. validint 작동 확인
echo "First off, do you have echo in your path? (1=yes, 2=no) "
read answer
while ! validint $answer 1 2 ; do
  echo "Try again. Do you have echon "
  echo "in your path? (1=yes, 2=no) "
  read answer
done

# 2. checkForCmdInPath 작동 확인
if ! checkForCmdInPath "echon" ; then
  echo "Nope, can't find the echo command."
else
  echo "The echon command is in the PATH."
fi

echo ""
echo "Enter a year you think might be a leap year: "
read year

# 숫자 유효성 및 범위 (1-9999) 확인
while ! validint $year 1 9999 ; do
  echo "Please enter a year in the correct format: "
  read year
done

# 3. isLeapYear 작동 확인
if isLeapYear $year ; then
  echo "You're right!  $year was a leap year."
else
  echo "Nope, that's not a leap year."
fi

exit 0