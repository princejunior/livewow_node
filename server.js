// server.js
// load the things we need
var express = require('express');
var app = express();
const path = require('path');
var partials = require('express-partials');
var bodyParser = require('body-parser');
const port = process.env.PORT || 5000;
// tell it to use the public directory as one where static files live
app.use(express.static(__dirname + '/public'));
// views is directory for all template files
app.set('views', __dirname + '/views');
// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(partials());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(express.static(path.join(__dirname, 'public')));
app.use(require('./routes/homePage'));
app.use(require('./routes/loginPage'));

// use res.render to load up an ejs view file

app.use((req, res) => {
  res.status(404);
  res.render(path.join(__dirname, '/views', '404'));
});

app.listen(port, function() {
  console.log('Node app is running on port', port);
});
