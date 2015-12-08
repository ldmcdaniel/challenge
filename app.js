var express = require('express'),
    app = express(),
    bodyParser = require('body-parser'),
    pg = require('pg'),
    connectionString = 'postgres://localhost:5432/premise';

app.use(bodyParser.urlencoded({extended: true}));

var router = require('./server/routes.js')

app.get('/api/stakeholders', function(req, res) {
  var sHolders = [];

  pg.connect(connectionString, function (err, client, done) {
    if(err) {
      done();
      console.error('error fetching Everything from pool', err);
      return res.status(500).json({ success: false, data: err});
    };

    var query = client.query(
      'SELECT '+
        'product_details.productid, '+
        'products.productname, ' +
        'clientname, '+
        'stakeholdername, '+
        'contactinfo '+
      'FROM '+
        'product_details '+
      'INNER JOIN '+
        'stakeholders ON product_details.stakeholderid = stakeholders.stakeholderid '+
      'INNER JOIN '+
        'clients ON product_details.clientid = clients.clientid '+
      'INNER JOIN '+
        'products ON product_details.productid = products.productid '+
      'ORDER BY '+
        'productid'
    );

    query.on('row', function (row) {
      sHolders.push(row);
    });

    query.on('end', function (){
      done();
      return res.json(sHolders);
    });
  });
});

app.get('/api/products', function(req, res) {
  var productNames = [];

  pg.connect(connectionString, function (err, client, done) {
    if(err) {
      done();
      console.error('error fetching Products from pool', err);
      return res.status(500).json({ success: false, data: err});
    };

    var query = client.query(
      'SELECT '+
        'productname ' +
      'FROM '+
        'products '+
      'ORDER BY '+
        'productname'
    );

    query.on('row', function (row) {
      productNames.push(row);
    });

    query.on('end', function (){
      done();
      return res.json(productNames);
    });
  });
})


app.use(express.static('www'));

app.listen(4000);
console.log('listening on localhost:4000');
