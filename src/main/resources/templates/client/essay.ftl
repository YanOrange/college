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
    <title>新闻详情</title>
    <script>
        var deviceWidth = document.documentElement.clientWidth;
        // if (deviceWidth > 640) deviceWidth = 640;
        document.documentElement.style.fontSize = deviceWidth / 7.5 + 'px';
    </script>
    <link rel="stylesheet" href="../css/common.css">
    <style>
        .bottom {
            display: flex;
            justify-content: space-between;
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 1rem;
            line-height: 1rem;
            border: 1px solid #efefef;
        }

        .bottom .tab {
            text-align: center;
            width: 49%;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header class="global-header">
        <div class="center-area"
             style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${essay.title!''}</div>
    </header>
    <div style="margin-top: 0.88rem;">作者：${essay.user.penName}</div>
    <div style="margin-top: 0.2rem">发表时间：${essay.publishTime}</div>
    <div style="margin-top: 0.5rem">${essay.content}</div>

    <h3 style="margin-top:1rem;">评论</h3>
    <div class="commentList">

    </div>


    <div style="position: fixed;bottom: 0;bottom:1rem;height:0.5rem;display: none;" id="commentDiv">
        <input type="text" placeholder="请输入评论..." id="comment">
        <button onclick="commit();">提交评论</button>
    </div>
    <div class="bottom">
        <div class="tab" onclick="addFav();">
            <span>收藏</span>
        </div>
        <div class="tab" onclick="showInp();">
            <span>评论</span>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

    $(function () {
        initComment();
    })

    function initComment() {
        $.ajax({
            url: '/comment/findByEssayId',
            data: {
                essayId:${essay.id}
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    var data = res.data;
                    var html = '';
                    $.each(data, function (index, arr) {
                        html += '<div>\n' +
                                '        <span>'+ arr.user.penName +':</span><span>'+arr.content+'</span>\n' +
                                '    </div>';
                    })
                    $('.commentList').html(html);
                } else {
                    alert(res.msg)
                }
            }
        })
    }

    function addFav() {
        $.ajax({
            url: '/essay/addFav',
            data: {
                essayId:${essay.id}
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    alert("收藏成功")
                } else {
                    alert(res.msg)
                }
            }
        })
    }

    function showInp() {
        $('#commentDiv').show();
    }

    function commit() {
        var essayId = ${essay.id}
        var content = $('#comment').val()
        $.ajax({
            url: '/comment/commit',
            data: {
                content: content,
                essayId: essayId
            },
            dataType: 'json',
            success: function (res) {
                if (res.success) {
                    alert("评论成功")
                    location.reload();
                } else {
                    alert(res.msg)
                }
            }
        })
    }


</script>
</html>