FROM ubuntu:14.04

MAINTAINER Vimalraj "vimal.selvam@live.com"

RUN apt-get update -qq

# Dependencies to execute android
RUN apt-get install -y openjdk-7-jre-headless lib32z1 lib32ncurses5 lib32bz2-1.0 g++-multilib curl build-essential

# Main Android SDK
RUN apt-get install -y --no-install-recommends wget
RUN cd /opt && wget -q https://dl.google.com/android/android-sdk_r24.3.4-linux.tgz
RUN cd /opt && tar xzf android-sdk_r24.3.4-linux.tgz
RUN cd /opt && rm -f android-sdk_r24.3.4-linux.tgz

# Other tools and resources for ANDROID SDK
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN echo y | android update sdk --filter platform-tools,build-tools-23.0.1 --no-ui --force

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs python make g++
# RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install appium@1.4.16 -g