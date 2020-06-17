//评论数据操作模块

const pool = require('../conf/pool').pool//载入数据库连接池模块

//创建帖子
exports.createComment = (comment, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `INSERT INTO j_commentList(user_name,likeit,content,create_time) 
          VALUES('${comment.username}','${comment.like}','${comment.content}','${comment.createTime}')`

      //执行sql语句j
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
    }
  })
}

//创建评论
exports.createComment1 = (comment1, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `INSERT INTO j_comment(comment_id,re_name, user_name, content, create_time) 
          VALUES('${comment1.commentsId}','${comment1.rename}','${comment1.username}','${comment1.content}','${comment1.createTime}')`
      var sql1 = `UPDATE j_commentList SET comment_cout = comment_cout + 1 
          WHERE id='${comment1.commentsId}'`
      //执行sql语句j
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
      connection.query(sql1, function (err, rows, fields) {
                        if (err) throw err
                      })
                      
    }
  })
}

//按id获取评论列表
exports.getCommentListBycommentId = (commentId, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `SELECT * FROM j_comment WHERE comment_id=${commentId}`
      
      //执行sql语句
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
    }
  })
}

//创建收藏
exports.createcollect = (collect, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `INSERT ignore INTO j_collect(comment_id, re_name, user_name, content, create_time) 
          VALUES('${collect.commentId}','${collect.rename}','${collect.username}','${collect.content}','${collect.createTime}')`

      //执行sql语句j
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
    }
  })
}

exports.delcollect = (id, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `DELETE FROM j_collect WHERE comment_id=${id}`

      //执行sql语句j
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
    }
  })
}

//按用户名获取收藏列表
exports.getcollectList = (username, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `SELECT * FROM j_collect WHERE user_name='${username}' ORDER BY create_time DESC`
      
      //执行sql语句
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
    }
  })
}

//按用户名获取收藏列表
exports.getnoticeList = (username, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      var sql = `SELECT * FROM j_comment WHERE re_name='${username}' ORDER BY create_time DESC`
      
      //执行sql语句
      connection.query(sql, function (err, rows, fields) {
                        if (err) throw err
                          connection.release();//释放连接
                          callback(rows)//执行回调函数
                      })
    }
  })
}

exports.count = (commentId, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
        var sql = `SELECT count(*) FROM j_comment WHERE comment_id=${commentId}`
        //执行sql语句
        connection.query(sql, function (err, rows, fields) {
            if (err) throw err
            connection.release();//释放连接
            callback(rows)//执行回调函数
        })
    }
  })
}
