var pg = require('pg');
var connectionString = 'postgres://localhost:5432/premise';

pg.connect(connectionString, function (err, client, done) {
  if(err) {
    return console.error('error fetching client from pool', err);
  }
  client.query('SELECT * FROM Clients', function(err, result) {

    if(err) {
      return console.error('error running Clients query', err);
    }
    console.log("==========");
    console.log('Clients');
    console.log("==========");

    result.rows.forEach(function (row) {
      console.log(row);
    })

    client.end();
  });
})

pg.connect(connectionString, function (err, client, done) {
  if(err) {
    return console.error('error fetching client from pool', err);
  }
  client.query('SELECT * FROM Stakeholders', function(err, result) {

    if(err) {
      return console.error('error running Stakeholders query', err);
    }
    console.log("============");
    console.log('Stakeholders');
    console.log("============");

    result.rows.forEach(function (row) {
      console.log(row);
    })

    client.end();
  });
})

pg.connect(connectionString, function (err, client, done) {
  if(err) {
    return console.error('error fetching client from pool', err);
  }
  client.query('SELECT * FROM Products', function(err, result) {

    if(err) {
      return console.error('error running Products query', err);
    }
    console.log("========");
    console.log('Products');
    console.log("========");

    result.rows.forEach(function (row) {
      console.log(row);
    })

    client.end();
  });
})

pg.connect(connectionString, function (err, client, done) {
  if(err) {
    return console.error('error fetching product_details from pool', err);
  }
  client.query('SELECT * FROM Product_details', function(err, result) {

    if(err) {
      return console.error('error running Product_details query', err);
    }
    console.log("========");
    console.log('Product Details');
    console.log("========");

    result.rows.forEach(function (row) {
      console.log(row);
    })

    client.end();
  });
});
