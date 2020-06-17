//数据库连接池

var mysql=require("mysql");//载入mysql模块
//创建连接池
var pool = mysql.createPool({
    host     : 'localhost',
    user     : 'root',
    password : '1234',
    database : 'jay'
});

module.exports = {
    pool:pool
}