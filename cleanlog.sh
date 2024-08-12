#!/bin/bash
# @Author: sundanwei
# @Date:   2018-11-10 17:44:45
# @Last Modified by:   sundanwei
# @Last Modified time: 2018-11-15 17:44:45

WORKDIR=$(cd $(dirname $0); pwd)
cd $WORKDIR
CURRDATE=$(date +"%Y-%m")
echo ${CURRDATE}*.log
/usr/bin/rm ./logs/${CURRDATE}*.log
/usr/bin/echo  >./logs/info.log

