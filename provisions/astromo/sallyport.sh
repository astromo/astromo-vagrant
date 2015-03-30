cd /vagrant/src/sallyport/
npm install

PORT=3001 pm2 start server.js --name sallyport
