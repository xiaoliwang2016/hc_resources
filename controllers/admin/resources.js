var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var { build_tree } = require('../../utils/util')

var ResourcesModel = sequelize.import('../../models/resources')
var UserResourcesModel = sequelize.import('../../models/user_resources')
var RoleResourcesModel = sequelize.import('../../models/role_resources')
var LinkModel = sequelize.import('../../models/link')

class ResourcesController{

    /**
     * 树状展示
     */
    async list(req, res, next){
        var Resources = await ResourcesModel.findAll({
            where: {
                theme_id: req.query.theme_id
            },
            order: [["resources_order", "DESC"]],
            include: [
                {
                    model: LinkModel,
                    required: false
                }
            ]
        })
        Resources = Resources.map(item => (item.toJSON()))
        Resources.map((resources, index) => {
            resources.links.sort((a, b) => {
                return a.order - b.order
            })
        })
        if(req.query.tree){
            Resources = build_tree(Resources, 0)
        }
        res.json({
            code: 1,
            data: Resources
        })
    }

    async getDetail(req, res, next){
        var Resources = await ResourcesModel.findOne({
            where: {
                id: req.query.id
            },
            include: [
                {
                    model: LinkModel,
                    required: false
                }
            ]
        })
        res.json({
            code: 1,
            data: Resources
        })
    }

    /**
     * 创建/更新
     */
    async addOrUpdate(req, res, next){
        var resources_id
        if(req.body.id){
            try {
                resources_id = req.body.id
                await LinkModel.destroy({
                    where: { resources_id: req.body.id },
                    force: true
                })
                await ResourcesModel.update(req.body, {
                    where: { id: req.body.id }
                })
            } catch (error) {
                res.json({
                    code: 0,
                    message: error
                })
            }
        }else{
            try {
                const instance = await ResourcesModel.create({
                    ...req.body
                })
                resources_id = instance.id
            } catch (error) {
                res.json({
                    code: 0,
                    message: error
                })
            }
        }
        if(req.body.links.length > 0){
            req.body.links.map((link, index) => {
                req.body.links[index].order = index
                req.body.links[index].resources_id = resources_id
            })
            try {
                await LinkModel.bulkCreate(req.body.links)
            } catch (error) {
                res.status(500).json({
                    code: 0,
                    message: error.original.sqlMessage
                })
            }
        }
        res.json({
            code: 1,
            message: '操作成功'
        })
    }

    deleteLink(){

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
        var resources = await ResourcesModel.findAll({
            where: {
                theme_id: req.body.theme_id
            },
            fields: ['id']
        }), resourcesIds = []
        resources.map(item => { resourcesIds.push(item.id) })        
        await UserResourcesModel.destroy({
            where: {
                user_id: req.body.user_id,
                resources_id: {
                    [Op.in]: resourcesIds
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
        res.json({
            code: 1,
            message: '权限资源给用户成功'
        })
    } 

    /**
     * 分配资源给角色
     */
    async assignResourcesToRole(req, res, next){
        await RoleResourcesModel.destroy({
            where: {
                role_id: req.body.role_id
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
            message: '分配资源给角色成功'
        })
    }

}

module.exports = new ResourcesController()