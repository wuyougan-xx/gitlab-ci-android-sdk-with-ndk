#!/bin/bash

if [ $# -lt 1 ]
then
	echo 请输入参数
	exit
fi

GRADLE_VERSIONS=$@

chmod +x gradlew

for v in $GRADLE_VERSIONS
do
	sed -i "s/gradle-[0-9\.]*-all/gradle-$v-all/" gradle/wrapper/gradle-wrapper.properties
	./gradlew clean || exit 10
done

