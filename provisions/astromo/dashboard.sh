cd /vagrant/src/dashboard/
npm install
bower --config.interactive=false install

pm2 start /vagrant/provisions/astromo/dashboard.json
