<#--提示框-->
<link rel="stylesheet" href="/js/plugins/dialog2/dialog.css">
<script src="/js/plugins/dialog2/dialog.min.js"></script>
<script src="/js/system/ytr_common.js"></script>
<script>
    $(function () {
        //location.href = "/err";
    })
</script>

<style>
    .login-out .weixin-login {
        background-position: 0 -165px!important;
    }
    .login-out a {
        font-size: 14px;
    }
    .login-out .split {
        display: inline-block;
        margin: 0 10px;
        width: 1px;
        height: 14px;
        background-color: #c9c9c9;
        overflow: hidden;
        vertical-align: -2px;
        *vertical-align: middle;
    }
    .login-out .qq-login {
        background-position: -30px -50px!important;
    }
    .login-out .weibo-login, .login-out .qq-login, .login-out .weixin-login {
        display: inline-block;
        margin-right: 6px;
        width: 26px;
        height: 26px;
        background-image: url(/images/header-sprites15.png);
        background-position: 0 -50px;
        overflow: hidden;
        vertical-align: -7px;
        *vertical-align: middle;
    }
    .header_sss {
        float: right;
        width: 55px;
        margin-right: 25px;
        padding-top: 22px;
    }
    .header_sss a {
        display: block;
        height: 20px;
        background-color: #98e314;
        text-align: center;
        line-height: 20px;
        color: #fff;
        border-radius: 4px;
        overflow: hidden;
        font-size: 12px;
        width: 51px;
    }
</style>

<div class="lww_header">
    <div class="header_wrap" style="width: 1186px;">
        <div class="header_logo">
            <a href="/" class="lww_logo"></a>
        </div>
        <ul class="header_nav">
            <li name="index"><a href="/">首页</a></li>
            <li  name="destination"><a href="/destination">目的地</a></li>
            <li  name="strategy" ><a href="/strategy">旅游攻略</a></li>
            <li  name="travel" ><a href="/travel">旅游日记</a></li>

            <#--新增-->
            <li  name="ticket" ><a href="/ticket">门票</a></li>
            <li  name="flight"><a href="/flight/index">机票</a></li>
            <li  name="hotel"><a href="/hotel">酒店</a></li>
            <li name="wenda"><a href="/wenda">社区问答</a></li>

        </ul>

        <#--搜索框-->
        <div class="header_search" style="position: relative;
                                            box-sizing: border-box;
                                            margin:0;
                                            float: left;
                                            /*width: 130px;
                                            height: 68px;*/
                                            width: 108px;
                                            height: 34px;
                                            padding: 16px 0 15px;">
            <input type="text" id="search_input" style="padding: 0px"/>
            <a class="icon_search"></a>
        </div>

        <#if userInfo??>
        <#--积分商城-->
        <div class="head_user" name="scoreshop">
            <a href="/score/shop">
                <img src="  /images/score_shop_icon.jpg" style="padding-left: 17px;height: 51px;width: 54px;"/>
            </a>
        </div>
        <#--用户信息-->
        <div class="login_info">
            <div class="head_user">
                <a href="/mine/homepage">
                    <img src="${(userInfo.headImgUrl)!'/images/default.jpg'}" />
                    <i class="icon_caret_down"></i>
                </a>
            </div>
            <div class="header_msg">
                消息<i class="icon_caret_down"></i>
            </div>
            <#--打卡增加积分-->
            <div class="header_sss">
                <a href="javascript:;" id="dayCheck">打卡</a>
            </div>
            <div class="header_sss" style="margin-right: 5px;">
                <a href="javascript:;" id="userLogout">注销</a>
            </div>
        </div>
        <#else>
        <div class="login-out" style="float: right;
                                        padding: 21px 0;
                                        height: 26px;
                                        line-height: 26px;
                                        color: #c9c9c9;
                                        text-align: right;">
            <span style="color: orange"> ヾ(✿ﾟ▽ﾟ)ノ &nbsp;</span>
            <#--<a class="weibo-login" href="#" title="微博登录" rel="nofollow"></a>-->
            <a class="qq-login" href="javascript:;" title="QQ登录" rel="nofollow"></a>
            <a class="weixin-login" href="javascript:;" title="微信登录" rel="nofollow"></a>
            <a id="_j_showlogin" title="登录骡窝窝" href="/login.html" rel="nofollow">登录</a>
                <span class="split">|</span>
            <a href="/regist.html" title="注册帐号" rel="nofollow">注册</a>
        </div>
        </#if>
    </div>
    <div class="shadow"></div>
</div>


<script>
    $(function () {
        //打卡按钮绑定事件 dayCheck
        $('#dayCheck').on('click', function () {
            $.get('/mine/dayCheck', function (data) {
                checkData(data, 1500, "今日打卡签到成功 ~ 获得100积分 ~~~", "no", "no");
            })
        });

        //注销按钮绑定事件
        $('#userLogout').on('click', function () {
           $.get('/userLogout', function (data) {
               checkData(data, 1000, "注销成功");
           })
        });

        //QQ按钮绑定事件
        $('.qq-login').on('click', function () {
            window.location.href = 'https://graph.qq.com/oauth2.0/show?' +
                    'which=Login&display=pc&response_type=code&client_id=101397212&' +
                    'redirect_uri=http://unic.nat300.top/qqcallback&state=state';
        });

        //微信按钮绑定事件
        $('.weixin-login').on('click', function () {
            //跳转到微信扫码页面
            window.location.href = '/wxLoginGetCode';
        });

        //搜索框
        $('.icon_search').on('click', function () {
           var input = $('#search_input').val();
            console.log(input);
            window.location.href="/q?type=-1&keyword=" + input;
        });

    });
</script>

<script>
    $("li[name=${currentNav!}]").addClass("header_nav_active");
</script>