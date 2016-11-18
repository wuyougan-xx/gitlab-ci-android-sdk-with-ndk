FROM ubuntu:14.04
MAINTAINER yewenju <wuyougan@163.com>

ENV ANDROID_HOME /opt/android-sdk-linux
ENV GRADLE_USER_HOME /opt/gradle

# 更换 Ubuntu 镜像更新地址
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse\n\
deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse\n\
deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list

# 安装基础包
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl wget unzip openjdk-7-jdk libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 安装 SDK
RUN cd /opt && \
    curl -s https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz > android-sdk.tgz && \
    tar -xvzf android-sdk.tgz && \
    curl -s https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip > android-ndk.zip && \
    unzip android-ndk.zip && \
    rm -f android-sdk.tgz android-ndk.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/android-ndk-r13b

# 更新 SDK
RUN echo y | android update sdk --no-ui --all --filter \
	build-tools-25.0.0,\
	build-tools-24.0.3,\
	build-tools-24.0.2,\
	build-tools-24.0.1,\
	build-tools-24.0.0,\
	build-tools-23.0.3,\
	build-tools-23.0.2,\
	build-tools-23.0.1,\
	build-tools-22.0.1,\
	build-tools-21.1.2,\
	build-tools-20.0.0,\
	build-tools-19.1.0,\
	android-25,\
	android-24,\
	android-23,\
	android-22,\
	android-21,\
	android-20,\
	android-19,\
	android-17,\
	android-15,\
	addon-google_apis-google-25,\
	addon-google_apis-google-24,\
	addon-google_apis-google-23,\
	addon-google_apis-google-22,\
	addon-google_apis-google-21,\
	addon-google_apis-google-20,\
	addon-google_apis-google-19,\
	addon-google_apis-google-17,\
	addon-google_apis-google-15,\
	platform-tools,\
	extra-android-m2repository,\
	extra-android-support,\
	extra-google-google_play_services,\
	extra-google-m2repository

# 安装 gradle
RUN curl https://get.sdkman.io | bash && \
RUN echo n | sdk install gradle 1.5 && \
	echo n | sdk install gradle 1.6 && \
	echo n | sdk install gradle 1.7 && \
	echo n | sdk install gradle 1.8 && \
	echo n | sdk install gradle 1.9 && \
	echo n | sdk install gradle 1.10 && \
	echo n | sdk install gradle 1.11 && \
	echo n | sdk install gradle 1.12 && \
	echo n | sdk install gradle 2.0 && \
	echo n | sdk install gradle 2.1 && \
	echo n | sdk install gradle 2.2 && \
	echo n | sdk install gradle 2.2.1 && \
	echo n | sdk install gradle 2.3 && \
	echo n | sdk install gradle 2.4 && \
	echo n | sdk install gradle 2.5 && \
	echo n | sdk install gradle 2.6 && \
	echo n | sdk install gradle 2.7 && \
	echo n | sdk install gradle 2.8 && \
	echo n | sdk install gradle 2.9 && \
	echo n | sdk install gradle 2.10 && \
	echo n | sdk install gradle 2.11 && \
	echo n | sdk install gradle 2.12 && \
	echo n | sdk install gradle 2.13 && \
	echo n | sdk install gradle 2.14 && \
	echo n | sdk install gradle 2.14.1 && \
	echo n | sdk install gradle 3.0 && \
	echo n | sdk install gradle 3.1 && \
	echo n | sdk install gradle 3.2

