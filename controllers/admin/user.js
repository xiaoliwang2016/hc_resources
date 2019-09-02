var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')
var { build_tree } = require('../../utils/util')

var UserModel = sequelize.import('../../models/user')
var UserThemeModel = sequelize.import('../../models/user_theme')
var ThemeModel = sequelize.import('../../models/theme')
var ResourcesModel = sequelize.import('../../models/resources')
var RoleModel = sequelize.import('../../models/role')

class User{

    constructor(){

    }

    /**
     * 查询某个主题下所有用户
     */
    async list(req, res, next){
        var data = await ThemeModel.findOne({
            where: {
                id: req.query.theme_id
            },
            include: [
                {
                    model: UserModel
                }
            ]
        })
        res.json({
            code: 1,
            data: data ? data.users : data
        })
    }

    /**
     * 查询某个用户在某个主题下拥有的所有资源ID
     */
    listResources(req, res, next){
        UserModel.findOne({
            where: {
                id: req.query.id
            },
            include: [
                {
                    model: ResourcesModel,
                    required: false,
                    where: {
                        theme_id: req.query.theme_id
                    }
                }
            ]
        }).then(list => {
            var data = list.toJSON()
            data = data.resources
            if(req.query.tree){
                data = build_tree(data, 0)
            }
            res.json({
                code: 1,
                data
            })
        })
    }
    /**
     * 查询某个用户拥有角色ID
     */
    listRole(req, res, next){
        UserModel.findOne({
            where: {
                id: req.query.id
            },
            include: [
                {
                    model: RoleModel,
                    required: false,
                    attributes: ['id','role_name']
                }
            ]
        }).then(list => {
            var data = []
            list.roles.map(item => {
                data.push(item.id)
            })
            res.json({
                code: 1,
                data
            })
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