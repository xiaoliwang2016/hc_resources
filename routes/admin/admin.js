var express = require('express')
var router = express.Router()
var Validator = require('../../validators/user')
var Controller = require('../../controllers/admin/admin')

// router.get('/list', Controller.list)
router.post('/add', Validator.add, Controller.addAdminToTheme)
router.post('/login', Validator.login, Controller.login.bind(Controller))
router.get('/logout', Controller.logout)


module.exports = router;
