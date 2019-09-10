var express = require('express');
var router = express.Router();
var Controller = require('../../controllers/admin/employee')
var Validator = require('../../validators/user')

router.get('/search', Validator.checkUserNo, Controller.search)
router.post('/import', Controller.init, Controller.importFromExcel)

module.exports = router;
