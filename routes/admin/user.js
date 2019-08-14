var express = require('express')
var router = express.Router()
var Validator = require('../../validators/user')
var Controller = require('../../controllers/admin/user')

router.get('/list', Controller.list)
router.post('/add', Validator.add, Controller.addUserToTheme)
router.post('/update', Validator.edit, Controller.edit)


module.exports = router;
