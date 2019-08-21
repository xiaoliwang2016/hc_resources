var express = require('express')
var router = express.Router()
var Validator = require('../../validators/user')
var Controller = require('../../controllers/admin/admin')

router.post('/list', Validator.list, Controller.list)
router.post('/add', Validator.add, Controller.addAdminToTheme)
router.post('/update', Validator.update, Controller.update)
router.post('/login', Validator.login, Controller.login.bind(Controller))
router.get('/logout', Controller.logout)


module.exports = router;
