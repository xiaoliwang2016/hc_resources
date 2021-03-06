var express = require('express');
var router = express.Router();
var Validator = require('../../validators/resources')
var Controller = require('../../controllers/admin/resources')

router.post('/addOrUpdate', Validator.add, Controller.addOrUpdate)
router.post('/deleteLink', Validator.checkId, Controller.deleteLink)
router.post('/delete', Validator.checkId, Controller.delete)
router.post('/assignToUser', Validator.assignResourcesToUser, Controller.assignResourcesToUser)
router.post('/assignToRole', Validator.assignResourcesToRole, Controller.assignResourcesToRole)

module.exports = router