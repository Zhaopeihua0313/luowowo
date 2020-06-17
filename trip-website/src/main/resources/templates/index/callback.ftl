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
            //QQ登录的跳转
            var last = $.cookie("browHistory").last;
            console.log("last：：：：" + last);
            var back = "/";
            if (last != null) {
                //如果上一页是登录页或者注册页
                if (last == "http://unic.nat300.top/login.html" || last == "http://localhost/login.html"
                        || last == "http://localhost/regist.html" || last == "http://localhost/regist.html"){
                    //设置返回页为上上页
                    var back = $.parseJSON($.cookie("browHistory")).llast;
                    //如果上上页还是登录注册页，直接返回页为主页
                    if (back == "http://unic.nat300.top/login.html" || back == "http://localhost/login.html"
                            || back == "http://localhost/regist.html" || back == "http://localhost/regist.html") {
                        back = "/";
                    }
                } else {
                    var back = $.parseJSON($.cookie("browHistory")).last;
                }
            }

            <#if qqResult ?? >
                <#if qqResult.success >
                    dialogCommon("登录成功", 10000000, back);
                <#else >
                    dialogCommon("登录失败", 1000, "/");
                </#if>
            </#if>

        });
    </script>
</head>

<body>
    <div style="width: 100%;text-align: center;padding-top: 4%;">
        <img src="/images/${centerPic!"waiaaaaa.gif"}">
    </div>
    <#--提示框-->
    <#--<div class="dialog dialog-open  dialog-modal" data-style="android">
        <div class="dialog-overlay"></div>
        <div class="dialog-content">
            <div class="dialog-content-bd content-scroll" style="max-height: 434px;">
                登录成功！
            </div>
            <div class="dialog-content-ft">
                <button class="dialog-btn dialog-btn-confirm ">&lt;#&ndash;确定&ndash;&gt;</button>
            </div>
        </div>
    </div>-->
</body>

</html>