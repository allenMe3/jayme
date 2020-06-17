//评论路由模块

var express = require('express')
var commentDao = require('../models/commentDao')//载入评论数据操作模块
const moment = require('moment')

var router = express.Router()

router.post('/comment/create', (req, res)=>{

    var comment = {}
    comment.username = req.body.username
    comment.content = req.body.content
    comment.like = 0
    comment.createTime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss')

    commentDao.createComment(comment, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'发布错误!'
            })
        }
    })
})

router.post('/comment/create1/:id', (req, res)=>{

    var comment1 = {}
    comment1.commentsId = req.params.id
    comment1.rename = req.body.rename
    comment1.username = req.body.username
    comment1.content = req.body.content
    comment1.createTime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss')

    commentDao.createComment1(comment1, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'发布错误!'
            })
        }
    })
})

router.get('/comment/list/:commentId', (req, res)=>{
    commentDao.getCommentListBycommentId(req.params.commentId, function(data){
        res.json(data)
    })
})

//创建收藏
router.post('/comment/collect/:id', (req, res)=>{

    var collect = {}
    collect.commentId = req.params.id
    collect.rename = req.body.collect.user_name
    collect.username = req.body.username
    collect.content = req.body.collect.content
    collect.createTime = moment(new Date()).format('YYYY-MM-DD HH:mm:ss')

    commentDao.createcollect(collect, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'收藏过了!'
            })
        }
    })
})

//获取收藏信息
router.post('/comment/collectList', (req, res)=>{
    var username = req.body.username
 
    
    commentDao.getcollectList(username, function(data){
        res.json(data);
        
    })
    
})

router.post('/comment/collectdel/:id', (req, res)=>{

    var id = req.params.id

    commentDao.delcollect(id, function(data){
        if(data.affectedRows>0){
            res.json({
                ok:true
            })
        }else{
            res.json({
                ok:false,
                msg:'删除失败!'
            })
        }
    })
})


//获取通知信息
router.post('/comment/noticeList', (req, res)=>{
    var username = req.body.username
    
    commentDao.getnoticeList(username, function(data){
        res.json(data);
    })
    
})


module.exports = router;