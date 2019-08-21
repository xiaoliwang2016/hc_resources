//公开接口，无需校验
const publicUrl = [
    '/admin/admin/login',
    '/admin/admin/logout'
]

const permission = function(req, res, next){

    return next()

    //如果访问的公共接口 或者 用户为超级管理员 则跳过校验
    if(publicUrl.indexOf(req.path) != -1 || req.session.isSuper){
        return next()
    }

    //判断有没有登录
    if(!req.session.accessMap){
        return res.status(401).json({
            code: 0,
            message: '请先登录'
        }) 
    }

    //如果访问路径不存在与当前管理员的可访问地址表中，提示权限不足
    if(req.session.accessMap.indexOf(req.path)){
        return res.status(401).json({
            code: 0,
            message: '当前用户权限不足'
        })
    }

    next()
}

module.exports = permission