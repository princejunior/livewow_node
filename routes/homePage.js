const path = require('path');
const express = require('express');
const router = express.Router();
const rootDir = require('../views/pages');

// router.get('/homepage', async (req, res) => {
//   console.log('inside the homePage');
//   res.render(path.join('../views', 'pages', 'homePage'), {});
// });

router.get('/', function(req, res, next) {
  res.render('homePage', {
    title: 'Home'
  });
});

module.exports = router;
