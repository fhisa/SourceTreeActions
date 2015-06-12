#!/bin/sh

chdir $@
url=`git config --get remote.origin.url`
url=`echo $url | sed 's/\.git$//'`
url=`echo $url | sed 's/\/\/..*@/\/\//'`
echo $url
open $url
