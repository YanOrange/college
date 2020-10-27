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
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="/js/html5.min.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
    <style>
        .iconfont {
            font-family:"iconfont" !important;
            font-size:16px;
            font-style:normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a><cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">

                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="请输入用户名" autocomplete="off"
                                   class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()">
                        <i class="layui-icon"></i>批量删除</button></div>
                <div class="layui-card-body ">
                    <table id="LAY_table_user" class="layui-table">

                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<script>
    layui.use('laydate',
            function () {
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#start' //指定元素
                });

                //执行一个laydate实例
                laydate.render({
                    elem: '#end' //指定元素
                });

            });
</script>
<script>
    layui.use('table',function () {
                var table = layui.table;

            });
</script>
<script>
    /*操作数据*/

    /*用户-删除*/
    function member_del(obj, id) {
        var arr = [];
        arr.push(id);
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url:'/essay/delete',
                data:JSON.stringify(arr),
                type:'post',
                dataType:'json',
                contentType: "application/json",
                success:function (res) {
                    if (res.success){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    } else{
                        layer.msg(res.msg,{icon:2,time:1000});
                    }
                }
            })
        });
    }
    /*用户-删除全部*/
    function delAll(argument) {
        var checkStatus = layui.table.checkStatus('checkboxTable').data;
        var ids = [];
        // 获取选中的id
        $.each(checkStatus, function (index, el) {
            ids.push(el.id)
        });

        layer.confirm('确认要删除吗？' + ids.toString(),
                function () {
                    //捉到所有被选中的，发异步进行删除
                    $.ajax({
                        url:'/essay/delete',
                        data:JSON.stringify(ids),
                        dataType:'json',
                        type:'post',
                        contentType:'application/json',
                        success:function (res) {
                            if (res.success){
                                layer.msg('删除成功', {
                                    icon: 1
                                });
                                $(".layui-form-checked").not('.header').parents('tr').remove();
                                xadmin.father_reload();
                            } else{
                                layer.msg(res.msg,{
                                    icon: 2
                                });
                            }
                        }

                    })

                });
    }



</script>
<script th:inline="none">
    /*数据查询*/

    $(function () {
        getAllEssay();
    })

    /*获取全部稿件*/
    function getAllEssay() {
        layui.use('table',
                function () {
                    var table = layui.table;
                    table.render({
                        id: "checkboxTable",
                        url: '/essay/getAllEssay',
                        elem: '#LAY_table_user',
                        page:true,
                        cols: [[
                            {checkbox: true},
                            {field: 'id', title: 'ID', width: 80},
                            {field: 'title', title: '标题', sort: true, width: 120},
                            {field: 'type',width:80, title: '类型', sort: true,templet:'<div>{{d.type.name}}</div>'},
                            {field: 'user',width:80, title: '作者', sort: true,templet:'<div>{{d.user.penName}}</div>'},
                            {field: 'createTime', title: '创建时间', sort: true, width: 150},
                            {field: 'updateTime', title: '最后一次更新时间', sort: true, width: 150},
                            {field: 'publishTime', title: '发布时间', sort: true, width: 150},
                            {field: 'state', title: '状态', sort: true, width: 120,templet:'<div>{{d.state==0?"审核中":(d.state==1?"发布":(d.state==2?"打回":(d.state==3?"弃用":"未知")))}}</div>'},
                            {field: 'remark', title: '修改意见', sort: true, width: 120},
                            {toolbar:'#barTeacher',title:'操作',width: 120}

                        ]]
                    })

                });
    }



    /**
     * 判断字段是否为空
     * @param o
     * @returns {*}
     */
    function isNullFormat(o) {
        if (o) {
            return o;
        }else{
            return '暂无';
        }
    }

</script>
<script type="text/html" id="barTeacher">
    <a title="查看"  onclick="xadmin.open('查看稿件','/essay/checkEssay?essayId={{d.id}}',800,600);" href="javascript:;">
        <i class="layui-icon iconfont">&#xe6ac;</i>
    </a>
    <#--<a title="下载"  onclick="down({{d.id}});" href="javascript:;">-->
        <#--<i class="layui-icon iconfont">&#xe714;</i>-->
    <#--</a>-->
    <a title="编辑"  onclick="xadmin.open('编辑','/essay/toEditEssay?essayId={{d.id}}',800,600)" href="javascript:;">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="移除" onclick="member_del(this,{{d.id}})" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>

</html>