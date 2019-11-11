var sequelize = require('../../db/mysql').sequelize
var Op = require('../../db/mysql').Sequelize.Op

var UserModel = sequelize.import('../../models/user')
var UserHistoryModel = sequelize.import('../../models/user_history')

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
     * @return Int
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
}

module.exports = new StatisticController()