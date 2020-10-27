<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="/js/html5.min.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>个人信息</legend>
        </fieldset>

        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.account!''}</div>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.name!''}</div>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">笔名</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.penName!''}</div>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.sex!''}</div>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.age!''}</div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">联系方式</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.phone!''}</div>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.email!''}</div>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">联系地址</label>
                    <div class="layui-input-block">
                        <div class="layui-form-mid">${user.address!''}</div>
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid">${user.birthDay!''}</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证件</label>
                <div class="layui-input-block">
                    <div class="layui-form-mid">${user.idCard!''}</div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" onclick="xadmin.open('编辑','/user/getInfo?authorId='+${user.id},800,600)" href="javascript:;">立即修改</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>

</html>
