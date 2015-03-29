cd /vagrant/src/dashboard-api/
npm install

JWT_SECRET=foo pm2 start server.js --watch
