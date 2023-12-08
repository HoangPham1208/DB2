const jwt = require('jsonwebtoken')

module.exports = function authenticateToken(req, res, next) {
  const token = req.cookies.token;
  if (!token) return res.redirect('/login')

  jwt.verify(token, 'alo1234', (err, decoded) => {
    if (err) return res.redirect('/login')
    req.data = decoded
    next();
  });
} 