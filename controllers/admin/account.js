var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var request = require('request')

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

    authorize(req, res, next){
        request({
            url: 'http://192.172.1.240/api/3.2/auth/signin',
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            json: {
                credentials: req.body.credentials
            }
        },async function (error, response, body) {
            if(error || body.error){
                return res.json({
                    code: 0,
                    message: '验证失败'
                })
            }

            const [ instance, created ] = await VerifyAccountModel.findOrCreate(
                {
                    where: {
                        account: req.body.credentials.name,
                        theme_id: req.body.theme_id
                    },
                    defaults: {
                        account: req.body.credentials.name,
                        password: req.body.credentials.password,
                        theme_id: req.body.theme_id,
                        admin_id: req.body.admin_id
                    }
                }
            )

            if(!created) {
                instance.password = req.body.credentials.password,
                instance.admin_id = req.body.admin_id
                await instance.save()
            }

            res.json({
                code: 1,
                message: created ? '创建成功' : '更新成功'
            })
        })
    }

}

module.exports = new Account()