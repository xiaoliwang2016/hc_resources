const validate = require('./errorHandler')
const { body, query, check } = require('express-validator')

class Base {
    /**
     * 检查分页参数
     */
    PaginateParam(req, res, next){
        return validate([
            query('pageNo').isInt().withMessage('pageNo不能为空'),
            query('pageSize').isInt().withMessage('pageSize不能为空')
        ])(req, res, next)
    }

    checkThemeId(req, res, next){
        return validate([
            check('theme_id').isInt().withMessage('theme_id不能为空')
        ])(req, res, next)
    }

    checkUserId(req, res, next){
        return validate([
            check('user_id').exists().withMessage('user_id不能为空')
        ])(req, res, next) 
    }

    checkId(req, res, next){
        return validate([
            check('id').exists().withMessage('id不能为空')
        ])(req, res, next) 
    }
}

module.exports = Base