IOJS_VERSION=2.2.1

# Download, verify and install io.js
gpg --keyserver pool.sks-keyservers.net --recv-keys \
  9554F04D7259F04124DE6B476D5A82AC7E37093B \
  DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
  FD3A5288F042B6850C66B31F09FE44734EB7990E
curl -SLO "https://iojs.org/dist/v$IOJS_VERSION/iojs-v$IOJS_VERSION-linux-x64.tar.gz"
curl -SLO "https://iojs.org/dist/v$IOJS_VERSION/SHASUMS256.txt.asc"
gpg --verify SHASUMS256.txt.asc
grep " iojs-v$IOJS_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c -
tar -xzf "iojs-v$IOJS_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1
rm "iojs-v$IOJS_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc

# Install Grunt
npm install -g grunt-cli

# Install Bower
npm install -g bower

# Install PM2
npm install -g pm2
