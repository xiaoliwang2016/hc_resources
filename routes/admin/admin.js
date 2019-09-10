var express = require('express')
var router = express.Router()
var Validator = require('../../validators/user')
var Controller = require('../../controllers/admin/admin')

router.get('/list', Validator.checkThemeId, Controller.list)
router.get('/listRole', Validator.checkId, Validator.checkThemeId, Controller.listRole)
router.get('/getThemeList', Validator.checkId, Controller.getThemeList)
router.post('/add', Validator.add, Controller.addAdminToTheme)
router.get('/remove', Validator.checkId, Validator.checkThemeId, Controller.remove)
router.post('/update', Validator.checkId, Controller.update)
router.post('/login', Validator.login, Controller.login.bind(Controller))
router.post('/logout', Controller.logout)


module.exports = router;
