var express = require('express')
var path = require('path')
var cookieParser = require('cookie-parser')
var logger = require('morgan')
var router = require('./routes')
var session = require('express-session')
var app = express()


app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(session({ secret: 'hc_resources', cookie: { maxAge: 60000 }, resave: false, saveUninitialized: false }))
app.use(express.static(path.join(__dirname, 'public')))

router(app)

module.exports = app
