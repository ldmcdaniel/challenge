var pg = require('pg');
var connectionString = 'postgres://localhost:5432/premise';

pg.connect(connectionString, function (err, client, done) {
  if(err) {
    return console.error('error fetching Everything from pool', err);
  }
  client.query('SELECT '+
                'product_details.productid, '+
                'products.productname, ' +
                'stakeholdername, '+
                'contactinfo, '+
                'clientname '+
              'FROM '+
                'product_details '+
              'INNER JOIN '+
                'stakeholders ON product_details.stakeholderid = stakeholders.stakeholderid '+
              'INNER JOIN '+
                'clients ON product_details.clientid = clients.clientid '+
              'INNER JOIN '+
                'products ON product_details.productid = products.productid '+
              'ORDER BY '+
                'productid', function(err, result) {

    if(err) {
      return console.error('error running Product_details query', err);
    }
    console.log("===========");
    console.log('Final Query');
    console.log("===========");

    result.rows.forEach(function (row) {
      console.log(row);
    })

    client.end();
  });
});
