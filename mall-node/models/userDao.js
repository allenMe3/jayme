//Usre数据操作模块

const pool = require('../conf/pool').pool//载入数据库连接池模块

exports.registerUser = (user, callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
        var sql = `INSERT ignore INTO j_user(id, username, password,mobile,sign, register_time) 
                VALUES(null, '${user.username}', '${user.password}', '${user.mobile}', '${user.sign}','${user.registerTime}')`
        //执行sql语句
        connection.query(sql, function (err, rows, fields) {
            if (err) throw err
            connection.release();//释放连接
            callback(rows)//执行回调函数
        })
    }
  })
}

exports.login = (username, password, callback)=>{
    //使用连接池获取数据库连接，并进行操作
    pool.getConnection((err,connection) => {
      if(err){
        callback(err);
      }else{
          var sql = `SELECT * FROM j_user WHERE username='${username}' AND password='${password}'`
          //执行sql语句
          connection.query(sql, function (err, rows, fields) {
              if (err) throw err
              connection.release();//释放连接
              callback(rows)//执行回调函数
          })
      }
    })
  }

  exports.sign = (sign, callback)=>{
    //使用连接池获取数据库连接，并进行操作
    pool.getConnection((err,connection) => {
      if(err){
        callback(err);
      }else{
          var sql = `UPDATE j_user SET sign = sign + 1 , sign_time = '${sign.createTime}'
                  WHERE id='${sign.userId}' AND sign_time<'${sign.createTime}'`
          //执行sql语句
          connection.query(sql, function (err, rows, fields) {
              if (err) throw err
              connection.release();//释放连接
              callback(rows)//执行回调函数
          })
      }
    })
  }

  // exports.modname = (username, name, callback)=>{
  //   //使用连接池获取数据库连接，并进行操作
  //   pool.getConnection((err,connection) => {
  //     if(err){
  //       callback(err);
  //     }else{
  //         var sql = `UPDATE j_user SET username='${username}' WHERE username='${name}'`
  //         var sql1 = `UPDATE j_commentList SET user_name='${username}' WHERE user_name='${name}'`
  //         var sql2 = `UPDATE j_comment SET user_name='${username}' WHERE user_name='${name}'`
  //         var sql3 = `UPDATE j_comment SET re_name='${username}' WHERE re_name='${name}'`
  //         var sql4 = `UPDATE j_collect SET user_name='${username}' WHERE user_name='${name}'`
  //         var sql5 = `UPDATE j_collect SET re_name='${username}' WHERE re_name='${name}'`
  //         //执行sql语句
  //         connection.query(sql, function (err, rows, fields) {
  //             if (err) throw err
  //             connection.release();//释放连接
  //             callback(rows)//执行回调函数
  //         })
  //         connection.query(sql1, function (err, rows, fields) {
  //           if (err) throw err
  //           // connection.release();//释放连接
  //         })
  //         connection.query(sql2, function (err, rows, fields) {
  //           if (err) throw err
  //           // connection.release();//释放连接
  //         })
  //         connection.query(sql3, function (err, rows, fields) {
  //           if (err) throw err
  //           // connection.release();//释放连接
  //         })
  //         connection.query(sql4, function (err, rows, fields) {
  //           if (err) throw err
  //           // connection.release();//释放连接
  //         })
  //         connection.query(sql5, function (err, rows, fields) {
  //           if (err) throw err
  //           // connection.release();//释放连接
  //         })
  //     } 
  //   })
  // }

  exports.modpass = (name, password,password1, callback)=>{
    //使用连接池获取数据库连接，并进行操作
    pool.getConnection((err,connection) => {
      if(err){
        callback(err);
      }else{
          var sql = `UPDATE j_user SET password='${password}' WHERE username='${name}' AND password='${password1}'`
          //执行sql语句
          connection.query(sql, function (err, rows, fields) {
              if (err) throw err
              connection.release();//释放连接
              callback(rows)//执行回调函数
          })
      }
    })
  }

  exports.modsign = ( signature,name, callback)=>{
    //使用连接池获取数据库连接，并进行操作
    pool.getConnection((err,connection) => {
      if(err){
        callback(err);
      }else{
          var sql = `UPDATE j_user SET signature='${signature}' WHERE username='${name}'`
          //执行sql语句
          connection.query(sql, function (err, rows, fields) {
              if (err) throw err
              connection.release();//释放连接
              callback(rows)//执行回调函数
          })
      }
    })
  }

  exports.getAll = (name, callback)=>{
    //使用连接池获取数据库连接，并进行操作
    pool.getConnection((err,connection) => {
      if(err){
        callback(err);
      }else{
          var sql = `SELECT * FROM j_user WHERE username='${name}'`
          //执行sql语句
          connection.query(sql, function (err, rows, fields) {
              if (err) throw err
              connection.release();//释放连接
              callback(rows)//执行回调函数
          })
      }
    })
  }