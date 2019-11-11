var express = require('express');
var router = express.Router();
var Validator = require('../../validators/user')
var Controller = require('../../controllers/home/user')
var StatisticController = require('../../controllers/admin/statistic')

router.get('/listTheme', Controller.listTheme)
router.get('/addHistory', Validator.checkUserId, Validator.checkThemeId, StatisticController.addUserHistory)


module.exports = router