var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var VerifyAccountModel = sequelize.import('../../models/verify_account')

class Account {

    async list(req, res, next){
        const data = await VerifyAccountModel.findAll({
            where: {
                theme_id: req.query.theme_id
            }
        })
        res.json({
            code: 1,
            data
        })
    }

    async addRecord(req, res, next){
        const [ created ] = await VerifyAccountModel.findOrCreate({
            where: {
                account: req.body.account,
                password: req.body.password,
                theme_id: req.body.theme_id
            }
        })
        res.json({
            code: 1,
            message: created ? '创建成功' : '更新成功'
        })
    } 

}

module.exports = new Account()