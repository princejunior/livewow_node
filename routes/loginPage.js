const path = require('path');
const express = require('express');
const router = express.Router();

router.get('/login', async (req, res) => {
  console.log('inside the login page');
  res.render(path.join('../views', 'pages', 'loginPage'));
});

module.exports = router;
