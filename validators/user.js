const validate = require('./errorHandler')
const { body, query } = require('express-validator')
const Base = require('./base')

class UserValidator extends Base {

    login(req, res, next){
        return validate([
            body('user_no').exists().withMessage('工号不能为空，字段：user_no'),
            body('password').exists().withMessage('密码不能为空，字段：password')
        ])(req, res, next)
    }

    add(req, res, next){
        return validate([
            body('user_no').exists().withMessage('工号不能为空，字段：user_no'),
            body('theme_id').exists().withMessage('主题ID不能为空，字段：theme_id'),
            body('user_name').exists().withMessage('用户名不能为空，字段：user_name'),
            body('status').optional().isIn(['1', '0']),
            body('super').optional().isIn(['1', '0']).withMessage('0：普通用户， 1：超级管理员'),
            body('user_group').optional().isIn(['1', '0', '2']).withMessage('0：前台用户，1：后台用户，2：前/后台用户')
        ])(req, res, next)
    }

    edit(req, res, next){
        return validate([
            body('id').exists().withMessage('ID不能为空，字段：id'),
            body('status').optional().isIn(['1', '0']),
            body('super').optional().isIn(['1', '0']).withMessage('0：普通用户， 1：超级管理员'),
            body('user_group').optional().isIn(['1', '0', '2']).withMessage('0：前台用户，1：后台用户，2：前/后台用户')
        ])(req, res, next)
    }


    checkUserNo(req, res, next){
        return validate([
            query('user_no').exists().withMessage('user_no不能为空')
        ])(req, res, next) 
    }

}

module.exports = new UserValidator()