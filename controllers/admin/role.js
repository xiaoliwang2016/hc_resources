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
        var list = []
        var counter = await UserRoleModel.findAll({
            attributes: ['role_id', [sequelize.fn('COUNT', sequelize.col('role_id')), 'count']],
            group: 'role_id'
        })
        counter.map(item => {
            item = item.toJSON()
            list[item.role_id] = item.count
        })

        var data = await RoleModel.findAll({
            where: {
                theme_id: req.query.theme_id,
                role_group: req.query.role_group
            },
            include: [
                {
                    model: ResourcesModel,
                    required: false,
                    attributes: ['id','menu_title','type'] 
                }
            ]
        })
        data = data.map( item => item.toJSON() )
        data.map( item => item.count = list[item.id] || 0 )
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

    async delete(req, res, next){
        var data = await UserRoleModel.findAll({
            where: {
                role_id: req.body.role_id
            }
        })
        if(data.length > 0){
            return res.json({
                code: 0,
                message: '改角色下尚有用户，请重新操作'
            })
        }
        await RoleModel.destroy({
            where: {
                id: req.body.role_id
            },
            force: true
        })
        res.json({
            code: 1,
            message: '删除成功'
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
        var roles = await RoleModel.findAll({
            where: {
                theme_id: req.body.theme_id,
                role_group: 0
            },
            attributes: ['id']
        })
        roles = roles.reduce((acculator, val) => { acculator.push(val.id); return acculator }, [])
        //先删除
        await UserRoleModel.destroy({
            where: {
                user_id: req.body.user_id,
                role_id: {
                    [Op.in]: roles
                }
            },
            force: true
        })

        var data = req.body.role_id.map(item => ({
            role_id: item,
            user_id: req.body.user_id
        }))
        //后创建
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