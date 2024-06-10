#!/bin/bash
# inpath--주어진 프로그램이 유효한지,
# PATH 디렉토리 목록 안에 존재하는지 검사하는 함수 


in_path()
{
   # cmd와 ourpath가 주어졌을 때, cmd를 찾는다. 만약
   # 존재하고 실행가능 모드이면 0을 반환, 아니면 1 반환함.
   # IFS (internal field separator)에 임시 할당하고,
   # 프로그램이 종료되면 재할당하는 방식임.

   cmd=$1        ourpath=$2         result=1
   oldIFS=$IFS   IFS=":" # $IFS는 디폴트값이 공백임

   for directory in $ourpath
   do
     if [ -x $directory/$cmd ] ; then
       result=0      # $directory에 $cmd가 존재할 경우
     fi
   done

   IFS=$oldIFS
   return $result
 }

 checkForCmdInPath()
 {
   var=$1

   if [ "$var" != "" ] ; then
     if [ "${var:0:1}" = "/" ] ; then
       if [ ! -x $var ] ; then
         return 1
       fi
     elif !  in_path $var "$PATH" ; then
       return 2
     fi 
   fi
}