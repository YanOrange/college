<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta id="viewport" name="viewport"
          content="width=device-width,height=device-height,initial-scale=1,user-scalable=no,viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="grey"/>
    <meta name="format-detection" content="telephone=no,address=no,email=no"/>
    <title>登录</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        // if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="../css/common.css">
    <style>
        input {
            border: 1px solid #000;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header class="global-header">
        <div class="center-area" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">登录</div>
    </header>
    <div style="margin-top: 0.88rem;">
        <span>账号：</span>
        <div><input type="text" name="account" value="" id="account"></div>
        <span>密码：</span>
        <div><input type="password" name="passWord" value="" id="passWord"></div>
        <button onclick="login()">登录客户端</button>
        <a href="/page/add?status=1">注册</a>
    </div>
</div>
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

    $(function () {
    })


    function login() {
        var account = $('#account').val();
        var passWord = $('#passWord').val();
        $.ajax({
            url: '/login/doLogin2',
            dataType: 'json',
            data: {
                userName: account,
                passWord: passWord
            },
            success: function (res) {
                if (res.code == 0) {
                    location.href = '/page/home';
                } else {
                    alert(res.msg);
                }
            }
        })
    }


</script>
</html>