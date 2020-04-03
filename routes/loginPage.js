const path = require('path');
const express = require('express');
var app = express();
const router = express.Router();
const bcrypt = require('bcrypt');
const Pool = require('pg-pool');
const session = require('express-session');

require('dotenv').config();
const connectionString = process.env.DATABASE_URL;

router.get('/', function(req, res, next) {
  console.log('inside the loginPage');
  res.render(path.join('pages', 'loginPage'), {
    title: 'Login'
  });
});

// var logRequest = function(req, res, next) {
//   console.log('log Request');
//   console.log('Received a request for: ' + req.url);
//   next();
// };
// app.use(logRequest);

// var verifyLogin = function(req, res, next) {
//   console.log('inside verifyLogin');
//   if (req.session.username) {
//     next();
//   } else {
//     // res.writeHead(401, { 'Content-Type': 'application/json' });
//     res.write(JSON.stringify({ status: 401, success: false }));
//     res.end();
//   }
// };
// app.use(
//   session({
//     secret: 'much secret',
//     resave: false,
//     saveUninitialized: true
//   })
// );

// function connectToDb() {
//   console.log('connect to database');
//   const connectionString = process.env.DATABASE_URL;
//   const pool = new Pool({ connectionString: connectionString });
//   return pool;
// }

// app.post('/', function(req, res) {
//   console.log('inside post');
//   var first_name = req.body.first_name;
//   var last_name = req.body.last_name;
//   var email = req.body.email;
//   var password = req.body.password;

//   bcrypt.hash(password, 10, function(err, hash) {
//     console.log(hash);
//   });

//   var id = null;
//   var pool = connectToDb();
//   var params = [email];
//   var sql = 'SELECT password FROM customer WHERE email = $1';
//   pool.query(sql, params, function(err, result) {
//     if (err) {
//       console.log('in the error for pool');
//       res.status(500).json({ success: false, data: err });
//     }

//     var hash = result.rows[0].password;

//     bcrypt.compare(password, hash, function(err, result) {
//       var json = { success: false };
//       if (result) {
//         json.success = true;
//         req.session.username = username;
//         req.session.password = password;
//       }
//       res.json(json);
//     });
//   });
// });

// app.post('/logout', function(req, res) {
//   var json = { success: false };
//   if (req.session.username) {
//     req.session.destroy();
//     json.success = true;
//   }
//   res.json(json);
// });

// app.use(verifyLogin);
// app.get('/getServerTime', function(req, res) {
//   var time = new Date();
//   var result = { success: true, time: time };
//   res.json(result);
// });

// app.post('/login', function(req, res) {
//   var first_name = req.body.first_name;
//   var last_name = req.body.last_name;
//   var email = req.body.email;
//   var password = req.body.password;

//   bcrypt.hash(password, 10, function(err, hash) {
//     console.log(hash);
//   });
//   var id = null;
//   var pool = connectionString();
//   var params = [username];
//   var sql = 'SELECT password FROM member WHERE username = $1';
//   pool.query(sql, params, function(err, result) {
//     if (err) {
//       console.log('in the error for pool');
//       res.status(500).json({ success: false, data: err });
//     }

//     var hash = result.rows[0].password;

//     bcrypt.compare(password, hash, function(err, result) {
//       var json = { success: false };
//       if (result) {
//         json.success = true;
//         req.session.first_name = first_name;
//         req.session.last_name = last_name;
//         req.session.email = email;
//         req.session.password = password;
//       }
//       res.json(json);
//     });
//   });
// });

module.exports = router;
