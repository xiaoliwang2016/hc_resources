var { sanitize } = require('express-validator')
var express = require('express')
var router = express.Router()
var Controller = require('../../controllers/admin/statistic')

router.get('/views', Controller.getViewsViaThemeId)
router.get('/accessRecord', [sanitize('pageSize').toInt()], Controller.getAccessRecordViaThemeId)

module.exports = router;
