//music路由模块

var express = require('express')
var musicDao = require('../models/musicDao')//载入music数据操作模块

var router = express.Router()

router.get('/music/all', (req, res)=>{
    musicDao.getAll(function(data){
        res.json(data)
    })
})

module.exports = router;