var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var { removeDuplicateViaId } = require('../../utils/util')

var AdminModel = sequelize.import('../../models/admin')
var AccessModel = sequelize.import('../../models/access')
var ThemeModel = sequelize.import('../../models/theme')
var RoleModel = sequelize.import('../../models/role')
var AdminThemeModel = sequelize.import('../../models/admin_theme')

class Admin {

    /**
     * 登录到某个租户管理后台
     * 参数：工号，密码，租户ID
     */
    async login(req, res, next){
        var user = await AdminModel.findOne({
            where: {
                user_no: req.body.user_no,
                status: 1
            },
            include: {
                model: ThemeModel,
                through: {
                    where: { status: 1 }
                },
                where: {
                    id: req.body.theme_id
                },
                required: false
            }
        })
        
        if(!(user)){
            return res.json({
                code: 0,
                message: "找不到该用户!"
            })
        }

        if(user.super == 1){
            req.session.isSuper = true
            user = user.toJSON()
            user.themes = await ThemeModel.findAll({
                where: {
                    id: req.body.theme_id
                }
            })
            return res.json({
                code: 1,
                data: user
            })
        }

        if(user.themes.length == 0){
            return res.json({
                code: 0,
                message: "您不是该租户管理员，请联系管理员"
            })
        }

        user = user.toJSON()
        //获取该管理员可以访问权限地址，保存在session中，以便做权限校验
        var accesses = await this.__getAccessByThemeAdmin(req.body.theme_id, user.id), accessMap = []
        accesses.map(item => {
            accessMap.push(item.url)
        })
        req.session.accessMap = accessMap
        user.accesses = accesses
        res.json({
            code: 1,
            data: user,
            accesses
        })
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
                        required: false,
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
            
            
            if(adminData != null){
                adminData = adminData.toJSON()
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
                        required: false,
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
            if(roleData != null){
                roleData = roleData.toJSON()
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
            res.json({
                code: 0,
                message: error
            })
        }
    }

    async remove(req, res, next){
        console.log(req.query.id);
        
        try {
            var rows = await AdminModel.destroy({
                where: {
                    id: req.query.id
                },
                force: true
            })

            if(rows > 0){
                await AdminThemeModel.destroy({
                    where: {
                        admin_id: req.query.id,
                        theme_id: req.query.theme_id
                    },
                    force: true
                })
                res.json({
                    code: 1,
                    message: '删除成功'
                })
            }
        } catch (error) {
            res.json({
                code: 0,
                message: error
            })
        }
    }

    /**
     * 查询某个主题下所有管理员
     */
    async list(req, res, next){
        var data = await ThemeModel.findOne({
            where: {
                id: req.query.theme_id
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
     * 查询某个管理员所属角色
     */
    async listRole(req, res, next){
        try {
            var data = await AdminModel.findOne({
                where: {
                    id: req.query.id
                },
                include: [
                    {
                        model: RoleModel,
                        required: false,
                        where: {
                            theme_id: req.query.theme_id
                        }
                    }
                ]
            })
            res.json({
                code: 1,
                data: data.roles
            })
        } catch (error) {
            res.json({
                code: 0,
                data: error
            }) 
        }
    }

    /**
     * 更新管理员信息
     */
    async update(req, res, next){
        var [ affectedCount ] = await AdminModel.update(req.body, {
            where: {
                id: req.body.id,
            }
        })
        res.json({
            code: 1,
            message: affectedCount > 0 ? '更新成功' : '更新失败'
        })
    }

    /**
     * 获取该管理员所属的租户列表
     */
    async getThemeList(req, res, next){
        var adminInfo = await AdminModel.findOne({
            where: {
                id: req.query.id
            }
        })
        if(adminInfo.super){
            var themeInfo = await ThemeModel.findAll()
        }else{
            var themeInfo = await AdminModel.findOne({
                where: {
                    id: req.query.id
                },
                include: [
                    {
                        model: ThemeModel,
                        required: false
                    }
                ]
            })
            themeInfo = themeInfo.themes
        }
        res.json({
            code: 1,
            data: themeInfo
        })
    }

    /**
     * 修改管理员在某个主题下的是否启用
     */
    async changeAdminStatus(req, res, next){
        await AdminThemeModel.update(
            {
                status: req.body.status
            }, 
            {
            where: {
                theme_id: req.body.theme_id,
                admin_id: req.body.admin_id
            }
        })
        res.json({
            code: 1,
            message: '更新成功'
        })
    }

}

module.exports = new Admin()