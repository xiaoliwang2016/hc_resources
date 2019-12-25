const validate = require('./errorHandler')
const { body, check } = require('express-validator')
const Base = require('./base')

class UserValidator extends Base {

    login(req, res, next){
        return validate([
            body('user_no').exists().withMessage('工号不能为空，字段：user_no'),
            body('password').exists().withMessage('密码不能为空，字段：password')
        ])(req, res, next)
    }


}

module.exports = new UserValidator()