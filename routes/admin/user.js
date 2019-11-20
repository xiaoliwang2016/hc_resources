var express = require('express')
var router = express.Router()
var Validator = require('../../validators/user')
var Controller = require('../../controllers/admin/user')

router.get('/list', Validator.checkThemeId, Controller.list)
//查询某个用户在某个主题下拥有的所有资源
router.get('/listResources', Validator.checkUserId, Validator.checkThemeId, Controller.listResources)
router.get('/listRole', Validator.checkId, Controller.listRole)
router.post('/add', Validator.checkUserNo, Validator.checkThemeId, Controller.addUserToTheme)
router.post('/update', Validator.checkId, Controller.edit)
router.post('/changeStatus', Validator.checkThemeId, Validator.checkUserId, Validator.checkStatus, Controller.changeUserStatus)
router.post('/delete', Validator.checkUserId, Validator.checkThemeId, Controller.delete)
router.get('/getUserInfo', Controller.getDetailViaUserNo)

module.exports = router;
