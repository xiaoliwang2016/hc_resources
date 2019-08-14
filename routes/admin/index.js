var UserRouter = require('./user')
var ResourcesRouter = require('./resources')
var RoleRouter = require('./role')
var ThemeRouter = require('./theme')
var AdminRouter = require('./admin')
var AccessRouter = require('./access')

module.exports = app => {
    app.use('/admin/user', UserRouter)
    app.use('/admin/resources', ResourcesRouter)
    app.use('/admin/role', RoleRouter)
    app.use('/admin/theme', ThemeRouter)
    app.use('/admin/admin', AdminRouter)
    app.use('/admin/access', AccessRouter)
}