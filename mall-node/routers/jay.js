//jay路由模块

var express = require('express')
var bannerDao = require('../models/jayDao')//载入Banner数据操作模块

var router = express.Router()

router.get('/jay/all', (req, res)=>{
    bannerDao.getAll(function(data){
        res.json(data)
    })
})

router.get('/jay/honor', (req, res)=>{
    bannerDao.gethonor(function(data){
        res.json(data)
    })
})

module.exports = router;