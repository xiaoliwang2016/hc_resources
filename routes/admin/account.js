var express = require('express')
var router = express.Router()
var Controller = require('../../controllers/admin/account')

router.get('/list', Controller.list)
router.post('/authorize', Controller.authorize)


module.exports = router;
