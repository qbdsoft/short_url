#!/bin/bash
# @Author: sundanwei
# @Date:   2018-11-10 17:44:45
# @Last Modified by:   sundanwei
# @Last Modified time: 2018-11-15 17:44:45
echo "starting...."
ssh -i /Volumes/data/cfroot/server-key/CF-V.pem centos@18.139.101.207 "/bin/sh /data/short_url/dist/run.sh stop"
scp -i /Volumes/data/cfroot/server-key/CF-V.pem ./dist/bin/shortlink centos@18.139.101.207:/data/short_url/dist/bin/
scp -i /Volumes/data/cfroot/server-key/CF-V.pem ./dist/run.sh centos@18.139.101.207:/data/short_url/dist/
scp -i /Volumes/data/cfroot/server-key/CF-V.pem ./dist/config.json centos@18.139.101.207:/data/short_url/dist/config.json
ssh -i /Volumes/data/cfroot/server-key/CF-V.pem centos@18.139.101.207 "/bin/sh /data/short_url/dist/run.sh start"
