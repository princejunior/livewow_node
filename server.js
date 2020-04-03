var express = require('express');
var app = express();
const path = require('path');
var partials = require('express-partials');
var bodyParser = require('body-parser');

require('dotenv').config();
const port = process.env.PORT || 5000;
const connectionString = process.env.DATABASE_URL;

// views is directory for all template files
app.set('views', path.join(__dirname, 'views'));
// set the view engine to ejs
app.set('view engine', 'ejs');

app.use(partials());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// tell it to use the public directory as one where static files live
app.use(express.static(path.join(__dirname, 'public')));

// routes
const home = require('./routes/homePage');
const login = require('./routes/loginPage');
const trainerProfilePage = require('./routes/trainerProfilePage');
const profilePage = require('./routes/profilePage');
const cartPage = require('./routes/cartPage');

// pages
// const login = path.join('pages', 'loginPage');
// const home = path.join('pages', 'homePage');
// const trainerProfilePage = path.join('pages', 'trainerProfilePage');
// const profilePage = path.join('pages', 'profilePage');
// const cartPage = path.join('pages', 'cart');

// router pages
app.use('/', home);
app.use('/login', login);
app.use('/trainerProfilePage', trainerProfilePage);
app.use('/profilePage', profilePage);
app.use('/cart', cartPage);

app.use((req, res) => {
  res.status(404);
  res.render(path.join(__dirname, 'views', '404'));
});

app.listen(port, function() {
  console.log('Node app is running on port', port);
});

// app.get('/', function(req, res, next) {
//   console.log('inside the homePage');
//   res.render(path.join('pages', 'homePage'), {
//     title: 'LW'
//   });
// });

// app.get('/login', function(req, res, next) {
//   console.log('inside the loginPage');
//   res.render(path.join('pages', 'loginPage'), {
//     title: 'LW Login'
//   });
// });

// app.get('/trainerProfilePage', function(req, res, next) {
//   console.log('inside the trainerProfilePage');
//   res.render(path.join('pages', 'trainerProfilePage'), {
//     title: 'LW Profile'
//   });
// });

// use res.render to load up an ejs view file
