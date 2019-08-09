const Sequelize = require('sequelize')
const config = require('../config/mysql')

const sequelize = new Sequelize(config.database, config.user, config.pass, {
    host: config.host,
    dialect: config.dialect,
    operatorsAliases: false,
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
})

sequelize
    .authenticate()
    .then(() => {
        console.log('Connection has been established successfully.');
    })
    .catch(err => {
        console.error('Unable to connect to the database:', err);
    })

module.exports.sequelize = sequelize
module.exports.Sequelize = Sequelize
