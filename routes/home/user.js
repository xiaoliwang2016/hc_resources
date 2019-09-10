var express = require('express');
var router = express.Router();
var Validator = require('../../validators/user')
var Controller = require('../../controllers/home/user')

router.get('/listTheme', Controller.listTheme)


module.exports = router