const path = require('path');
const express = require('express');
const router = express.Router();

router.get('/', function(req, res, next) {
  console.log('inside the profilePage');
  res.render(path.join('pages', 'profilePage'), {
    title: 'Login'
  });
});
module.exports = router;
