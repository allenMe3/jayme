//分类数据操作模块

const pool = require('../conf/pool').pool//载入数据库连接池模块

//获取所有分类
exports.getAll = (callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      //执行sql语句
      connection.query('SELECT * FROM j_commentList', function (err, rows, fields) {
        if (err) throw err
        connection.release();//释放连接
        callback(rows)//执行回调函数
      })
    }
  })
}
//获取所有汽配商品
exports.getAll = (callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      //执行sql语句
      connection.query('SELECT * FROM j_commentList ORDER BY create_time DESC', function (err, rows, fields) {
        if (err) throw err
        connection.release();//释放连接
        callback(rows)//执行回调函数
      })
    }
  })
}


exports.getById = (id, callback) =>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      //执行sql语句
      connection.query(`SELECT * FROM j_commentList WHERE id=${id}`, function (err, rows, fields) {
        if (err) throw err
        connection.release();//释放连接
        callback(rows)//执行回调函数
      })
    }
  })
}

exports.getByName = (name, callback) =>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      //执行sql语句
      var sql = `SELECT * FROM j_commentList WHERE user_name='${name}'`
      connection.query(sql, function (err, rows, fields) {
        if (err) throw err
        connection.release();//释放连接
        callback(rows)//执行回调函数
      })
    }
  })
}

//按id获取评论数
exports.getCommentCountByGoodsId = (commentId, callback)=>{
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

exports.likeit = (likeit, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
        var sql = `UPDATE j_commentList SET likeit = likeit + 1 
                WHERE id='${likeit.commentId}'`
        //执行sql语句
        connection.query(sql, function (err, rows, fields) {
            if (err) throw err
            connection.release();//释放连接
            callback(rows)//执行回调函数
        })
    }
  })
}