var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var RoleModel = sequelize.import('../../models/role')
var UserRoleModel = sequelize.import('../../models/user_role')
var AdminRoleModel = sequelize.import('../../models/admin_role')

class RoleController{

    add(req, res, next){
        RoleModel.findOrCreate({
            where: {
                role_name: req.body.role_name,
                role_group: req.body.role_group
            },
            defaults: req.body
        }).then(([instance, created]) => {
            res.json(instance)
        })
    }
    /**
     * 给前台用户分配前台角色
     */
    async assignRoleToUser(req, res, next){
        await UserRoleModel.destroy({
            where: {
                user_id: req.body.user_id,
                role_id: {
                    [Op.in]: req.body.role_id
                }
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
                admin_id: req.body.admin_id,
                role_id: {
                    [Op.in]: req.body.role_id
                }
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