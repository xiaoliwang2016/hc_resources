var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var ThemeModel = sequelize.import('../../models/theme')
var UserThemeModel = sequelize.import('../../models/user_theme')

class ThemeController{

    /**
     * 添加租户，超级管理员才有权限进行此行为
     */
    add(req, res, next){
        ThemeModel.findOrCreate({
            where: {
                theme_name: req.body.theme_name
            },
            defaults: req.body
        }).then(([instance, created]) => {
            res.json(instance)
        })
    }

    /**
     * 给主题添加用户
     */
    async addUser(req, res, next){
        await UserThemeModel.destroy({
            where: {
                theme_id: req.body.theme_id,
                user_id: {
                    [Op.in]: req.body.user_id
                }
            },
            force: true
        })
        var data = req.body.user_id.map(item => ({
            user_id: item,
            theme_id: req.body.theme_id
        }))
        await UserThemeModel.bulkCreate(data, {
            fields: ['theme_id', 'user_id']
        })
        res.json({
            code: 1,
            message: '分配用户到主题成功'
        })
    }
    
    /**
     * 编辑租户，超级管理员才有权限进行此行为
     */
    edit(){

    }

}

module.exports = new ThemeController()