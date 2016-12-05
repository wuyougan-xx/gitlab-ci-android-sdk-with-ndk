#!/bin/bash

if [ $# -lt 1 ]
then
	echo 请输入参数
	exit
fi

PLUGIN_VERSIONS=$@

chmod +x gradlew

for v in $PLUGIN_VERSIONS
do
	sed -i "s/gradle:[0-9\.]*'/gradle:$v'/" build.gradle
	./gradlew clean || exit 11
done

