var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var UserModel = sequelize.import('../../models/user')
var UserHistoryModel = sequelize.import('../../models/user_history')
var ResourcesModel = sequelize.import('../../models/resources')

class StatisticController {
    
    async addUserHistory(req, res, next){
        await UserHistoryModel.create(req.query)
        res.json({
            code: 1,
            message: '插入记录'
        })
    }

    /**
     * 获取某个主题下过去7日浏览次数
     */
    async getViewsViaThemeId(req, res, next){
        var today = new Date().getTime()
        var start = req.query.start ? req.query.start : new Date(  today - 24*60*60*1000*6 ).toLocaleDateString(),
        end = req.query.end ? req.query.end : new Date( today + 24*60*60*1000 ).toLocaleDateString()
        var condition = `update_time > '${start}' AND update_time < '${end}' `
        if(req.query.theme_id){
            condition += ` AND theme_id = ${req.query.theme_id} `
        }
        var sql = `
            SELECT date, count(*) as count from
                (select distinct user_id, theme_id, DATE_FORMAT( update_time, '%Y-%m-%d' ) as date 
                    FROM hc_resources.user_history 
                    where 
                        ${condition}
                ) as newtable
            GROUP BY
                date	
            ORDER BY
	            date ASC
        `
        
        sequelize.query(sql).spread((data, metadata) => {
            var result = [
                {date: new Date(  today - 24*60*60*1000*6 ).toLocaleDateString(), count : 0},
                {date: new Date(  today - 24*60*60*1000*5 ).toLocaleDateString(), count : 0},
                {date: new Date(  today - 24*60*60*1000*4 ).toLocaleDateString(), count : 0},
                {date: new Date(  today - 24*60*60*1000*3 ).toLocaleDateString(), count : 0},
                {date: new Date(  today - 24*60*60*1000*2 ).toLocaleDateString(), count : 0},
                {date: new Date(  today - 24*60*60*1000*1 ).toLocaleDateString(), count : 0},
                {date: new Date(  today ).toLocaleDateString(), count : 0}
            ]
            data.forEach((item) => {
                result.forEach((dateInfo, index) => {
                    if(dateInfo.date == item.date){
                        result[index].count = item.count 
                    }
                })
            })
            res.json({
                code: 1,
                data: result
            })
        })
    }

    /**
     * 获取某个主题下访问记录
     */
    async getAccessRecordViaThemeId(req, res, next){
        var condition = {},
        pageNo = req.query.pageNo || 1,
        pageSize = req.query.pageSize || 10

        for (const key in req.query) {
            if(['user_id', 'theme_id', 'resources_id'].indexOf(key) != -1){
                condition[key] = req.query[key]
            }
        }
        var records = await UserHistoryModel.findAndCountAll({
            where: condition,
            include: [
                {
                    model: UserModel,
                    attributes: ['id', 'user_no', 'user_name']
                },
                {
                    model: ResourcesModel,
                    attributes: ['id', 'menu_title']
                }
            ],
            attributes: ['theme_id', ['update_time', 'time']],
            order: [
                ['update_time', 'DESC']
            ],
            offset: (pageNo - 1) * pageSize,
            limit: pageSize
        })
        res.json({
            code: 1,
            data: records
        })
    }
}

module.exports = new StatisticController()