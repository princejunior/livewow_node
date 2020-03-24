const path = require('path');
const express = require('express');
const router = express.Router();

// router.get('/login', async (req, res) => {
//   console.log('inside the login page');
//   res.render(path.join('../views', 'pages', 'loginPage'));
// });

router.get('/', function(req, res, next) {
  console.log('inside the loginPage');
  res.render(path.join('pages', 'loginPage'), {
    title: 'Login'
  });
});
module.exports = router;
