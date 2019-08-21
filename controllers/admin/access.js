var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var AccessModel = sequelize.import('../../models/access')
var RoleAccessModel = sequelize.import('../../models/role_access')
var AdminAccessModel = sequelize.import('../../models/admin_access')

class Access {

    async addRecord(req, res, next){
        var [record, created] = await AccessModel.findOrCreate({
            where: {
                name: req.body.name
            },
            defaults: req.body
        })
        if(created){
            res.json({
                code: 1,
                message: '记录添加成功',
                data: record.toJSON()
            })
        }else{
            res.json({
                code: 1,
                message: '记录已存在',
                data: record.toJSON()
            })
        }
    }

    /**
     * 分配后台权限给角色
     */
    async assignAccessToRole(req, res, next){
        await RoleAccessModel.destroy({
            where: {
                role_id: req.body.role_id,
                access_id: {
                    [Op.in]: req.body.access_id
                }
            },
            force: true
        })
        var data = req.body.access_id.map(item => ({
            access_id: item,
            role_id: req.body.role_id
        }))
        await RoleAccessModel.bulkCreate(data, {
            fields: ['access_id', 'role_id']
        })
        res.send({
            code: 1,
            message: '分配角色权限成功'
        }) 
    }

    /**
     * 分配后台权限给管理员
     */
    async assignAccessToAdmin(req, res, next){
        await AdminAccessModel.destroy({
            where: {
                admin_id: req.body.admin_id,
                access_id: {
                    [Op.in]: req.body.access_id
                },
                theme_id: req.body.theme_id
            },
            force: true
        })
        var data = req.body.access_id.map(item => ({
            access_id: item,
            admin_id: req.body.admin_id,
            theme_id: req.body.theme_id
        }))
        await AdminAccessModel.bulkCreate(data, {
            fields: ['access_id', 'admin_id', 'theme_id']
        })
        res.send({
            code: 1,
            message: '分配管理员权限成功'
        }) 
    }

}

module.exports = new Access()