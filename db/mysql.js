const Sequelize = require('sequelize')
const config = require('../config/mysql')

const sequelize = new Sequelize(config.database, config.user, config.pass, {
    host: config.host,
    dialect: config.dialect,
    operatorsAliases: null,
    logging: true,
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
var AccessModel = sequelize.import('../models/access')
var AdminAccessModel = sequelize.import('../models/admin_access')
var RoleAccessModel = sequelize.import('../models/role_access')
var AdminRoleModel = sequelize.import('../models/admin_role')
var LinkModel = sequelize.import('../models/link')

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

AccessModel.belongsToMany(RoleModel, {
    through: {
        model: RoleAccessModel,
        unique: false
    },
    foreignKey: 'access_id',
    constraints: false
})

RoleModel.belongsToMany(AccessModel, {
    through: {
        model: RoleAccessModel,
        unique: false
    },
    foreignKey: 'role_id',
    constraints: false
})

AccessModel.belongsToMany(AdminModel, {
    through: {
        model: AdminAccessModel,
        unique: false
    },
    foreignKey: 'access_id',
    constraints: false
})

AdminModel.belongsToMany(AccessModel, {
    through: {
        model: AdminAccessModel,
        unique: false
    },
    foreignKey: 'admin_id',
    constraints: false
})

RoleModel.belongsToMany(AdminModel, {
    through: {
        model: AdminRoleModel,
        unique: false
    },
    foreignKey: 'role_id',
    constraints: false
})

AdminModel.belongsToMany(RoleModel, {
    through: {
        model: AdminRoleModel,
        unique: false
    },
    foreignKey: 'admin_id',
    constraints: false
})

ResourcesModel.hasMany(LinkModel, {
    foreignKey:'resources_id', sourceKey:'id', constraints: false
})

// LinkModel.belongsTo(ResourcesModel, {
//     foreignKey:'resources_id', targetKey:'id', as: 'Resources'
// })


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
