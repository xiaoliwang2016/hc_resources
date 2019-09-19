const validate = require('./errorHandler')
const { body, query, check } = require('express-validator')
const Base = require('./base')
var sequelize = require('../db/mysql').sequelize

var ThemeModel = sequelize.import('../models/theme')

class ThemeValidator extends Base {

    addTheme(req, res, next){
        return validate([
            body('theme_name').exists().withMessage('主题名称不能为空，字段：theme_name'),
            body('manager').exists().withMessage('管理员不能为空，字段：manager'),
            body('status').optional().isIn(['1', '0']).withMessage('0：禁用， 1：启用'),
            check('manager_id').exists().withMessage('pageNo不能为空')
        ])(req, res, next)
    }

    addUser(req, res, next){
        return validate([
            body('theme_id').custom(value => {
                return ThemeModel.findOne({
                    where: { id: value }
                }).then(theme => {
                    if(theme == null){
                        return Promise.reject('该theme_id对应主题不存在')
                    }
                })
            }),
            body('user_id').isArray().withMessage('用户ID格式为数组，user_id')
        ])(req, res, next)
    }

}

module.exports = new ThemeValidator()