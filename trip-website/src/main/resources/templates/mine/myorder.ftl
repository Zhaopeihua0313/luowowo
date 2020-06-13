<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的订单</title>
    <link href="../styles/base.css" rel="stylesheet" type="text/css">
    <link href="../styles/travelcollection.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/travelcollection.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
</head>

<body style="position: relative;">

<#include "../common/mineNavbar.ftl">

<div class="main">
    <div class="banner">
        <div class="banner_img banner_note" id="_j_banner">
        </div>
        <div class="tags_bar second_tags_bar">
            <div class="center clearfix">
                <div class="MAvatar clearfix">
                    <div class="MAvaImg flt1">
                        <img width="120" height="120" alt=""
                             src="${user.headImgUrl}">
                    </div>
                    <div class="MAvaEasyWord flt1">
                        <span class="MAvaName">${user.nickname}(${user.city})</span>
                        <span class="MAvaLevel">Lv.${user.level}</span>
                    </div>
                </div>
                <ul class="flt2">
                    <li><a class="tags_link" href="/mine/homepage" title="我的窝">我的窝</a></li>
                    <li><a class="tags_link" href="/mine/mytravelnotes" title="我的游记">我的游记</a></li>
                    <li><a class="tags_link" href="/mine/review" title="我的点评">我的点评</a></li>
                    <li><a class="tags_link" href="/mine/travelcollection"
                                                      title="我的收藏">我的收藏</a>
                    </li>
                    <li class="on"><a class="_j_pathnav tags_link" href="/mine/myorder" title="我的订单">我的订单</a></li>
                    <li><a class="tags_link" href="/mine/setting" title="设置">设置</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>
<div class="wrapper">
    <div class="home-extra">
        <div class="s_title">
            <ul>
                <li class="s_curr"><a href="javascript:;">我的所有订单</a></li>
            </ul>
        </div>

        <#--订单列表-->
        <div class="p-country favPost">
            <ul id="favlist">

                <#--我的订单循环-->
                <#if travels??>
                    <#list travels as t>
                        <li class="post_item">
                            <a class="delPost" href="javascript:void(0)" data-id="6555539" data-type="0"
                               title=""></a>
                            <dl class="clearfix">
                                <dd>
                                    <h2><a href="javascript:;"
                                           >订单 No.${t.id}  ：${t.products[0].productName}</a>
                                    </h2>
                                    <span style="color: #2f6073">
                                        <#if t.products[0].productTypeName == "score">
                                            使用者：${t.userUser.name}
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 手机：${t.userUser.phone}
                                        <#else>
                                            使用者：${t.userUser.name}
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;手机：${t.userUser.phone}
                                        </#if>

                                    </span>
                                    <#--支付按钮-->
                                    <div class="count">
                                        <#if t.status != "paided" >
                                            <a href="javascript:;" class="pay_btn" data-pay="paypay_${t.id}"
                                               style="width: 114!important;
                                               padding: 7px;
                                                height: 34px;
                                                background: #ffa800;
                                                color: #fff;">
                                                立即支付
                                            </a>
                                        <#else >
                                            <a href="javascript:;" class="" style="width: 114;padding: 7px;
                                                height: 34px;
                                                background: #28255c;
                                                color: #fff;">
                                                已支付
                                            </a>
                                        </#if>
                                    </div>
                                    <div class="author">
                                        <p class="authorA">
                                            商品总价：￥${t.totalPrice!?string('0.00')}
                                        </p>
                                        <p class="authorA">
                                            优惠金额：￥${t.pullPrice!?string('0.00')}
                                        </p>
                                        <p class="authorA">
                                            订单总价：￥${t.realPrice!?string('0.00')}
                                        </p>
                                        <p class="authorA">
                                            商品类型：${t.products[0].productTypeName}
                                        </p>
                                        <p class="authorA"><a href="javascript:;" target="_blank"><img
                                                src=""></a>时间：
                                        <#--<a-->
                                        <#--href="javascript:;" target="_blank">80後_.</a> -->
                                        ${t.createTime?string('yyyy-MM-dd hh:mm:ss')}
                                        </p>
                                    </div>
                                    <div class="post_info" id="paypay_${t.id}" style="display: none">
                                        <p>
                                            <img src="/img/paypay.jpg" style="padding-left: 649px;">
                                        </p>
                                    </div>
                                </dd>
                            </dl>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

    </div>
