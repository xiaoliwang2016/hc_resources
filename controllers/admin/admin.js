var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')
var { removeDuplicateViaId } = require('../../utils/util')

var AdminModel = sequelize.import('../../models/admin')
var AccessModel = sequelize.import('../../models/access')
var ThemeModel = sequelize.import('../../models/theme')
var RoleModel = sequelize.import('../../models/role')
var AdminThemeModel = sequelize.import('../../models/admin_theme')

class Admin {

    /**
     * 登录
     */
    async login(req, res, next){
        var user = await AdminModel.findOne({
            where: {
                user_no: req.body.user_no,
                password: md5(req.body.password)
            },
            include: {
                model: ThemeModel
            }
        })

        if(user == null){
            return res.json({
                code: 0,
                message: "账号密码不正确"
            })
        }
        user = user.toJSON()
        
        if(user.super){
            req.session.isSuper = true
            return res.json({
                code: 1,
                message: "超级管理员登录成功"
            })
        }
        var themes = user.themes
        if(!themes.length){
            return res.json({
                code: 0,
                message: "该管理员没有分配主题"
            })
        }
        //获取该管理员可以访问权限地址，保存在session中，以便做权限校验
        var accesses = await this.__getAccessByThemeAdmin(1, user.id), accessMap = []
        accesses.map(item => {
            accessMap.push(item.url)
        })
        req.session.accessMap = accessMap
        user.accesses = accesses
        res.json(user)
    }

    /**
     * 退出
     */
    logout(req, res, next){
        req.session.destroy(err => {
            res.json({
                code: 1,
                message: '退出登录成功'
            })
        })
    }

    /**
     * 指定 theme_id 和 admin_id ，获得该管理员在特定主题下所有权限
     */
    __getAccessByThemeAdmin(theme_id, admin_id){
        var accesses = []

        return new Promise(async (resolve, reject) => {
            //获取该管理员的权限，放入 accesses 中
            var adminData = await AdminModel.findOne({
                where: {
                    id: admin_id
                },
                include: [
                    {
                        model: AccessModel,
                        required: true,
                        attributes: {
                            exclude: ['update_time']
                        },
                        through: {
                            where: {
                                theme_id
                            }
                        }
                    }
                ]
            })
            adminData = adminData.toJSON()
            if(adminData != null){
                accesses = accesses.concat(adminData.accesses)
            }
            //获取该用户对应角色的所有权限，放入 resources 中
            var roleData = await AdminModel.findOne({
                where: {
                    id: admin_id
                },
                include: [
                    {
                        model: RoleModel,
                        where: {
                            status: 1
                        },
                        include: [
                            {
                                model: AccessModel,
                                attributes: {
                                    exclude: ['update_time']
                                }
                            }
                        ]
                    },
                ]
            })
            roleData = roleData.toJSON()
            if(roleData != null){
                roleData.roles.forEach(role => {
                    accesses = accesses.concat(role.accesses)
                })
            }
            //去除重复项
            accesses = removeDuplicateViaId(accesses)
            resolve(accesses)
        })
    }

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

    /**
     * 查询某个主题下所有管理员
     */
    async list(req, res, next){
        var data = await ThemeModel.findOne({
            where: {
                id: req.body.theme_id
            },
            include: [
                {
                    model: AdminModel
                }
            ]
        })
        res.json({
            code: 1,
            data: data ? data.admins : data
        })
    }

    /**
     * 更新管理员信息
     */
    async update(req, res, next){
        var result = await AdminModel.update(req.body, {
            where: {
                id: req.body.id,
            }
        })
        res.json(result)
    }

}

module.exports = new Admin()