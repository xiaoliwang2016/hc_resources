var UserRouter = require('./user')
var ResourcesRouter = require('./resources')
var PermissionRouter = require('./permission')

module.exports = app => {
    app.use('/home/user', UserRouter)
    app.use('/home/resources', ResourcesRouter)
    app.use('/home/permission', PermissionRouter)
}