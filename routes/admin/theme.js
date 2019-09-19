var express = require('express');
var router = express.Router();
var Validator = require('../../validators/theme')
var Controller = require('../../controllers/admin/theme')

router.get('/list', Validator.PaginateParam, Controller.list)
router.get('/homeInfo', Validator.checkThemeId, Controller.getHomeInfo)
//添加/编辑 主题内容
router.post('/addOrUpdate', Validator.addTheme, Controller.addOrUpdate)
//添加用户到主题
router.post('/addUser', Validator.addUser, Controller.addUser)

module.exports = router;
