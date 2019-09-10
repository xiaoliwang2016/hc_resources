var express = require('express');
var router = express.Router();
var Validator = require('../../validators/user')
var Controller = require('../../controllers/home/permission')

router.post('/login', Validator.login, Controller.login.bind(Controller))
router.post('/authenticate', Controller.authenticate)


module.exports = router