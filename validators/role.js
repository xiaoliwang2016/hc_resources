const validate = require('./errorHandler')
const { body, query } = require('express-validator')
var sequelize = require('../db/mysql').sequelize

var UserModel = sequelize.import('../models/user')
var AdminModel = sequelize.import('../models/admin')

class UserValidator {

    assignRoleToUser(req, res, next){
        return validate([
            body('user_id').custom(value => {
                return UserModel.findOne({
                    where: { id: value }
                }).then(role => {
                    if(role == null){
                        return Promise.reject('该user_id对应用户不存在，user_id')
                    }
                })
            }),
            body('role_id').isArray().withMessage('角色ID格式为数组，role_id')
        ])(req, res, next)
    }

    assignRoleToAdmin(req, res, next){
        return validate([
            body('admin_id').custom(value => {
                return AdminModel.findOne({
                    where: { id: value }
                }).then(role => {
                    if(role == null){
                        return Promise.reject('该admin_id对应管理员不存在，admin_id')
                    }
                })
            }),
            body('role_id').isArray().withMessage('角色ID格式为数组，role_id')
        ])(req, res, next)
    }

    add(req, res, next){
        return validate([
            body('theme_id').exists().withMessage('主题ID不能为空，字段：theme_id'),
            body('role_group').isIn(['1', '0']).withMessage('0：前台角色， 1：后台角色'),
            body('role_name').exists().withMessage('角色名称不能为空，字段：role_name'),
            body('status').optional().isIn(['1', '0']).withMessage('0：禁用， 1：启用')
        ])(req, res, next)
    }

    list(req, res, next){
        return validate([
            query('theme_id').exists().withMessage('theme_id不能为空'),
            query('role_group').isIn(['1', '0']).withMessage('0：前台角色， 1：后台角色'),
        ])(req, res, next)
    }

    checkRoleId(req, res, next){
        return validate([
            query('role_id').exists().withMessage('role_id不能为空')
        ])(req, res, next)
    }

}

module.exports = new UserValidator()