const path = require('path');
const express = require('express');
const router = express.Router();

// router.get('/homepage', async (req, res) => {
//   console.log('inside the homePage');
//   res.render(path.join('../views', 'pages', 'homePage'), {});
// });

router.get('/', function(req, res, next) {
  console.log('inside the homePage');
  res.render(path.join('pages', 'homePage'), {
    title: 'Home'
  });
});

module.exports = router;
