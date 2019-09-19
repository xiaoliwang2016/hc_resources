var sequelize = require('../../db/mysql').sequelize

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
                        required: false
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
     * 切换主题
     */
    switchTheme(req, res, next){

    }

}

module.exports = new UserController()