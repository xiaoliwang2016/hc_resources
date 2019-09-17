var express = require('express')
var router = express.Router()
var Controller = require('../../controllers/admin/account')

router.get('/list', Controller.list)
router.post('/save', Controller.addRecord)


module.exports = router;
