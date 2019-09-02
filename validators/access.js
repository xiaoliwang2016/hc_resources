var sequelize = require('../db/mysql').sequelize
const validate = require('./errorHandler')
const { body, query } = require('express-validator')

var AdminModel = sequelize.import('../models/admin')
var RoleModel = sequelize.import('../models/role')

class AccessValidator {

    assignAccessToRole(req, res, next){
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
            body('access_id').isArray().withMessage('resources_id 格式为数组')
        ])(req, res, next)
    }

    assignAccessToAdmin(req, res, next){
        return validate([
            body('admin_id').custom(value => {
                return AdminModel.findOne({
                    where: {
                        id: value
                    }
                }).then(user => {
                    if(user == null){
                        return Promise.reject('该 admin_id 对应管理员不存在')
                    }
                })
            }),
            body('access_id').isArray().withMessage('resources_id 格式为数组'),
            body('theme_id').exists().withMessage('theme_id 不能为空')
        ])(req, res, next)
    }

    checkRoleId(req, res, next){
        return validate([
            query('role_id').exists().withMessage('role_id 不能为空')
        ])(req, res, next)
    }
}

module.exports = new AccessValidator()