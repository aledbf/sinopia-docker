#!/bin/sh

echo "Installing required packages to build sinopia..."
apk -U add curl make gcc g++ python

echo "Downloading sinopia master..."
wget https://github.com/rlidwka/sinopia/archive/master.tar.gz && \
	tar zxpvf master.tar.gz && \
	mv sinopia-master sinopia && \
	rm master.tar.gz

cd /sinopia

mkdir -p /storage/cache

echo "Running npm install..."
npm install --production && \
	rm -rf .git \
	npm cache clean

echo "Removing temporal packages..."
apk del make gcc g++ python && \
	rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp

echo "Adding nodejs user"
addgroup nodejs 2>/dev/null
adduser -S -H -h /sinopia -s /bin/false -D \
	-G nodejs nodejs 2>/dev/null

echo "Changing permissions..."
chown -R nodejs.nodejs /sinopia /storage