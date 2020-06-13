<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>
    <#--提示框-->
    <link rel="stylesheet" href="/js/plugins/dialog2/dialog.css">
    <script src="/js/plugins/dialog2/dialog.min.js"></script>
    <script src="/js/system/ytr_common.js"></script>
    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">

    <script>
        $(function () {
            var back = $.parseJSON($.cookie("browHistory")).last;
            var count = 0;
            //周期循环定时器，检测微信登录是否成功
            var timer = setInterval(function(){
                //发送异步请求检测微信登录是否成功
                $.get('/checkWeChatLoginResult', function (data) {
                    count ++;
                    console.log("监听微信登录是否成功 " + count + " ：" + data.success);
                    if (data.success) {
                        window.clearInterval(timer);
                        dialogCommon("登录成功~", 1000, back);
                    }
                    if (count > 300) {
                        window.clearInterval(timer);
                        dialogCommon("请求超时，请重新扫码", 10000000, 'no');
                    }
                });
            }, 1000);

        });

    </script>

</head>


<body>
    <div id="login_container" style="display: none">微信登录测试</div>

    <#--扫码提示框-->
    <div class="dialog dialog-open  dialog-modal" data-style="android">
        <div class="dialog-overlay"></div>
        <div class="dialog-content" style="width: 434px;">
            <div class="dialog-content-bd content-scroll" style="max-height: 434px;">
                <div>微信登录</div>
                <img src="/images/wxLoginGetCode.png">
                <div style="padding: 20px;">请使用微信扫码登录</div>
            </div>
        </div>
    </div>

</body>

</html>