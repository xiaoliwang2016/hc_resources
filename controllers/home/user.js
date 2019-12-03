var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op
var UserModel = sequelize.import('../../models/user')
var ThemeModel = sequelize.import('../../models/theme')

class UserController{

    /**
     * 列出该用户所有主题
     */
    async listTheme(req, res, next){
        var data,
        user = await UserModel.findOne({
            where: {
                id: req.query.id
            }
        })
        if(user.admin == 1){
            data = await ThemeModel.findAll()
        }else{
            var list = await UserModel.findOne({
                where: {
                    id: req.query.id
                },
                include: [
                    {
                        model: ThemeModel,
                        required: false,
                        through: {
                            where: { status: 1 }
                        },
                        where: { status: 1 }
                    }
                ]
            })
            data = list.toJSON().themes
        }

        res.json({
            code: 1,
            data
        })
    }

    /**
     * 通过工号/姓名获取用户信息
     */
    async getUserDetail(req, res, next){
        var condition = {
            [Op.or]: [
                req.query.user_no ? { user_no: req.query.user_no } : {},
                req.query.user_name ? { user_name: { [Op.like]: `%${req.query.user_name}%` } } : {}
            ]
        }

        var data = await UserModel.findAll({
            where: condition
        })
        res.json({
            code: 1,
            data
        })
    }

    /**
     * 切换主题
     */
    switchTheme(req, res, next){

    }


}

module.exports = new UserController()