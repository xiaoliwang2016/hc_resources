var express = require('express')
var router = express.Router()
var Controller = require('../../controllers/admin/statistic')

router.get('/views', Controller.getViewsViaThemeId)

module.exports = router;
