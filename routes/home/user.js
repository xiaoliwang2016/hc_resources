var express = require('express');
var router = express.Router();
var Validator = require('../../validators/user')
var Controller = require('../../controllers/home/user')

router.post('/login', Validator.login, Controller.login)

module.exports = router