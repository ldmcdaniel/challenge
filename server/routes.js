var express = require('express'),
    app = express(),
    bodyParser = require('body-parser');

app.get('/', function (req, res, next) {
  res.sendFile('../www/index.html');
});

app.use(bodyParser.urlencoded({extended: true}));

module.exports = app;
