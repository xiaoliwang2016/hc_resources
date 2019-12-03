var express = require('express');
var router = express.Router();
var Validator = require('../../validators/resources')
var Controller = require('../../controllers/admin/resources')

router.get('/list', Validator.checkThemeId, Controller.list)
router.get('/detail', Validator.checkId, Controller.getDetail)


module.exports = router