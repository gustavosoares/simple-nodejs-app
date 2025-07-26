
const express = require('express');
const app = express();

app.get('/', function(req, res) {
    res.json({
        status: "ok"
    });
});

app.get('/hello/:name', function(req, res) {
    res.json({
        hello: req.params.name
    });
});

var port = process.env.HTTP_PORT || 3000;

var server = app.listen(port, function() {
    var host = server.address().address;
    console.log('Sample app listening at host => %s | port => %s', host, port);
});
