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
    <title>我的收藏</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        // if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="../css/common.css">
    <style>
        #newsContent{
            margin-top:0.88rem;
        }
        #newsContent li {
            padding: 0.3rem 0.4rem;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header class="global-header">
        <div class="center-area" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">我的收藏</div>
    </header>
    <ul id="newsContent">

    </ul>
</div>
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

    $(function () {
        initNews();
    })

    function initNews() {

        $.ajax({
            url: '/essay/findByFav',
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var data = res.data;
                    console.log(data)
                    var html = '';
                    $.each(data, function (index, arr) {
                        html += '<li data-id="' + arr.id + '">' + arr.title + '</li>';
                    })
                    $('#newsContent').html(html);
                } else {
                    alert(res.msg)
                }
            }
        })
    }

    $('#newsContent').on('click','li',function () {
        var essayId = $(this).data('id');
        location.href="/page/findById?essayId="+essayId;
    })


</script>
</html>