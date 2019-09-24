var express = require('express');
var router = express.Router();
var Validator = require('../../validators/role')
var Controller = require('../../controllers/admin/role')

router.get('/list', Validator.checkThemeId, Validator.checkGroupId, Controller.list)
router.get('/listResources', Validator.checkRoleId, Controller.listResources)
router.get('/listUser', Validator.checkRoleId, Controller.listUser)
router.post('/addOrUpdate', Validator.add, Controller.addOrUpdate)
router.post('/assignToUser', Validator.assignRoleToUser, Controller.assignRoleToUser)
router.post('/assignToAdmin', Validator.assignRoleToAdmin, Controller.assignRoleToAdmin)

module.exports = router;
