// const path = require('path');
// const express = require('express');
// const router = express.Router();
// const bcrypt = require('bcrypt');
// const Pool = require('pg-pool');
// const session = require('express-session');
// const signupForm = document.querySelector('#signUp');
// const trainerSignupForm = document.querySelector('#trainerSignUp');

// router.get('/', function(req, res, next) {
//   console.log('inside the loginPage');
//   res.render(path.join('pages', 'loginPage'), {
//     title: 'Login'
//   });
// });

// var logRequest = function(req, res, next) {
//   console.log('Received a request for: ' + req.url);
//   next();
// };
// router.use(logRequest);

// var verifyLogin = function(req, res, next) {
//   if (req.session.username) {
//     next();
//   } else {
//     res.writeHead(401, { 'Content-Type': 'application/json' });
//     res.write(JSON.stringify({ status: 401, success: false }));
//     res.end();
//   }
// };
// router.use(
//   session({
//     secret: 'much secret',
//     resave: false,
//     saveUninitialized: true
//   })
// );

// function connectToDb() {
//   const connectionString =
//     process.env.DATABASE_URL ||
//     'postgres://zbjwehyztrcamp:353fecb1af3e0631d30fcc5f12050d44ac814afdb27b1bf69726fc3cee62de40@ec2-3-91-112-166.compute-1.amazonaws.com:5432/dae616nq6ejseq?ssl=true';
//   const pool = new Pool({ connectionString: connectionString });
//   return pool;
// }

// router.post('/login', function(req, res) {
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
//         req.session.username = username;
//         req.session.password = password;
//       }
//       res.json(json);
//     });
//   });
// });

// router.post('/logout', function(req, res) {
//   var json = { success: false };
//   if (req.session.username) {
//     req.session.destroy();
//     json.success = true;
//   }
//   res.json(json);
// });

// router.use(verifyLogin);
// router.get('/getServerTime', function(req, res) {
//   var time = new Date();
//   var result = { success: true, time: time };
//   res.json(result);
// });

// // router.post('/login', function(req, res) {
// //   var first_name = req.body.first_name;
// //   var last_name = req.body.last_name;
// //   var email = req.body.email;
// //   var password = req.body.password;

// //   bcrypt.hash(password, 10, function(err, hash) {
// //     console.log(hash);
// //   });
// //   var id = null;
// //   var pool = connectionString();
// // var params = [username];
// // var sql = 'SELECT password FROM member WHERE username = $1';
// // pool.query(sql, params, function(err, result) {
// //   if (err) {
// //     console.log('in the error for pool');
// //     res.status(500).json({ success: false, data: err });
// //   }

// // var hash = result.rows[0].password;

// // bcrypt.compare(password, hash, function(err, result) {
// //   var json = { success: false };
// //   if (result) {
// //     json.success = true;
// //     req.session.first_name = first_name;
// //     req.session.last_name = last_name;
// //     req.session.email = email;
// //     req.session.password = password;
// //   }
// //     res.json(json);
// //   });
// // });
// // });

// module.exports = router;
