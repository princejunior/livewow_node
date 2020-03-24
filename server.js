// server.js
// load the things we need
var express = require('express');
var app = express();
const path = require('path');
var partials = require('express-partials');
var bodyParser = require('body-parser');
const port = process.env.PORT || 5000;
const connectionString =
  process.env.DATABASE_URL ||
  'postgres://zbjwehyztrcamp:353fecb1af3e0631d30fcc5f12050d44ac814afdb27b1bf69726fc3cee62de40@ec2-3-91-112-166.compute-1.amazonaws.com:5432/dae616nq6ejseq?ssl=true';

const home = require('./routes/homePage');
const login = require('./routes/loginPage');

// views is directory for all template files
app.set('views', path.join(__dirname, 'views'));
// set the view engine to ejs
app.set('view engine', 'ejs');

app.use(partials());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// tell it to use the public directory as one where static files live
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', home);
app.use('/login', login);
// app.use(require('./routes/homePage'));
// app.use(require('./routes/loginPage'));

// use res.render to load up an ejs view file

app.use((req, res) => {
  res.status(404);
  res.render(path.join(__dirname, 'views', '404'));
});

app.listen(port, function() {
  console.log('Node app is running on port', port);
});
