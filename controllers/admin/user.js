var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')

var UserModel = sequelize.import('../../models/user')
var UserThemeModel = sequelize.import('../../models/user_theme')

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
    async addUserToTheme(req, res, next){
        var data = req.body
        data.password = data.password ? md5(data.password) : ''
        try {
            var [instance, created] = await UserModel.findOrCreate({
                where: {
                    user_no: req.body.user_no
                },
                defaults: req.body
            })
            if(created){
                await UserThemeModel.findOrCreate({
                    where: {
                        user_id: instance.id,
                        theme_id: req.body.theme_id
                    }
                })
            }
            res.json({
                code: 1,
                message: '创建前台用户成功'
            })
        } catch (error) {
            res.json({
                code: 0,
                message: error
            })
        }

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