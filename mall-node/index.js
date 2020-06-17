//主入口模块

const express = require('express')//载入express模块
var bodyParser = require('body-parser');//载入body-parser模块（接收post方式的请求的参数）
// const cors = require('cors')//载入cors跨域请求模块

var path = require('path');//载入path模块
// var session = require("express-session");//载入session模块

const categoryRouter = require('./routers/category')//载入分类的路由
const bannerRouter = require('./routers/banner')//载入banner的路由
const loginRouter = require('./routers/login')//载入banner的路由
const commentRouter = require('./routers/comment')//载入收货人的路由
const musicRouter = require('./routers/music')//载入音乐列表的路由
const jayRouter = require('./routers/jay')//载入音乐列表的路由

const expressJwt = require('express-jwt')//载入express-jwt模块

const app = express()//实例化express，获得app对象

//设置模板引擎
app.engine('html', require('express-art-template'));
//配置模板页面的根目录
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'html');

//设置静态资源目录
app.use(express.static('public'))
//设置上传图片目录为静态资源目录
app.use("/image",express.static('uploads'))
app.use("/music",express.static('music'))

//设置bodyParser
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

//跨域设置
app.all('*', function (req, res, next) {
    //配置白名单，如果允许所有域的请求就设置为"*"
    res.header("Access-Control-Allow-Origin", "http://localhost:8080");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, authorization");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By", ' 3.2.1')
    res.header("Content-Type", "application/json;charset=utf-8");
    next();
});

//配置jwt
app.use(expressJwt({
    secret: 'secret12345'  // 签名的密钥 或 PublicKey
}).unless({
    path: ['/login', '/register', /^\/category\/.*/, /^\/banner\/.*/, 
             /^\/comment\/list\/.*/, , /^\/comment\/count\/.*/,
        /^\/music\/.*/,/^\/comment\/.*/,/^\/jay\/.*/]  // 指定路径不经过 Token 解析
}))

app.use(categoryRouter);//装载分类路由模块
app.use(bannerRouter);//装载Banner路由模块
app.use(loginRouter);//装载Login路由模块
app.use(commentRouter);//装载订单路由模块
app.use(musicRouter);//装载音乐路由模块
app.use(jayRouter);//装载音乐路由模块


//配置404处理
app.use(function (req, res, next) {
    console.log("__dirname="+__dirname);
    res.status(404).sendFile(__dirname + '/views/404.html');
})

//配置系统错误处理(一定要注意是接收4个参数)
app.use(function (err, req, res, next) {
    console.error(err.stack)
    //当抛出的报错是‘UnauthorizedError’，就说明没有token或者token验证失败
    if (err.name === 'UnauthorizedError') {   
        res.status(401).json({
            status:'invalid token',
            msg:'token验证失败'
        })
    }else{
        res.status(500).sendFile(__dirname + '/views/500.html')
    }
})

//启动服务器，并监听端口
app.listen(3000, () => console.log('JayMusic服务器启动成功，端口号为3000。'))