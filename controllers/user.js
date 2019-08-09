var sequelize = require('../db/mysql').sequelize
var Sequelize = require('../db/mysql').Sequelize

var UserModel = sequelize.import('../models/user')

class User{

    constructor(){

    }

    /**
     * 添加用户
     */
    add(req, res, next){

    }

}

module.exports = new User()