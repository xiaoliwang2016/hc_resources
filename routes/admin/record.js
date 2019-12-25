var express = require('express');
var router = express.Router();
var Controller = require('../../controllers/admin/record')
var Validator = new (require('../../validators/base'))()

router.post('/add', Validator.checkThemeId, Validator.checkUserNo, Controller.addRecord)
router.get('/list', Validator.PaginateParam, Controller.getRecord)

module.exports = router;
