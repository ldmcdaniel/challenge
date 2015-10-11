var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var welcome = require('./routes/welcome')

app.set('view engine', 'ejs');
app.locals.title = 'Premise Health';

app.use(bodyParser.urlencoded({extended: true}));

app.use(express.static('www'));

app.use('/', welcome)

app.listen(4000);
console.log('listening on localhost:4000');
