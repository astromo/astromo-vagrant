cd /vagrant/src/dashboard/
npm install
bower --config.interactive=false install

pm2 start --name dashboard /usr/bin/grunt serve
