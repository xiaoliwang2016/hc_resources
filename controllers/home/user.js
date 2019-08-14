var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')
var { build_tree } = require('../../utils/util')

var UserModel = sequelize.import('../../models/user')
var RoleModel = sequelize.import('../../models/role')
var ResourcesModel = sequelize.import('../../models/resources')
var ThemeModel = sequelize.import('../../models/theme')

class UserController{

    /**
     * 登录  返回： 用户信息  用户能访问页面集合
     * 
     */
    async login(req, res, next){
        var user = await UserModel.findOne({
            where: {
                user_no: req.body.user_no,
                password: md5(req.body.password)
            },
            include: {
                model: ThemeModel
            }
        })
        var themes = user.toJSON().themes
        if(user == null){
            res.json({
                code: 0,
                message: "账号密码不正确"
            })
        }
        if(!themes.length){
            res.json({
                code: 0,
                message: "该用户没有分配主题"
            })
        }

        user = await UserModel.findOne({
            where: {
                user_no: req.body.user_no,
                password: md5(req.body.password)
            },
            attributes: {
                exclude: ['update_time', 'status']
            },
            include: [
                {
                    model: RoleModel,
                    where: {
                        role_group: 0
                    },
                    attributes: {
                        exclude: ['update_time', 'status']
                    },
                    include: [
                        {
                            model: ResourcesModel,
                            // where: {
                            //     theme_id: themes[0].id
                            // },
                            attributes: {
                                exclude: ['update_time', 'status', "user_id", "public", "type"]
                            },
                            order: ['resources_order', 'DESC']
                        }
                    ]
                },
                {
                    model: ResourcesModel,
                    // where: {
                    //     theme_id: themes[0].id
                    // },
                    attributes: {
                        exclude: ['update_time', 'status', "user_id", "public", "type"]
                    },
                    order: ['resources_order', 'DESC']
                }
            ]
        })
        user.last_login = new Date()
        await user.save()
        //合并用户拥有的页面  生成树状结构
        var user = user.toJSON(), resources = []
        user.roles.forEach(item => {
            resources = resources.concat(item.resources)
        })
        resources = resources.concat(user.resources)
        user.resources = build_tree(resources, 0)
        delete user.roles
        user.themes = themes
        res.json({
            code: 1,
            message: "登录成功",
            data: user
        })
    }

}

module.exports = new UserController()