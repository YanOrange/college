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
    <style>
        .title{
            padding: 10px;
            width: 100%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>在线编辑稿件</legend>
        </fieldset>

        <#--<form class="layui-form" action="">-->
            <div class="wrapper">
                <input type="hidden" name="id" value="<#if essay??>${essay.id!''}</#if>" id="id">
                <input type="hidden" name="typeId" value="${(essay.type.id)!''}" id="typeId">
                <label for="title">新闻标题</label>
                <input type="text" class="title" id="title" name="title" value="<#if essay??>${essay.title!''}</#if>"/>
                <label for="title">新闻类型</label>
                <select id="type" class="title">
                    <option value="">请选择新闻类型...</option>
                </select>
                <label for="content">正文</label>
                <textarea cols="30" rows="10" id="content" class="content" name="content" data-provide='tinymce'><#if essay??>${essay.content!''}</#if></textarea>
                <#--<pre><code class="json"></code></pre>-->
                <button class="layui-btn" onclick="submit();" href="javascript:;" type="button">
                    发布，提交审核
                </button>
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
    $(function () {
        initType();
        tinymce.init({
            selector: "textarea[data-provide='tinymce']",
            upload_image_url: '/upload/cloud', //配置的上传图片的路由
            height: 400,
            plugins: [
                'advlist autolink autosave lists link image charmap print preview anchor',
                'searchreplace visualblocks code fullscreen textcolor colorpicker textpattern code uploadimage',
                'contextmenu paste'
            ],
            toolbar1: "undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | fontselect fontsizeselect ",
            toolbar2: "forecolor backcolor | bullist numlist | outdent indent | removeformat | link unlink uploadimage | preview fullscreen | print",
            menubar: false,
        });


    })

    //初始化类型
    function initType(){
        var typeId = $('#typeId').val();

        $.ajax({
            url:'/type/getAll',
            type:'post',
            contentType: "application/json;charset=UTF-8",
            success:function (res) {
                if (res.success){
                    var list = res.data;
                    var html = '<option value="">请选择新闻类型...</option>';
                    $.each(list, function (index, data) {
                        if (typeId&&typeId==data.id){
                            html+='<option value="'+data.id+'" selected>'+data.name+'</option>';
                        } else {
                            html+='<option value="'+data.id+'">'+data.name+'</option>';
                        }
                    })
                    $('#type').html(html);
                }
            }
        })
    }

    function submit() {
        var title = jQuery('#title').val();
        var id = jQuery('#id').val();
        var typeId = jQuery('#type').val();
        var content = tinymce.activeEditor.getContent();
        var data = {
            id:id,
            title:title,
            type:{
                id:typeId
            },
            content:content
        };
        if (!(title && typeId && content)){
            layer.msg('请完善新闻参数')
        }
        console.log(data);
        jQuery.ajax({
            url:'/essay/save',
            data:JSON.stringify(data),
            dataType:'json',
            type:'post',
            contentType: "application/json;charset=UTF-8",
            success:function (res) {
                if (res.success){
                    layer.msg('上传成功！', {
                    }, function(){
                        location.reload();
                    });
                }
            }


        })
    }
</script>
</body>

</html>
