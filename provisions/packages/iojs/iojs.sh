IOJS_VERSION=1.6.2

wget https://iojs.org/dist/v$IOJS_VERSION/iojs-v$IOJS_VERSION-linux-x64.tar.gz
tar zxf iojs-v$IOJS_VERSION-linux-x64.tar.gz
cd iojs-v$IOJS_VERSION-linux-x64
cp bin/* /usr/bin

# Fix for npm
# https://github.com/tj/n/issues/101
curl -L https://npmjs.org/install.sh | sh

# Install Grunt
npm install -g grunt-cli

# Install Bower
npm install -g bower

# Install PM2
npm install -g pm2
