#!/bin/bash
# @Author: sundanwei
# @Date:   2018-11-10 17:44:45
# @Last Modified by:   sundanwei
# @Last Modified time: 2018-11-15 17:44:45

WORKDIR=$(cd $(dirname $0); pwd)
cd $WORKDIR

case $1 in
	start)
		nohup ./bin/shortlink 2>&1 >> ./logs/info.log 2>&1 /dev/null &
		#nohup ./bin/chat 2>&1 /dev/null &
		echo "服务已启动..."
		sleep 1
	;;
	stop)
		killall shortlink
		echo "服务已停止..."
		sleep 1
	;;
	restart)
		killall shortlink
		sleep 1
		nohup ./bin/shortlink 2>&1 >> ./logs/info.log 2>&1 /dev/null &
		#nohup ./bin/chat 2>&1 /dev/null &
		echo "服务已重启..."
		sleep 1
	;;
	*)
		echo "$0 {start|stop|restart}"
		exit 4
	;;
esac