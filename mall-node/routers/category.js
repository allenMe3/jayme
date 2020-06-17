//分类路由模块

var express = require('express')
var categoryDao = require('../models/categoryDao')//载入分类数据操作模块

var router = express.Router()

//处理所有分类请求
router.get('/category/all', (req, res)=>{
    categoryDao.getAll(function(data){
        res.json(data)
    })
})
router.get('/category/all1', (req, res)=>{
    var condition = {}//定义一个查询条件变量
    if(req.query.cid!=undefined){
        condition.cid = req.query.cid   
    }
    if(req.query.keyword!=undefined){
        condition.keyword = req.query.keyword   
    }

    var arr = Object.keys(condition);
    //判断查询是否为空
    if(arr.length == 0){
        categoryDao.getAll(function(data){
            res.json(data)
        })
    }else{
        categoryDao.getByCondition(condition, function(data){
            res.json(data)
        })
    }
})

//按id查询帖子
router.get('/category/commentList/:id', (req, res)=>{
    console.log("获取从前端传过来的id："+req.params.id)
    categoryDao.getById(req.params.id, function(data){
        res.json(data);
    })
    
})

router.get('/category/commentList1/:name', (req, res)=>{
    console.log("获取从前端传过来的name："+req.params.name)
    categoryDao.getByName(req.params.name, function(data){
        res.json(data);
    })
    
})

router.post('/category/count', (req, res)=>{
    var commentId = req.body.commentId
    categoryDao.getCommentCountByGoodsId(commentId, function(data){
        res.json(data)
    })
})

router.post('/category/like/:id', (req, res)=>{

    var likeit = {}
    likeit.commentId = req.params.id

    categoryDao.likeit(likeit, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'点赞失败!'
            })
        }
    })
})
module.exports = router;