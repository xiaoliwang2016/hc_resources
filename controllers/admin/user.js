var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')
var { build_tree, removeDuplicateViaId } = require('../../utils/util')

var UserModel = sequelize.import('../../models/user')
var UserThemeModel = sequelize.import('../../models/user_theme')
var ThemeModel = sequelize.import('../../models/theme')
var ResourcesModel = sequelize.import('../../models/resources')
var RoleModel = sequelize.import('../../models/role')
var LinkModel = sequelize.import('../../models/link')

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
                    model: UserModel,
                    required: false,
                    through: {
                        where: req.query.admin == 1 ? true : { status: 1 }
                    }
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
    async listResources(req, res, next){
        var data
        //房主&超管可以查看该主题所有资源
        if(req.query.isOwner == 1){
            var list = await ResourcesModel.findAll({
                where: {
                    theme_id: req.query.theme_id
                },
                order: [["resources_order", "DESC"]],
                include: [
                    {
                        model: LinkModel,
                    }
                ]
            })
            data = list.map(item => item.toJSON())
        }else{
            var resources = []
            //找出该用户对应角色下所有权限
            var roles = await UserModel.findOne({
                where: {
                    id: req.query.user_id
                },
                include: [
                    {
                        model: RoleModel,
                        required: false,
                        where: {
                            role_group: 0
                        },
                        include: [
                            {
                                model: ResourcesModel,
                                required: false,
                                where: {
                                    theme_id: req.query.theme_id
                                },
                                include: [
                                    {
                                        model: LinkModel,
                                        order: ["order"]
                                    }
                                ]
                            }
                        ]
                    }
                ]
            })
            roles = roles.toJSON().roles
            roles.map(role => {
                resources = resources.concat(role.resources)
            })
            //找出改用户下所有权限
            var list = await UserModel.findOne({
                where: {
                    id: req.query.user_id
                },
                include: [
                    {
                        model: ResourcesModel,
                        required: false,
                        where: {
                            theme_id: req.query.theme_id
                        },
                        include: [
                            {
                                model: LinkModel,
                                order: ["order"]
                            }
                        ]
                    }
                ]
            })
            //合并、去重
            resources = resources.concat(list.toJSON().resources)
            resources = removeDuplicateViaId(resources)
            data = resources.sort((a, b) => (b.resources_order - a.resources_order))
        }
        data.map((resources, index) => {
            resources.links.sort((a, b) => {
                return a.order - b.order
            })
        })
        if(req.query.tree){
            data = build_tree(data, 0)
        }
        res.json({
            code: 1,
            data
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
        data.password = md5('123')
        try {
            var [instance, created] = await UserModel.findOrCreate({
                where: {
                    user_no: req.body.user_no
                },
                defaults: req.body
            })
            await UserThemeModel.findOrCreate({
                where: {
                    user_id: instance.id,
                    theme_id: req.body.theme_id
                },
                defaults: {
                    user_id: instance.id,
                    theme_id: req.body.theme_id
                }
            })
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
     * 修改用户在某个主题下的是否启用
     */
    async changeUserStatus(req, res, next){
        await UserThemeModel.update(
            {
                status: req.body.status
            }, 
            {
            where: {
                theme_id: req.body.theme_id,
                user_id: req.body.user_id
            }
        })
        res.json({
            code: 1,
            message: '更新成功'
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

    /**
     * 删除
     */
    delete(req, res, next){
        UserThemeModel.destroy({
            where: {
                user_id: req.body.user_id,
                theme_id: req.body.theme_id
            },
            force: true
        }).then(() => {
            res.json({
                code: 1,
                message: '删除成功'
            })
        })
    }

}

module.exports = new User()