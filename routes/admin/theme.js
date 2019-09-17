var express = require('express');
var router = express.Router();
var Validator = require('../../validators/theme')
var Controller = require('../../controllers/admin/theme')

router.get('/homeInfo', Validator.checkThemeId, Controller.getHomeInfo)
router.get('/list', Validator.list, Controller.list)
router.post('/addOrUpdate', Validator.add, Controller.addOrUpdate)
router.post('/addUser', Validator.addUser, Controller.addUser)

module.exports = router;
