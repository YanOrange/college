<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta id="viewport" name="viewport" content="width=device-width,height=device-height,initial-scale=1,user-scalable=no,viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="grey" />
    <meta name="format-detection" content="telephone=no,address=no,email=no" />
    <title>个人中心</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        // if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="../css/common.css">
    <style>

    </style>
</head>
<body>
<div class="wrap">
    <header class="global-header">
        <div class="center-area" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">个人中心</div>
    </header>
    <div onclick="location.href='/page/myFav'" style="margin-top: 1rem;width:100%;test-align:center;">我的收藏</div>
</div>
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

    $(function (){
        initType();
    })

    function initType(){
        $.ajax({
            url:'/type/getAll',
            dataType:'json',
            success:function (res) {
                if (res.success){
                    var data = res.data;
                    var html = '';
                    $.each(data,function (index, arr) {
                        html+='<li data-id="'+arr.id+'">'+arr.name+'</li>';
                    })
                    $('.newsClass').html(html);
                }else{
                    alert(res.msg)
                }
            }
        })
    }

    $('.newsClass').on('click','li',function () {
        var typeId = $(this).data('id');
        $.ajax({
            url:'/essay/findByType',
            data:{
                typeId:typeId
            },
            dataType:'json',
            success:function (res) {
                if (res.success){
                    var data = res.data;
                    var html = '';
                    $.each(data,function (index, arr) {
                        html+='<li data-id="'+arr.id+'">'+arr.title+'</li>';
                    })
                    $('#newsContent').html(html);
                }else{
                    alert(res.msg)
                }
            }
        })
    })


</script>
</html>