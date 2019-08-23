var UserRouter = require('./user')

module.exports = app => {
    app.use('/home/user', UserRouter)
}