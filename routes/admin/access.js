var express = require('express')
var router = express.Router()
var validator = require('../../validators/access')
var Controller = require('../../controllers/admin/access')

router.post('/add', Controller.addRecord)
router.get('/list', Controller.list)
router.post('/assignToRole', validator.assignAccessToRole, Controller.assignAccessToRole)
router.post('/assignToAdmin', validator.assignAccessToAdmin, Controller.assignAccessToAdmin)


module.exports = router;
