//Banner路由模块

var express = require('express')
var bannerDao = require('../models/bannerDao')//载入Banner数据操作模块

var router = express.Router()

router.get('/banner/all', (req, res)=>{
    bannerDao.getAll(function(data){
        res.json(data)
    })
})

router.get('/banner/new', (req, res)=>{
    bannerDao.getNew(function(data){
        res.json(data)
    })
})

module.exports = router;