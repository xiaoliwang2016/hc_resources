var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var AccessModel = sequelize.import('../../models/access')

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

}

module.exports = new Access()