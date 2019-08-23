var express = require('express');
var router = express.Router();
var Validator = require('../../validators/theme')
var Controller = require('../../controllers/admin/theme')

router.get('/list', Validator.list, Controller.list)
router.post('/add', Validator.add, Controller.add)
router.post('/addUser', Validator.addUser, Controller.addUser)

module.exports = router;
