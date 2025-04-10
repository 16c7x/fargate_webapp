#!/bin/bash

ext_ip=`curl -s https://freedns.afraid.org/dynamic/check.php | grep REMOTE_ADDR |  awk '{print $3}'`
echo "{ \"my_ip\" : \""$ext_ip"/32\" }"
