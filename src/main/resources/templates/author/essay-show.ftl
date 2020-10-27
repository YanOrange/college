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
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style.css" media="screen" type="text/css" />
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
        <#--<form class="layui-form" action="">-->
            <div class="wrapper">
                <label for="title" style="text-align: center;font-size: 27px;">${essay.title}</label>
                <label for="title">新闻类型:</label>
                <div style="padding: 10px 0;">${essay.type.name}</div>
                <label for="content">正文:</label>
                <div style="padding: 10px 0;">${essay.content}</div>
            </div>
        <#--</form>-->
    </div>
</div>
<script src='/js/jquery.js'></script>
<script src='/js/form.js'></script>
<script src='/js/tinymce/tinymce.min.js'></script>
<script src="/js/zh_CN.js"></script>

<#--<script src="/js/index.js"></script>-->
<script>

</script>
</body>

</html>
