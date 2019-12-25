var sequelize = require('../../db/mysql').sequelize

var RecordModel = sequelize.import('../../models/record')

class Record{

    constructor(){

    }

    /**
     * 插入记录
     */
    async addRecord(req, res, next){
        await RecordModel.create({
            ...req.body
        })
        res.json({
            code: 1,
            message: 'ok'
        })
    }

    /**
     * 查询记录
     */
    async getRecord(req, res, next){
        var condition = {},
        pageNo = req.query.pageNo || 1,
        pageSize = req.query.pageSize || 10

        for (const key in req.query) {
            if(['user_no', 'theme_id'].indexOf(key) != -1){
                condition[key] = req.query[key]
            }
        }

        var records = await RecordModel.findAndCountAll({
            where: condition,
            order: [
                ['update_time', 'DESC']
            ],
            offset: (pageNo - 1) * pageSize,
            limit: Number(pageSize)
        })

        res.json({
            code: 1,
            data: records
        })
    }

}

module.exports = new Record()