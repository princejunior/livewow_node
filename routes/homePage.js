const path = require('path');
const express = require('express');
const router = express.Router();
const pg = require('pg');

require('dotenv').config();
const { Pool, Client } = require('pg');
const connectionString = process.env.DATABASE_URL;
console.log(connectionString);
// const client = new Client({
//   connectionString: connectionString
// });

const db = new Pool({
  user: 'zbjwehyztrcamp',
  port: 5432,
  database: 'dae616nq6ejseq',
  password: '353fecb1af3e0631d30fcc5f12050d44ac814afdb27b1bf69726fc3cee62de40',
  host: 'localhost',
  connectionString: connectionString
});
function connectToDb() {
  const pool = new Pool({ connectionString: connectionString });
  return pool;
}

const pool = connectToDb();

router.get('/', function(req, res, next) {
  console.log('inside the homePage');
  res.render(path.join('pages', 'homePage'), {
    title: 'Home'
  });
  var sql = 'SELECT * from trainer';
  db.query(sql, (err, res) => {
    if (err) {
      console.log('in the error for pool');
    }
    console.log(err, res);
    // pool.end();
  });
});

module.exports = router;

// router.get('/homepage', async (req, res) => {
//   console.log('inside the homePage');
//   res.render(path.join('../views', 'pages', 'homePage'), {});
// });
