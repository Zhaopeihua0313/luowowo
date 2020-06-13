<#--提示框-->
<link rel="stylesheet" href="/js/plugins/dialog2/dialog.css">
<script src="/js/plugins/dialog2/dialog.min.js"></script>
<script src="/js/system/ytr_common.js"></script>
<script>
    $(function () {
        //打卡按钮绑定事件 dayCheck
        $('#dayCheck').on('click', function () {
            $.get('/mine/dayCheck', function (data) {
                checkData(data, 1500, "今日打卡签到成功 ~ 获得100积分 ~~~", "no", "no");
            })
        });
    })
</script>
<div class="topBar">
    <div class="topBarC" style="width: 1117px;">
        <div class="logo"><a title="窝自由行" href="/">窝自由行</a></div>
        <div class="t_nav">
            <ul id="pnl_nav" data-cs-t="headnav_wo">
                <li data-cs-p="index">
                    <strong class="t"><a href="/">首页</a></strong>
                </li>
                <li data-cs-t="wenda" data-cs-p="wenda">
                    <strong class="t"><a data-cs-p="from_wo_nav" href="/wenda">问答</a></strong>
                </li>
                <li data-cs-t="things" data-cs-p="things">
                    <strong class="t"><a data-cs-p="from_wo_nav" href="/destination">目的地</a></strong>
                </li>
                <li data-cs-p="together">
                    <strong class="t"><a href="/strategy">旅游攻略</a></strong>
                </li>
                <li data-cs-p="group">
                    <strong class="t"><a href="/ticket">门票</a></strong>
                </li>
                <li data-cs-p="mall">
                    <strong class="t"><a href="/flight/index">机票</a></strong>
                </li>
                <li class="drop" data-cs-p="other">
                    <strong class="t"><a href="/hotel">酒店</a></strong>
                </li>
                <li class="drop" data-cs-p="other">
                    <strong class="t"><a href="/score/shop">积分商城</a></strong>
                </li>
            </ul>
        </div>
        <div class="t_search">
            <form method="GET" action="/search/s.php" name="search">
                <input type="text" class="key" value="" name="q" id="word">
                <input type="submit" value="" class="btn">
            </form>
        </div>

        <div class="t_info">
            <div class="pagelet-block">
                <ul class="user_info">
                    <li class="daka">
                            <span class="daka_btn" id="_j_dakabtn" data-japp="daka">
                                <a role="button" title="打卡" class="daka_before" id="dayCheck">打卡</a>
                                <a role="button" title="打卡推荐" class="daka_after">打卡推荐</a>
                            </span>
                    </li>
                    <li id="pnl_user_msg" data-hoverclass="on" class="msg _j_hoverclass">
                            <span id="oldmsg" class="oldmsg"><a href="javascript:;"
                                                                class="infoItem">消息<b></b></a></span>
                        <ul id="head-msg-box" class="drop-bd">
                            <li><a href="javascript:;" rel="nofollow">私信</a></li>
                            <li><a href="javascript:;" rel="nofollow">小组消息</a></li>
                            <li><a href="javascript:;" rel="nofollow">系统通知</a></li>
                            <li><a href="javascript:;" rel="nofollow">问答消息</a></li>
                            <li><a href="javascript:;" rel="nofollow">回复消息</a></li>
                            <li><a href="javascript:;" rel="nofollow">喜欢与收藏</a></li>
                            <li><a href="javascript:;" rel="nofollow">好友动态</a></li>
                        </ul>
                    </li>
                    <li class="ub-item ub-new-msg" id="head-new-msg">
                    </li>
                    <li class="account _j_hoverclass" data-hoverclass="on" id="pnl_user_set">
                            <span class="t"><a class="infoItem" href="/mine/homepage">
                                <img
                                    src="${(userInfo.headImgUrl)!'/images/default.jpg'}"
                                    width="32" height="32" align="absmiddle"><b></b></a></span>
                        <div class="uSet c">
                            <div class="asset">
                                <a class="coin" href="javascript:;" target="_blank" rel="nofollow">蜂蜜 0</a>
                                /
                                <a class="coin" href="javascript:;" target="_blank" id="head-my-honey"
                                   rel="nofollow" data-cs-p="coin">金币 579</a>
                            </div>
                            <a href="javascript:;">我的窝<b class="tb-level">LV.3</b></a>
                            <a href="javascript:;" target="_blank">写游记</a>
                            <a href="javascript:;" target="_blank">预约游记</a>
                            <a href="javascript:;" target="_blank">我的足迹</a>
                            <a href="javascript:;" target="_blank">我的问答</a>
                            <a href="javascript:;" target="_blank">我的好友</a>
                            <a href="javascript:;" target="_blank">我的收藏</a>
                            <a href="javascript:;" target="_blank">我的路线</a>
                            <a href="javascript:;" target="_blank">我的订单</a>
                            <a href="javascript:;" target="_blank">我的优惠券</a>
                            <a href="javascript:;" target="_blank">设置</a>
                            <a href="javascript:;">退出</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>