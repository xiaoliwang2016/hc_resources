var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')

var AdminModel = sequelize.import('../../models/admin')
var AdminThemeModel = sequelize.import('../../models/admin_theme')

class Admin {

    /**
     * 添加管理员
     */
    async addAdminToTheme(req, res, next){
        var data = req.body
        data.password = data.password ? md5(data.password) : ''
        try {
            var [instance, created] = await AdminModel.findOrCreate({
                where: {
                    user_no: req.body.user_no
                },
                defaults: data
            })
            await AdminThemeModel.findOrCreate({
                where: {
                    admin_id: instance.id,
                    theme_id: req.body.theme_id
                },
                defaults: {
                    admin_id: instance.id,
                    theme_id: req.body.theme_id
                }
            })
            res.json({
                code: 1,
                message: '添加管理员成功'
            })
        } catch (error) {
            res.send(error)
        }
    } 

}

module.exports = new Admin()