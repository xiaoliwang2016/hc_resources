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

var UserModel = sequelize.import('../models/user')
var AdminModel = sequelize.import('../models/admin')
var RoleModel = sequelize.import('../models/role')
var ResourcesModel = sequelize.import('../models/resources')
var UserRoleModel = sequelize.import('../models/user_role')
var UserResourcesModel = sequelize.import('../models/user_resources')
var RoleResourcesModel = sequelize.import('../models/role_resources')
var ThemeModel = sequelize.import('../models/theme')
var UserThemeModel = sequelize.import('../models/user_theme')
var AdminThemeModel = sequelize.import('../models/admin_theme')

UserModel.belongsToMany(RoleModel, {
    through:{
        model: UserRoleModel,
        unique: false
    },
    foreignKey: 'user_id',
    constraints: false
})

RoleModel.belongsToMany(UserModel, {
    through:{
        model: UserRoleModel,
        unique: false
    },
    foreignKey: 'role_id',
    constraints: false
})

RoleModel.belongsToMany(ResourcesModel, {
    through:{
        model: RoleResourcesModel,
        unique: false
    },
    foreignKey: 'role_id',
    constraints: false
})

ResourcesModel.belongsToMany(RoleModel, {
    through:{
        model: RoleResourcesModel,
        unique: false
    },
    foreignKey: 'resources_id',
    constraints: false
})

UserModel.belongsToMany(ResourcesModel, {
    through:{
        model: UserResourcesModel,
        unique: false
    },
    foreignKey: 'user_id',
    constraints: false
})

ResourcesModel.belongsToMany(UserModel, {
    through:{
        model: UserResourcesModel,
        unique: false
    },
    foreignKey: 'resources_id',
    constraints: false
})

ThemeModel.belongsToMany(UserModel, {
    through: {
        model: UserThemeModel,
        unique: false
    },
    foreignKey: 'theme_id',
    constraints: false
})

UserModel.belongsToMany(ThemeModel, {
    through: {
        model: UserThemeModel,
        unique: false
    },
    foreignKey: 'user_id',
    constraints: false
})

ThemeModel.belongsToMany(AdminModel, {
    through: {
        model: AdminThemeModel,
        unique: false
    },
    foreignKey: 'theme_id',
    constraints: false
})

AdminModel.belongsToMany(ThemeModel, {
    through: {
        model: AdminThemeModel,
        unique: false
    },
    foreignKey: 'admin_id',
    constraints: false
})




async function init(){
    try {
        await sequelize.authenticate()
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

init()

module.exports.sequelize = sequelize
module.exports.Sequelize = Sequelize
