<#--提示框-->
<link rel="stylesheet" href="/js/plugins/dialog2/dialog.css">
<script src="/js/plugins/dialog2/dialog.min.js"></script>
<script src="/js/system/ytr_common.js"></script>

<div class="s-head">
    <div class="wid clearfix">
        <div class="s-head-logo">
            <a href="/"></a>
        </div>
        <div class="searchbar">
            <#--搜索-->
            <div class="search-wrapper">
                <form action="/q" method="get" id="kwSearchForm">
                    <input type="hidden" name="type" value="${qo.type}" id="searchType">
                    <div class="search-input"><input name="keyword" type="text" id="_j_search_input" value="${qo.keyword!}"
                                                     placeholder="搜目的地/攻略/游记/用户" autocomplete="off" ></div>
                </form>
            </div>
            <div class="search-button"><a role="button" href="javascript:" id="_j_search_button"><i
                    class="icon-search"></i></a></div>
        </div>

        <#--登录用户框-->
        <div id="pagelet-block-6d34f3fc7bb6504c1b634be7d8ff2a67" class="pagelet-block"
             data-api="apps:user:pagelet:pageViewHeadInfo" data-params="{&quot;type&quot;:1}" data-async="1"
             data-controller="/js/pageletcommon/pageHeadUserInfoWWWNormal">
            <#--用户信息-->
            <#if userInfo??>
            <div class="login-info">
                <div class="head-user" id="_j_head_user">
                    <a class="drop-trigger" href="javascript:;" title="骡窝窝用户的窝" rel="nofollow">
                        <div class="user-image"><img src="${(userInfo.headImgUrl)!'/images/default.jpg'}" height="32" width="32" alt="骡窝窝用户的窝"></div>
                        <i class="icon-caret-down"></i>
                    </a>
                </div>
                <div class="head-msg" id="_j_head_msg">
                    <a class="drop-trigger" href="javascript:" rel="nofollow">
                        <i class="icon-msg"></i>
                        消息
                        <i class="icon-caret-down"></i>
                        <span class="head-msg-new hide" style="display: none;"></span>
                    </a>

                </div>
                <div class="head-daka ">
                    <a class="btn head-btn-daka" href="javascript:" rel="nofollow" id="head-btn-daka" title="打卡"
                       data-japp="daka">打卡
                    </a>
                    <a class="btn-active head-btn-daka" href="javascript:" rel="nofollow" id="head-btn-daka-active"
                       title="已打卡" data-japp="daka">已打卡
                    </a>
                </div>
                <div class="header_daka" style="width: 44px;padding-top: 23px;">
                    <a href="javascript:;" style="height: 24px;width: 60px;line-height: 24px;"
                       id="userLogout" class="btn head-btn-daka">注销</a>
                </div>
            </div>
            <#else>
                <div class="login-out" style="padding: 0;">
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
    </div>
</div>

<script>
    $(function () {
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

        //注销按钮绑定事件
        $('#userLogout').on('click', function () {
            $.get('/userLogout', function (data) {
                checkData(data, 1000, "注销成功");
            })
        });

    });
</script>