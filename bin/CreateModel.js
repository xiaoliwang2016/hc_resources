var SequelizeAuto = require('sequelize-auto')
var config = require('../config/mysql')
var path = require('path')



getTables().then(res => {
    //创建带有自动时间戳模型
    var autoCreateTime = new SequelizeAuto(config.database, config.user, config.pass, {
        host: config.host,
        dialect: config.dialect,
        directory: path.resolve(__dirname, '../models'),
        port: config.port,
        additional: {
            paranoid: true,
            timestamps: true,
            freezeTableName: true,
            createdAt: false,
            updatedAt: 'update_time',
            deletedAt: 'delete_time',
            underscored: true
        },
        tables: res.table
    })

    autoCreateTime.run(err => {
        if (err) throw err
    })
    

    //创建带有自动时间戳模型
    var autoCreate = new SequelizeAuto(config.database, config.user, config.pass, {
        host: config.host,
        dialect: config.dialect,
        directory: path.resolve(__dirname, '../models'),
        port: config.port,
        additional: {
            timestamps: false,
            freezeTableName: true,
            underscored: true
        },
        tables: res.middle_table
    })

    autoCreate.run(function (err) {
        if (err) throw err
        console.log('创建成功');
    })
})




async function getTables() {
    var NoNeedUpdateTables = ['employee']
    const mysql = require('mysql2/promise');
    // create the connection
    const connection = await mysql.createConnection({
        host: config.host, 
        user: config.user, 
        password: config.pass, 
        database: config.database
    })
    // query database
    const [ tables ] = await connection.execute("show tables")
    //中间表不需要自动时间戳
    const table = [], middle_table = [] 
    for (let index = 0; index < tables.length; index++) {
        let tableName = tables[index].Tables_in_hc_resources
        var [ fields ] = await connection.execute(`SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME = '${tableName}'`)
        fields = fields.map(field => field.COLUMN_NAME)
        if(fields.indexOf('update_time') == -1 && NoNeedUpdateTables.indexOf(tableName) == -1){
            middle_table.push(tableName)
        }else if(NoNeedUpdateTables.indexOf(tableName) == -1){
            table.push(tableName)
        }
    }
    return {
        table,
        middle_table
    }
}
