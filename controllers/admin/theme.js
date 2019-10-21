var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var md5 = require('md5')

var ThemeModel = sequelize.import('../../models/theme')
var UserThemeModel = sequelize.import('../../models/user_theme')
var ResourcesModel = sequelize.import('../../models/resources')
var LinkModel = sequelize.import('../../models/link')
var UserModel = sequelize.import('../../models/user')
var AdminModel = sequelize.import('../../models/admin')
var AdminThemeModel = sequelize.import('../../models/admin_theme')

class ThemeController{

    /**
     * 添加主题，超级管理员才有权限进行此行为
     */
    async addOrUpdate(req, res, next){
        // if(!req.session.isSuper){
        //     return res.json({
        //         code: 0,
        //         message: '只有超级管理员才能进行此操作'
        //     })
        // }

        //创建或更新主题
        var theme_id = req.body.id ? req.body.id : 0
        if(req.body.id){
            await ThemeModel.update(req.body, {
                where: { id: req.body.id }
            })
        }else{
            const theme = await ThemeModel.create(req.body)
            theme_id = theme.id
        }
        
        if(!req.body.managerInfo){
            return res.json({
                code: 1,
                message: '更新成功'
            })
        }

        //把主题的管理员添加为用户
        var data = {
            user_no: req.body.managerInfo.PERNR,
            user_name: req.body.managerInfo.SNAME,
            department_desc: req.body.managerInfo.ZZ_SIJI_DESC,
            company: req.body.managerInfo.BUKRS,
            company_desc: req.body.managerInfo.BUKRS_DESC,
            job: req.body.managerInfo.PLANS,
            job_desc: req.body.managerInfo.PLANS_DESC,
            department: req.body.managerInfo.ZZ_SIJI,
            password: md5('123456')
        }

        //默认创建改用户
        const [ user ] = await UserModel.findOrCreate({
            where: {
                user_no: data.user_no
            },
            defaults: {
                ...data
            }
        })

        //建立主题用户联系
        await UserThemeModel.findOrCreate({
            where: {
                user_id: user.id,
                theme_id
            }
        })

        //默认创建为管理员
        const [ admin ] = await AdminModel.findOrCreate({
            where: {
                user_no: data.user_no
            },
            defaults: {
                ...data
            }
        })

        //建立主题管理员联系
        await AdminThemeModel.findOrCreate({
            where: {
                admin_id: admin.id,
                theme_id
            },
            defaults: {
                admin_id: admin.id,
                theme_id
            }
        })

        res.json({
            code: 1,
            message: '操作成功'
        })
    }

    /**
     * 查看所有主题
     */
    async list(req, res, next){
        var list = await ThemeModel.findAndCountAll({
            offset: (req.query.pageNo - 1) * req.query.pageSize,
            limit: parseInt(req.query.pageSize),
            order: [['update_time', 'DESC']]
        })
        res.json({
            code: 1,
            data: list
        })
    }

    /**
     * 给主题添加用户
     */
    async addUser(req, res, next){
        await UserThemeModel.destroy({
            where: {
                theme_id: req.body.theme_id,
                user_id: {
                    [Op.in]: req.body.user_id
                }
            },
            force: true
        })
        var data = req.body.user_id.map(item => ({
            user_id: item,
            theme_id: req.body.theme_id
        }))
        await UserThemeModel.bulkCreate(data, {
            fields: ['theme_id', 'user_id']
        })
        res.json({
            code: 1,
            message: '分配用户到主题成功'
        })
    }
    
    /**
     * 编辑租户，超级管理员才有权限进行此行为
     */
    edit(){
        if(!req.session.isSuper){
            return res.json({
                code: 0,
                message: '只有超级管理员才能进行此操作'
            })
        }
    }
    /**
     * 获取主题首页信息
     */
    getHomeInfo(req, res, next){
        ResourcesModel.findOne({
            where: {
                theme_id: req.query.theme_id,
                pid: -1
            },
            include: [
                {
                    model: LinkModel,
                    required: false
                }
            ]
        }).then(data => {
            res.json({
                code: 1,
                data
            })
        })
    }
}

module.exports = new ThemeController()