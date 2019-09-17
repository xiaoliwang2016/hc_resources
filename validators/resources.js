var sequelize = require('../db/mysql').sequelize
const validate = require('./errorHandler')
const { body, query } = require('express-validator')

var UserModel = sequelize.import('../models/user')
var RoleModel = sequelize.import('../models/role')

class ResourcesValidator {

    checkId(req, res, next){
        return validate([
            query('id').exists().withMessage('ID不能为空，字段：theme_id')
        ])(req, res, next)
    }

    list(req, res, next){
        return validate([
            query('theme_id').exists().withMessage('主题ID不能为空，字段：theme_id')
        ])(req, res, next)
    }

    edit(req, res, next){
        return validate([
            body('id').exists().withMessage('ID不能为空，字段：id')
        ])(req, res, next)
    }

    add(req, res, next){
        return validate([
            body('pid').exists().withMessage('父ID不能为空，字段：pid'),
            body('theme_id').exists().withMessage('主题ID不能为空，字段：theme_id'),
            body('menu_title').exists().withMessage('菜单名称不能为空，字段：menu_title'),
            body('type').isIn(['0', '1', '2', '3']).withMessage('请指定菜单级别，字段：type'),
            body('status').optional().isIn(['1', '0']),
            body('public').isIn(['1', '0']),
            body('user_id').isInt().withMessage('创建者ID不能为空，字段：muser_id'),
            body('resources_order').optional().isInt().withMessage('排序不能为空，字段：resources_order'),
            body('open_type').isIn(['1', '0']).withMessage('0：当前窗口打开， 1：新窗口打开')
        ])(req, res, next)
    }

    assignResourcesToUser(req, res, next){
        return validate([
            body('user_id').custom(value => {
                return UserModel.findOne({
                    where: {
                        id: value
                    }
                }).then(user => {
                    if(user == null){
                        return Promise.reject('该 user_id 对应用户不存在')
                    }
                })
            }),
            body('resources_id').isArray().withMessage('resources_id 格式为数组')
        ])(req, res, next)
    }

    assignResourcesToRole(req, res, next){
        return validate([
            body('role_id').custom(value => {
                return RoleModel.findOne({
                    where: {
                        id: value
                    }
                }).then(user => {
                    if(user == null){
                        return Promise.reject('该 role_id 对应角色不存在')
                    }
                })
            }),
            body('resources_id').isArray().withMessage('resources_id 格式为数组')
        ])(req, res, next)
    }

}

module.exports = new ResourcesValidator()