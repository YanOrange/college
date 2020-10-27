<!DOCTYPE html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.2</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/login.css">
	<link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="/js/html5.min.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">x-admin2.0-管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" id="myform">
            <input name="userName" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="passWord" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <a href="/page/add?status=0" style="float: right;">主编注册</a>
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
                var form = layui.form;
                // layer.msg('玩命卖萌中', function(){
                //   //关闭后的操作
                //   });
                //监听提交
                form.on('submit(login)', function(data){
                    console.log(data)
                    $.ajax({
                        url:'/login/doLogin',
                        dataType:'json',
                        data:{
                            userName:data.field.userName,
                            passWord:data.field.passWord
                        },
                        success:function (res) {
                            if (res.code ==0 ){
                                layer.msg('登录成功',{
                                    icon: 6,  //icon样式
                                    time: 2000,  //关闭时间为2s
                                    // offset: ['90px', '900px']//自定义位置
                                },function () {
                                    location.href = '/page/index'
                                })
                            }else{
                                layer.msg(res.msg,{
                                    icon: 2,  //icon样式
                                    time: 2000,  //关闭时间为2s
                                    // offset: ['90px', '900px']//自定义位置
                                },function() {
                                    return false;
                                })
                            }
                        }
                    })
                    return false;
                });
            });

        })
    </script>
    <!-- 底部结束 -->

</body>
</html>