var sequelize = require('../../db/mysql').sequelize
var md5 = require('md5')
var request = require('request')
var { build_tree } = require('../../utils/util')

var UserModel = sequelize.import('../../models/user')
var ResourcesModel = sequelize.import('../../models/resources')
var ThemeModel = sequelize.import('../../models/theme')
var RoleModel = sequelize.import('../../models/role')

class PermissionController{

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

        if(user == null){
            res.json({
                code: 0,
                message: "账号密码不正确"
            })
        }

        var data = user.toJSON()

        //非管理员默认返回所属的第一个主题
        if(user.admin == 1){
            data.themes = await ThemeModel.findAll()
            var resources = await ResourcesModel.findAll({
                where: {
                    theme_id: req.body.theme_id ? req.body.theme_id : data.themes[0].id
                }
            })
        }else{
            var themes = data.themes
            if(!themes.length){
                res.json({
                    code: 0,
                    message: "该用户没有分配主题,请联系管理员"
                })
            }

            //查出该用户对应主题信息，默认取一个主题
            var defaultThemeID = req.body.theme_id ? req.body.theme_id : data.themes[0].id
            var resources = await this.getResourcesByThemeUser(user.id, defaultThemeID)
        }
        
        data.resources = build_tree(resources, 0)

        res.json({
            code: 1,
            message: "登录成功",
            data
        })
    }

    authenticate(req, res, next){
        request({
            url: 'http://192.172.1.240/trusted',
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
            },
            qs: {
                username: req.body.account,
                server: 'http://192.172.1.240',
                target_site: 'HC_Tableau_Server',
                submittable: 'Get Ticket',
                ip: req.body.ip
            }
        },function (error, response, body) {
            if(error){
                res.json({
                    code: 0,
                    message: '申请访问权限失败，请联系管理员'
                })
            }else{
                res.json({
                    code: 1,
                    data: body
                })
            }
        })
    }

    /**
     * 指定 theme_id 和 user_id ，获得该用户在特定主题下所有资源
     */
    getResourcesByThemeUser(user_id, theme_id){
        var resources = []

        return new Promise(async (resolve, reject) => {
            //获取该用户的权限，放入 resources 中
            var userData = await UserModel.findOne({
                where: {
                    id: user_id
                },
                include: [
                    {
                        model: ResourcesModel,
                        required: false,
                        where: {
                            theme_id
                        },
                        attributes: {
                            exclude: ['update_time', 'status', "user_id", "public", "type"]
                        },
                        order: ['resources_order', 'DESC']
                    }
                ]
            })
            userData = userData.toJSON()
            if(userData != null){
                resources = resources.concat(userData.resources)
            }
            //获取该用户对应角色的所有权限，放入 resources 中
            var roleData = await UserModel.findOne({
                where: {
                    id: user_id
                },
                include: [
                    {
                        model: RoleModel,
                        required: false,
                        where: {
                            // theme_id,
                            status: 1
                        },
                        attributes: {
                            exclude: ['update_time', 'status']
                        },
                        include: [
                            {
                                model: ResourcesModel,
                                required: false,
                                attributes: {
                                    exclude: ['update_time', 'status', "user_id", "public", "type"]
                                },
                                order: ['resources_order', 'DESC']
                            }
                        ]
                    },
                ]
            })
            roleData = roleData.toJSON()
            if(roleData != null){
                roleData.roles.forEach(role => {
                    resources = resources.concat(role.resources)
                })
            }
            resolve(resources)
        })
    }


}

module.exports = new PermissionController()