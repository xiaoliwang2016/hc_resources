var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var ThemeModel = sequelize.import('../../models/theme')
var UserThemeModel = sequelize.import('../../models/user_theme')

class ThemeController{

    /**
     * 添加主题，超级管理员才有权限进行此行为
     */
    addOrUpdate(req, res, next){
        if(!req.session.isSuper){
            return res.json({
                code: 0,
                message: '只有超级管理员才能进行此操作'
            })
        }
        ThemeModel.upsert({
            ...req.body
        }).then(created => {
            res.json({
                code: 1,
                message: created ? '创建成功' : '更新成功'
            })
        })
    }

    /**
     * 查看所有主题
     */
    async list(req, res, next){
        var list = await ThemeModel.findAndCountAll({
            offset: (req.query.pageNo - 1) * req.query.pageSize,
            limit: parseInt(req.query.pageSize),
            order: [['update_time', 'DESC']]
        })
        res.json({
            code: 1,
            data: list
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
        if(!req.session.isSuper){
            return res.json({
                code: 0,
                message: '只有超级管理员才能进行此操作'
            })
        }
    }

}

module.exports = new ThemeController()