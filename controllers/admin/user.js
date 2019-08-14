var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')

var UserModel = sequelize.import('../../models/user')

class User{

    constructor(){

    }

    list(req, res, next){
        UserModel.findAll().then(list => {
            res.json(list)
        })
    }

    /**
     * 添加前台用户
     */
    addUserToTheme(req, res, next){
        var data = req.body
        data.password = data.password ? md5(data.password) : ''
        UserModel.findOrCreate({
            where: {
                user_no: req.body.user_no
            },
            defaults: req.body
        }).then(([instance, created]) => {
            res.json(instance)
        })
    }

    /**
     * 编辑
     */
    edit(req, res, next){
        var data = req.body
        data.password = data.password ? md5(data.password) : ''
        UserModel.update(data, {
            where: {
                id: req.body.id
            }
        }).then(([affectedCount, affectedRows]) => {
            res.json({
                code: 1,
                message: '更新成功'
            })
        })
    }

}

module.exports = new User()