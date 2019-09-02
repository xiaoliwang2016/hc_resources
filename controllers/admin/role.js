var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var RoleModel = sequelize.import('../../models/role')
var UserModel = sequelize.import('../../models/user')
var UserRoleModel = sequelize.import('../../models/user_role')
var AdminRoleModel = sequelize.import('../../models/admin_role')
var ResourcesModel = sequelize.import('../../models/resources')

class RoleController{

    /**
     * 查询某个主题下所有角色
     */
    async list(req, res, next){
        var data = await RoleModel.findAll({
            where: {
                theme_id: req.query.theme_id,
                role_group: req.query.role_group
            }
        })
        res.json({
            code: 1,
            data
        })
    }

    addOrUpdate(req, res, next){
        RoleModel.upsert({
            ...req.body
        }).then(created => {
            res.json({
                code: 1,
                message: created ? '创建成功' : '更新成功'
            })
        })
    }

    /**
     * 获取某个角色下所有资源
     */
    listResources(req, res, next){
        RoleModel.findOne({
            where: {
                id: req.query.role_id
            },
            include: [
                {
                    model: ResourcesModel,
                    required: false,
                    attributes: ['id','menu_title','type']
                }
            ]
        }).then(list => {
            res.json({
                code: 1,
                data: list.resources
            })
        })
    }

    /**
     * 查询某个角色下所有的用户
     */
    listUser(req, res, next){
        RoleModel.findOne({
            where: {
                id: req.query.role_id
            },
            include: [
                {
                    model: UserModel,
                    required: false
                }
            ]
        }).then(list => {
            res.json({
                code: 1,
                data: list.resources
            })
        })
    }

    /**
     * 给前台用户分配前台角色
     */
    async assignRoleToUser(req, res, next){
        await UserRoleModel.destroy({
            where: {
                user_id: req.body.user_id
            },
            force: true
        })
        var data = req.body.role_id.map(item => ({
            role_id: item,
            user_id: req.body.user_id
        }))
        await UserRoleModel.bulkCreate(data, {
            fields: ['role_id', 'user_id']
        })
        res.json({
            code: 1,
            message: '分配用户角色成功'
        })
    }
    /**
     * 给后台用户分配后台角色
     */
    async assignRoleToAdmin(req, res, next){
        await AdminRoleModel.destroy({
            where: {
                admin_id: req.body.admin_id
            },
            force: true
        })
        var data = req.body.role_id.map(item => ({
            role_id: item,
            admin_id: req.body.admin_id
        }))
        await AdminRoleModel.bulkCreate(data, {
            fields: ['role_id', 'admin_id']
        })
        res.json({
            code: 1,
            message: '分配管理员角色成功'
        })
    }

}

module.exports = new RoleController()