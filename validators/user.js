const validate = require('./errorHandler')
const { body, query } = require('express-validator')

class UserValidator {

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
            body('email').optional().isEmail().withMessage('邮箱格式不正确，字段：email'),
            body('status').optional().isIn(['1', '0']),
            body('super').optional().isIn(['1', '0']).withMessage('0：普通用户， 1：超级管理员'),
            body('user_group').optional().isIn(['1', '0', '2']).withMessage('0：前台用户，1：后台用户，2：前/后台用户')
        ])(req, res, next)
    }

    edit(req, res, next){
        return validate([
            body('id').exists().withMessage('ID不能为空，字段：id'),
            body('email').optional().isEmail().withMessage('邮箱格式不正确，字段：email'),
            body('status').optional().isIn(['1', '0']),
            body('super').optional().isIn(['1', '0']).withMessage('0：普通用户， 1：超级管理员'),
            body('user_group').optional().isIn(['1', '0', '2']).withMessage('0：前台用户，1：后台用户，2：前/后台用户')
        ])(req, res, next)
    }

    checkThemeId(req, res, next){
        return validate([
            query('theme_id').exists().withMessage('theme_id不能为空')
        ])(req, res, next)
    }

    checkId(req, res, next){
        return validate([
            query('id').exists().withMessage('id不能为空')
        ])(req, res, next) 
    }

}

module.exports = new UserValidator()