var UserRouter = require('./user')
var PermissionRouter = require('./permission')

module.exports = app => {
    app.use('/home/user', UserRouter)
    app.use('/home/permission', PermissionRouter)
}