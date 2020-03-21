const path = require('path');
const express = require('express');
const router = express.Router();
const rootDir = require('../views/pages');
// const partialDir = require('../views/partials');
// const homePage = require('../public/homePage.html');

router.get('/homepage', async (req, res) => {
  console.log('inside the homePage');
  res.render(path.join('../views', 'pages', 'homePage'), {});
});

// router.get('/homePage', (req, res, next) => {
//   res.render(path.join('./partials', 'addUser'), { navPath: partialDir });
// });

module.exports = router;
