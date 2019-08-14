var express = require('express');
var router = express.Router();
var Validator = require('../../validators/resources')
var Controller = require('../../controllers/admin/resources')

router.get('/list', Validator.list, Controller.list)
router.post('/add', Validator.add, Controller.add)
router.get('/edit', Validator.edit, Controller.edit)
router.post('/assignToUser', Validator.assignResourcesToUser, Controller.assignResourcesToUser)
router.post('/assignToRole', Validator.assignResourcesToRole, Controller.assignResourcesToRole)

module.exports = router