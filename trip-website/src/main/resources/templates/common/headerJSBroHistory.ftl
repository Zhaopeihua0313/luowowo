<!--要在 jQuery 后引入-->
<script type="text/javascript" src="/js/plugins/jquery.cookie.js"></script>
<#--存储页面浏览历史 By YangTR-->
<script>
    var nowUrl = window.location.href;
    console.log(nowUrl);

    if ($.cookie("browHistory")) {
        var browHistory = $.cookie("browHistory");
        browHistory = $.parseJSON(browHistory);
        //拟浏览历史处理
        if (nowUrl != browHistory.now) {
            browHistory.lllast = browHistory.llast;
            browHistory.llast = browHistory.last;
            browHistory.last = browHistory.now;
            browHistory.now = nowUrl;
        }
        //存 cookie
        browHistory = JSON.stringify(browHistory);
        $.cookie("browHistory", browHistory, { expires: 7, path: '/' });


    } else {
        var browHistory = '{"now":"'+nowUrl+'", "last":"", "llast":"", "lllast":""}';
        //存 cookie
        $.cookie("browHistory", browHistory, { expires: 7, path: '/' });
        console.log("还没有浏览历史 cookie，现在生成");
    }
    console.log($.cookie("browHistory"));
</script>