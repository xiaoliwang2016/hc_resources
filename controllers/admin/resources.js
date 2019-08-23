var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var { build_tree } = require('../../utils/util')

var ResourcesModel = sequelize.import('../../models/resources')
var UserResourcesModel = sequelize.import('../../models/user_resources')
var RoleResourcesModel = sequelize.import('../../models/role_resources')

class ResourcesController{

    /**
     * 树状展示
     */
    list(req, res, next){
        ResourcesModel.findAll({
            where: {
                theme_id: req.query.theme_id
            },
            order: [["resources_order", "DESC"]],
            raw: true
        }).then(list => {
            list = build_tree(list, 0)
            res.json({
                code: 1,
                data: list
            })
        })
    }

    /**
     * 增加链接
     */
    add(req, res, next){
        ResourcesModel.findOrCreate({
            where: {
                pid: req.body.pid,
                theme_id: req.body.theme_id,
                menu_title: req.body.menu_title
            },
            defaults: req.body
        }).then(([instance, created]) => {
            if(created){
                res.json({
                    code: 1,
                    data: instance
                })
            }else{
                res.json({
                    code: 0,
                    message: '该标题已创建'
                })
            }
        })
    }

    /**
     * 编辑
     */
    edit(req, res, next){
        ResourcesModel.update(req.body, {
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
        ResourcesModel.destroy({
            where: {
                id: req.body.id
            }
        }).then(affectedRows => {
            res.json({
                code: 1,
                message: '删除成功'
            })
        })
    }

    /**
     * 分配资源给用户
     */
    async assignResourcesToUser(req, res, next){
        await UserResourcesModel.destroy({
            where: {
                user_id: req.body.user_id,
                resources_id: {
                    [Op.in]: req.body.resources_id
                }
            },
            force: true
        })
        var data = req.body.resources_id.map(item => ({
            resources_id: item,
            user_id: req.body.user_id
        }))
        await UserResourcesModel.bulkCreate(data, {
            fields: ['resources_id', 'user_id']
        })
        res.send('ok')
    } 

    /**
     * 分配资源给角色
     */
    async assignResourcesToRole(req, res, next){
        await RoleResourcesModel.destroy({
            where: {
                role_id: req.body.role_id,
                resources_id: {
                    [Op.in]: req.body.resources_id
                }
            },
            force: true
        })
        var data = req.body.resources_id.map(item => ({
            resources_id: item,
            role_id: req.body.role_id
        }))
        await RoleResourcesModel.bulkCreate(data, {
            fields: ['resources_id', 'role_id']
        })
        res.send({
            code: 1,
            message: '分配角色权限成功'
        })
    }

}

module.exports = new ResourcesController()