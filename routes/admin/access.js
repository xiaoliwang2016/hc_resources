var express = require('express')
var router = express.Router()
var Controller = require('../../controllers/admin/access')

router.post('/add', Controller.addRecord)


module.exports = router;
