cd /vagrant/src/dashboard-api/
npm install

JWT_SECRET=foo pm2 start --name dashboard-api server.js --watch
