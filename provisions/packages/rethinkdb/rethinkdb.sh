# Install rethinkDB
# http://rethinkdb.com/docs/install/ubuntu/
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y rethinkdb

# Configure rethinkDB
# http://www.rethinkdb.com/docs/start-on-startup/
sudo echo "bind=all" > /etc/rethinkdb/instances.d/instance1.conf

sudo /etc/init.d/rethinkdb restart
