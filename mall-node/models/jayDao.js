//Banner数据操作模块

const pool = require('../conf/pool').pool//载入数据库连接池模块

//获取所有banner
exports.getAll = (callback)=>{
  //使用连接池获取数据库连接，并进行操作
  pool.getConnection((err,connection) => {
    if(err){
      callback(err);
    }else{
      //执行sql语句
      connection.query('SELECT * FROM j_jay ORDER BY sort ASC', function (err, rows, fields) {
        if (err) throw err
        connection.release();//释放连接
        callback(rows)//执行回调函数
      })
    }
  })
}

exports.gethonor = (callback)=>{
    //使用连接池获取数据库连接，并进行操作
    pool.getConnection((err,connection) => {
      if(err){
        callback(err);
      }else{
        //执行sql语句
        connection.query('SELECT * FROM j_honor ORDER BY id ASC', function (err, rows, fields) {
          if (err) throw err
          connection.release();//释放连接
          callback(rows)//执行回调函数
        })
      }
    })
  }