#!/bin/sh

sedcmd='s/^git@github\.com\:\(.*\)\.git$/https\:\/\/github.com\/\1/'

cd $@
url=`git config --get remote.origin.url | sed -e $sedcmd`
url=`echo $url | sed 's/\.git$//'`
url=`echo $url | sed 's/\/\/..*@/\/\//'`
echo $url
open $url
