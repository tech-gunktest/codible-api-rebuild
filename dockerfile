FROM node:carbon
WORKDIR /usr/src/app
COPY package*.json ./
COPY index.js ./
COPY file.html ./
RUN apt-get update  \
	&& curl -sL https://deb.nodesource.com/setup_14.x  \
	&& apt-get install -y  \
# Base Packages
	nodejs tzdata software-properties-common apt-transport-https wget git curl vim nano zip sudo net-tools xvfb php supervisor gnupg \
# C, C++
	build-essential \
# C-Sharp
	mono-complete \
# Clojure
	clojure \
# Java
	default-jre \
	default-jdk \
# Lua
	lua5.3 \
# Perl
	perl \
	perl6 \
# Python
	python3 \
	python3-pip \
# R
	r-base \
# Ruby
	ruby  \
# Scala
	&& wget https://www.scala-lang.org/files/archive/scala-2.13.6.deb -P /tmp  \
	&& apt install -y /tmp/scala-2.13.6.deb  \
# Go
	&& bash -c 'echo "Installing Go..."'  \
	&& wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz -P /tmp  \
	&& tar -zxvf /tmp/go1.16.4.linux-amd64.tar.gz -C /tmp > /dev/null 2>&1  \
	&& cp -r /tmp/go/ /usr/local  \
	&& bash -c 'echo "Go Installed!"'  \
# rust
	&& curl https://sh.rustup.rs -sSf | sh -s -- -y  \
# PowerShell
	&& wget -q https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -P /tmp  \
	&& apt install -y  /tmp/packages-microsoft-prod.deb  \
	&& apt-get update  \
	&& apt-get install -y powershell  \
# Swift
	&& bash -c 'echo "Installing Swift..."'  \
	&& wget https://swift.org/builds/swift-5.4.1-release/ubuntu2004/swift-5.4.1-RELEASE/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz -P /tmp  \
	&& tar -zxvf /tmp/swift-5.4.1-RELEASE-ubuntu20.04.tar.gz -C /tmp > /dev/null 2>&1  \
	&& cp -r /tmp/swift-5.4.1-RELEASE-ubuntu20.04/usr/* /usr  \
	&& bash -c 'echo "Swift Installed!"'
RUN npm install --only=production
EXPOSE $PORT
CMD [ "node", "index.js" ]
