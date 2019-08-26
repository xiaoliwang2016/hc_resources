var express = require('express');
var router = express.Router();
var Validator = require('../../validators/role')
var Controller = require('../../controllers/admin/role')

router.get('/list', Validator.list, Controller.list)
router.post('/add', Validator.add, Controller.add)
router.post('/assignToUser', Validator.assignRoleToUser, Controller.assignRoleToUser)
router.post('/assignToAdmin', Validator.assignRoleToAdmin, Controller.assignRoleToAdmin)

module.exports = router;
