const adminRouter = require('./admin')
const homeRouter = require('./home')

module.exports = app => {
    adminRouter(app)
    homeRouter(app)
}