</div>
<div id="footer">
    <div class="ft-content" style="width: 1105px">
        <div class="ft-info clearfix">
            <dl class="ft-info-col ft-info-intro">
                <dt>马蜂窝旅游网</dt>
                <dd>叩丁狼是一家专注于培养高级IT技术人才，为学员提供定制化IT职业规划方案及</dd>
                <dd>意见咨询服务的教育科技公司，为您提供海量优质课程，以及创新的线上线下学</dd>
                <dd>习体验，帮助您获得全新的个人发展和能力提升。</dd>
            </dl>
            <dl class="ft-info-col ft-info-qrcode">
                <dd>
                    <span class="ft-qrcode-tejia"></span>
                </dd>
                <dd>
                    <span class="ft-qrcode-weixin"></span>
                </dd>
                <dd>
                        <span class="ft-qrcode-weixin"
                              style="background-image: url('https://p3-q.mafengwo.net/s10/M00/48/A9/wKgBZ1t_4sSAVJ6uAAAlzJ0PZgU881.png?imageMogr2%2Fthumbnail%2F%2194x90r%2Fgravity%2FCenter%2Fcrop%2F%2194x90%2Fquality%2F90')"></span>
                </dd>
            </dl>
            <dl class="ft-info-social">
                <dt>向崇尚自由的加勒比海盗致敬！</dt>
                <dd>
                    <a class="ft-social-weibo" target="_blank" href="javascript:;" rel="nofollow"><i
                            class="ft-social-icon"></i></a>
                    <a class="ft-social-qqt" target="_blank" href="javascript:;" rel="nofollow"><i
                            class="ft-social-icon"></i></a>
                    <a class="ft-social-qzone" target="_blank" href="javascript:;" rel="nofollow"><i
                            class="ft-social-icon"></i></a>
                </dd>
            </dl>
        </div>

        <div class="ft-links">
            <a target="_blank" href="http://china.makepolo.com/">马可波罗</a><a target="_blank"
                                                                            href="http://www.onlylady.com/">Onlylady女人志</a><a
                target="_blank"
                href="http://trip.elong.com/">艺龙旅游指南</a><a target="_blank" href="http://www.cncn.com">欣欣旅游网</a>
            <a target="_blank" href="http://www.8264.com/">户外运动</a><a target="_blank"
                                                                      href="http://www.yue365.com/">365音乐网</a><a
                target="_blank"
                href="http://ishare.iask.sina.com.cn/">爱问共享资料</a><a target="_blank"
                                                                    href="http://www.uzai.com/">旅游网</a>
            <a target="_blank" href="http://www.zongheng.com/">小说网</a>
            <a target="_blank" href="http://www.xuexila.com/">学习啦</a><a target="_blank"
                                                                        href="http://www.yododo.com">游多多自助游</a><a
                target="_blank" href="http://www.zhcpic.com/">问答</a><a
                target="_blank" href="http://huoche.mafengwo.cn/">火车时刻表</a>
            <a target="_blank" href="http://www.lvmama.com">驴妈妈旅游网</a>
            <a target="_blank" href="http://www.haodou.com/">好豆美食网</a><a target="_blank"
                                                                         href="http://www.taoche.com/">二手车</a><a
                target="_blank" href="http://www.lvye.cn">绿野户外</a><a
                target="_blank" href="http://www.tuniu.com/">途牛旅游网</a>
            <a target="_blank" href="http://www.mapbar.com/">图吧</a>
            <a target="_blank" href="http://www.chnsuv.com">SUV联合越野</a><a target="_blank"
                                                                          href="http://www.uc.cn/">手机浏览器</a><a
                target="_blank" href="http://sh.city8.com/">上海地图</a><a
                target="_blank" href="http://www.tianqi.com/">天气预报查询</a>
            <a target="_blank" href="http://www.ly.com/">同程旅游</a>
            <a target="_blank" href="http://www.tieyou.com/">火车票</a><a target="_blank"
                                                                       href="http://www.yunos.com/">YunOS</a><a
                target="_blank" href="http://you.ctrip.com/">携程旅游</a><a
                target="_blank" href="http://www.jinjiang.com">锦江旅游</a>
            <a target="_blank" href="http://www.huoche.net/">火车时刻表</a>
            <a target="_blank" href="http://www.tripadvisor.cn/">TripAdvisor</a><a target="_blank"
                                                                                   href="http://www.tianxun.com/">天巡网</a><a
                target="_blank" href="http://www.mayi.com/">短租房</a><a
                target="_blank" href="http://www.zuzuche.com">租租车</a>
            <a target="_blank" href="http://www.5fen.com/">五分旅游网</a>
            <a target="_blank" href="http://www.zhuna.cn/">酒店预订</a><a target="_blank"
                                                                      href="http://www.ailvxing.com">爱旅行网</a><a
                target="_blank"
                href="http://360.mafengwo.cn/all.php">旅游</a><a target="_blank"
                                                               href="http://vacations.ctrip.com/">旅游网</a>
            <a target="_blank" href="http://www.wed114.cn">wed114结婚网</a>
            <a target="_blank" href="http://www.chexun.com/">车讯网</a><a target="_blank"
                                                                       href="http://www.aoyou.com/">遨游旅游网</a><a
                target="_blank" href="http://www.91.com/">手机</a>
            <a href="javascript:;" target="_blank">更多友情链接&gt;&gt;</a>
        </div>
    </div>
</div>
<div class="mfw-toolbar" id="_j_mfwtoolbar" style="display: block;">
    <div class="toolbar-item-top" style="display: none;">
        <a role="button" class="btn _j_gotop">
            <i class="icon_top"></i>
            <em>返回顶部</em>
        </a>
    </div>
    <div class="toolbar-item-feedback">
        <a role="button" data-japp="feedback" class="btn">
            <i class="icon_feedback"></i>
            <em>意见反馈</em>
        </a>
    </div>
    <div class="toolbar-item-code">
        <a role="button" class="btn">
            <i class="icon_code"></i>
        </a>
        <a role="button" class="mfw-code _j_code">


            <img src="https://p1-q.mafengwo.net/s1/M00/6C/51/wKgIC1t_6TuASybrAADGUPUHjr021.jpeg?imageMogr2%2Fthumbnail%2F%21450x192r%2Fgravity%2FCenter%2Fcrop%2F%21450x192%2Fquality%2F90"
                 width="450" height="192">
        </a>
        <!--<div class="wx-official-pop"><img src="http://images.mafengwo.net/images/qrcode-weixin.gif"><i class="_j_closeqrcode"></i></div>-->
    </div>

</div>

<script>
    $(function () {
        $('.pay_btn').on('click', function () {
            var the = $(this);
            var payId = the.data('pay');
            console.log(payId);
            $('#'+payId).toggle();
        })
    })
</script>

</body>

</html>