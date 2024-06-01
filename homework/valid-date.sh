#!/bin/bash

# 인수 개수 검사 
## 3개의 인수(월, 일, 년)를 받아야 함
if [ $# -ne 3 ]; then
  echo "입력값 오류"
  exit 1
fi

# 월 매핑
## 입력된 월을 대문자로 변환하고, 약어/숫자를 전체 이름으로 매핑
declare -A months
months=( ["1"]="Jan" ["01"]="Jan" ["jan"]="Jan" ["january"]="Jan"
         ["2"]="Feb" ["02"]="Feb" ["feb"]="Feb" ["february"]="Feb"
         ["3"]="Mar" ["03"]="Mar" ["mar"]="Mar" ["march"]="Mar"
         ["4"]="Apr" ["04"]="Apr" ["apr"]="Apr" ["april"]="Apr"
         ["5"]="May" ["05"]="May" ["may"]="May"
         ["6"]="Jun" ["06"]="Jun" ["jun"]="Jun" ["june"]="Jun"
         ["7"]="Jul" ["07"]="Jul" ["jul"]="Jul" ["july"]="Jul"
         ["8"]="Aug" ["08"]="Aug" ["aug"]="Aug" ["august"]="Aug"
         ["9"]="Sep" ["09"]="Sep" ["sep"]="Sep" ["september"]="Sep"
         ["10"]="Oct" ["oct"]="Oct" ["october"]="Oct"
         ["11"]="Nov" ["nov"]="Nov" ["november"]="Nov"
         ["12"]="Dec" ["dec"]="Dec" ["december"]="Dec")

# 입력된 월을 소문자로 변환 후 대응되는 대문자 월로 변환
month_input=$(echo $1 | tr '[:upper:]' '[:lower:]')
month=${months[$month_input]}

if [ -z "$month" ]; then
  echo "월이 유효하지 않습니다: $1는 유효하지 않습니다"
  exit 1
fi

day=$2
year=$3

# 윤년 판별 함수
is_leap_year() {
  if (( $1 % 400 == 0 )); then
    return 0
  elif (( $1 % 100 == 0 )); then
    return 1
  elif (( $1 % 4 == 0 )); then
    return 0
  else
    return 1
  fi
}

# 각 월의 일수 설정
declare -A days_in_month
days_in_month=(["Jan"]=31 ["Feb"]=28 ["Mar"]=31 ["Apr"]=30 ["May"]=31 ["Jun"]=30 ["Jul"]=31 ["Aug"]=31 ["Sep"]=30 ["Oct"]=31 ["Nov"]=30 ["Dec"]=31)

# 윤년일 경우 2월 일수 변경
if is_leap_year $year; then
  days_in_month["Feb"]=29
fi

# 일 유효성 검사
if (( day < 1 || day > days_in_month[$month] )); then
  echo "일이 유효하지 않습니다: $day는 ${months[$1]}에 유효하지 않습니다"
  exit 1
fi

# 유효한 날짜 출력
echo "$month $day $year"
