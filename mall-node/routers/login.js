//用户的登录和注册的路由

var express = require('express')
const jwt = require('jsonwebtoken')
const crypto = require('crypto');
const userDao = require('../models/userDao')
const moment = require('moment')
const config = require('../conf/config')

var router = express.Router()

router.post('/login/all/:name', (req, res)=>{
    console.log("获取从前端传过来的name："+req.params.name)
    userDao.getAll(req.params.name, function(data){
        res.json(data);
    })
    
})

router.post('/login', (req, res)=>{

    const username = req.body.username;
    const password = req.body.password;

    if(username==null||username==''||password==null||password==''){
        res.json({
            ok:false,
            msg:'请填写完整信息!'
        })
        return;
    }

    userDao.login(username, crypto.createHmac('sha256', password).digest('hex'), function(data){
        console.log(data)
        if(data.length>0){

            var user = {
                id:data[0].id,
                username:data[0].username,
                registerTime:data[0].register_time
            }

            // 登录成功后，需要生成一个token，并返回给客户端
            // 注意默认情况 Token 必须以 Bearer+空格 开头
            const token = 'Bearer ' + jwt.sign(user, config.jwt_secret, {expiresIn: config.jwt_expires_time});
            res.json({
                ok: true,
                token: token,
                user: user
            })
        }else{
            res.json({
                ok:false,
                msg:'用户名或密码错误'
            })
            return;
        }
    })
})

router.post('/register', (req, res)=>{
    const username = req.body.username;
    const password = req.body.password;
    const password2 = req.body.password2;
    const mobile = req.body.mobile;

    if(username==null||username==''||password==null||password==''
        ||password2==null||password2==''||mobile==null||mobile==''){
        res.json({
            ok:false,
            msg:'请填写完整信息!'
        })
        return;
    }
    if(!(/^1[3456789]\d{9}$/.test(mobile))){ 
        res.json({
            ok:false,
            msg:'手机号格式不正确!'
        }) 
        return  
    } 

    if(password!=password2){
        res.json({
            ok:false,
            msg:'两次密码不一致!'
        })
        return;
    }

    //验证用户名是否已被注册

    var user = {
        username:username,
        password: crypto.createHmac('sha256', password).digest('hex'), //加密后的密码
        mobile: mobile,
        sign:0,
        registerTime: moment(new Date()).format('YYYY-MM-DD HH:mm:ss')
    }

    //把注册的用户保存到数据库
    userDao.registerUser(user, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'用户名已注册!'
            })
        }
    })

})

//签到
router.post('/login/sign', (req, res)=>{

    var sign = {}
    sign.userId = req.user.id
    sign.createTime = moment(new Date()).format('YYYY-MM-DD')

    userDao.sign(sign, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'今日已签到!'
            })
        }
    })
})

//修改用户名
router.post('/login/modname', (req, res)=>{

    const username = req.body.username;
    const name = req.body.name;

    if(username==null){
        res.json({
            ok:false,
            msg:'请填写完整信息!'
        })
        return;
    }

    userDao.modname(username, name, function(data){
        console.log(data)
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'修改失败'
            })
            return;
        }
    })
})

//修改密码
router.post('/login/modpass', (req, res)=>{

    const password = req.body.password;
    const password1 = req.body.password1;
    const name = req.body.name;

    if(password==null||password==''||password1==null||password1==''){
        res.json({
            ok:false,
            msg:'请填写密码!'
        })
        return;
    }

    userDao.modpass(name, crypto.createHmac('sha256', password).digest('hex'), crypto.createHmac('sha256', password1).digest('hex'), function(data){
        console.log(data)
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'密码错误'
            })
            return;
        }
    })
})

router.post('/login/modsign', (req, res)=>{

    const signature = req.body.signature;
    const name = req.body.name;

    userDao.modsign(signature, name, function(data){
        console.log(data)
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'修改失败'
            })
            return;
        }
    })
})
module.exports = router;