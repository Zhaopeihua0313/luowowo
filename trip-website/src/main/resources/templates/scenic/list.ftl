<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>景点:${scenic.name}</title>
    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <link href="./styles/base.css" rel="stylesheet" type="text/css">
    <link href="./styles/reply.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/travelfilter.js"></script>
    <script type="text/javascript" src="./js/common.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
</head>

<body>

<#assign currentNav="strategy">
<#include "../common/navbar.ftl">

<#--<div class="lww_header">
    <div class="header_wrap">
        <div class="header_logo">
            <a href="javascript:;" class="lww_logo"></a>
        </div>
        <ul class="header_nav">
            <li><a href="./index.html">首页</a></li>
            <li class="header_nav_active"><a href="./destination.html">目的地</a></li>
            <li><a href="./gonglve.html">旅游攻略</a></li>
            <li><a href="javascript:;">去旅行<i class="icon_caret_down"></i></a></li>
            <li><a href="javascript:;">机票</a></li>
            <li><a href="javascript:;">酒店</a></li>
            <li><a href="javascript:;">社区<i class="icon_caret_down"></i></a></li>
        </ul>
        <div class="header_search">
            <input type="text"/>
            <a class="icon_search"></a>
        </div>
        <div class="login_info">
            <div class="head_user">
                <a href="javascript:;">
                    <img src="./images/user.png"/>
                    <i class="icon_caret_down"></i>
                </a>
            </div>
            <div class="header_msg">
                消息<i class="icon_caret_down"></i>
            </div>
            <div class="header_daka">
                <a href="javascript:;">打卡</a>
            </div>
        </div>
    </div>
    <div class="shadow"></div>
</div>-->

<div class="container">


    <div class="row row-placeTop" data-cs-p="面包屑">
        <div class="wrapper">
            <link href="http://css.mafengwo.net/css/cv/css+mdd+place-crumb:css+mdd+place-navbar^Z1U^1559788120.css"
                  rel="stylesheet" type="text/css">
            <script language="javascript" src="http://js.mafengwo.net/js/hotel/sign/index.js?1552035728"
                    type="text/javascript" crossorigin="anonymous"></script>
            <link href="http://css.mafengwo.net/css/mdd/place-crumb.css?1530619858" rel="stylesheet" type="text/css">

            <div class="crumb">
                <div class="item"><a href="/destination">目的地</a><em>&gt;</em></div>
            <#--目的地>（中国>广东）-->
            <#list toasts! as t>
                <div class="item">
                    <div class="drop">
                        <span class="hd"><a href="/destination/guide?id=${t.id!}" target="_blank">${(t.name)!}
                            <i></i></a></span>
                        <div class="bd">
                            <i class="arrow"><b></b></i>
                            <div class="col">
                                <h3>热门地区</h3>
                                <ul class="clearfix">
                                    <#list t.children as tc>
                                        <#if tc_index lt 5 >
                                            <li><a href="/destination/guide?id=${tc.id!}" target="_blank">${tc.name}</a>
                                            </li>
                                        </#if>
                                    </#list>

                                </ul>
                            </div>
                            <div class="more"><a href="/destination/guide?id=${t.id}" target="_blank">&gt;&gt;更多地区</a>
                            </div>
                        </div>
                    </div>
                    <em>&gt;</em>
                </div>
            </#list>
            <#--当前的目的地-->
                <div class="item">
                    <div class="drop">
                        <span class="hd"><a href="/destination/guide?id=${dest.id!}">${dest.name}<i></i></a></span>
                        <div class="bd">
                            <i class="arrow"><b></b></i>
                            <div class="col">
                                <ul class="clearfix">
                                    <li><a href="/destination/surveyPage?destId=${dest.id}" target="_blank">${dest.name}
                                        概括</a></li>
                                    <li><a href="/scenic/list?destId=${dest.id}" target="_blank">${dest.name}景点</a></li>
                                    <li><a href="/hotel/query?destId=${dest.id}" target="_blank">${dest.name}酒店</a></li>
                                    <li><a href="javascript:;" target="_blank">${dest.name}攻略</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <em>&gt;</em>
                </div>
            <#--广州景点-->
                <div class="item cur"><strong>${dest.name}景点</strong></div>
            </div>
            <script language="JavaScript" type="text/javascript">
                $(function () {
                    //面包屑
                    $('.drop').mouseenter(function (ev) {
                        var target = $(ev.currentTarget);
                        clearTimeout(target.data('hideTimer'));
                        target.addClass('open');
                        target.children('bd').fadeIn(200);
                    });
                    $('.drop').mouseleave(function (ev) {
                        var target = $(ev.currentTarget);
                        target.data("hideTimer", setTimeout(function () {
                            target.removeClass('open');
                            target.children('bd').fadeOut(200);
                        }, 200));
                    });
                });
            </script>

            <div class="place-navbar" id="_j_mdd_place_nav_bar_warper" style="border-top: 0;" data-cs-t="目的地导航">
                <div class="navbar-con">
                    <ul class="navbar clearfix navbar-first-level-warper">
                        <li class="navbar-overview">
                            <a class="navbar-btn" href="/destination/guide?id=${dest.id}" data-cs-p="首页">
                                <i class="navbar-icon"></i><span>首页</span>

                            </a>
                        </li>
                        <li class="navbar-line">
                            <a class="navbar-btn" href="/mdd/route/10088.html" data-cs-p="行程线路">
                                <i class="navbar-icon"></i><span>行程线路</span>

                            </a>
                        </li>
                        <li class="navbar-scenic">
                            <a class="navbar-btn" href="/scenic/list?destId=${dest.id}" data-cs-p="景点">
                                <i class="navbar-icon"></i><span>景点</span>

                            </a>
                        </li>
                        <li class="navbar-hotels">
                            <a class="navbar-btn" href="/hotel/query?destId=${dest.id}" data-cs-p="酒店">
                                <i class="navbar-icon"></i><span>酒店</span>

                            </a>
                        </li>
                        <li class="navbar-flight">
                            <a class="navbar-btn" href="/flight/index" target="_blank" data-cs-p="机票">
                                <i class="navbar-icon"></i><span>机票</span>

                            </a>
                        </li>

                    </ul>
                </div>
            </div>
            <div id="fill_area" style="height: 75px; display: none;"></div>
        </div>
    </div>


    <div class="row row-summary row-bg">
        <div class="wrapper">
            <h2 class="title">景点概况</h2>
            <div>
            <span style="">
            ${scenic.content.content}
            </span>
            </div>
        </div>
    </div>
    <br>
    <br>

    <div class="row row-top5" data-cs-p="必游景点">
        <div class="wrapper">
            <h2 class="title">必游景点TOP5</h2>
        <#list top5 as sc>
            <div class="item clearfix">

                <div class="info">
                    <div class="middle">
                        <h3>
                            <span class="num">${sc_index+1}</span>
                            <a href="/scenic/detail?scenicId=${sc.id}" target="_blank" title="${sc.name}">${sc.name}
                            </a><a href="/scenic/detail?scenicId=${sc.id}" target="_blank" title="${sc.name}">
                            <span class="rev-total"><em>${sc.replynum}</em> 条点评</span>
                        </a>
                        </h3>
                        <p>${sc.intro}</p>
                        <div class="links">这里还包含景点：
                            <#list sc.children as c >
                                <a href="/scenic/detail?scenicId=${c.id}" target="_blank">${c.name}</a>
                            </#list>
                        </div>
                    </div>
                </div>

                <div class="pic">
                    <a href="/scenic/detail?scenicId=${sc.id}&destId=${dest.id}" target="_blank" title="${sc.name!}">
                        <div class="large">
                            <img src="${(sc.photoArr[0])!}"
                                 width="370" height="270">
                        </div>
                        <div>
                            <img src="${(sc.photoArr[1])!}"
                                 width="185" height="135">
                        </div>
                        <div>
                            <img src="${(sc.photoArr[2])!}"
                                 width="185" height="135">
                        </div>
                    </a>
                </div>
            </div>
        </#list>
        </div>
    </div>
    <Br>
    <Br>


    <div class="row row-hotScenic row-bg" data-cs-p="热门景点">
        <div class="wrapper">
            <h2 class="title">热门景点</h2>
        <#list top10 as hot>
            <div class="bd">
                <div class="grid grid-two">
                    <div class="figure">
                        <a href="/scenic/detail?scenicId=${hot.id}" target="_blank" title="${hot.name}">
                            <img src="${hot.coverUrl}"
                                 width="485" height="320">
                            <h3 class="title">${hot.name}</h3>
                            <div class="mask-container">
                                <div class="mask">
                                    <div class="middle">
                                        <h3>${hot.name}</h3>
                                        <p>${hot.intro}</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </#list>
        </div>
    </div>
    <Br>
    <Br>
    <div class="row row-allScenic" data-cs-p="全部景点">
        <div class="wrapper">
            <h2 class="title">
            ${dest.name}全部景点
                <a class="btn-add" href="#" target="_blank" title="推荐新的景点"><i>+</i>推荐新的景点</a>
            </h2>
            <ul class="nav clearfix">
                <li class="on" data-tagid="-1"><a title="全部景点">全部景点</a></li>
            <#list catalogs! as c>
                <li data-tagid="${c.id}"><a title="${c.name}">${c.name}</a></li>
            </#list>
            </ul>
            <script>
                //导航高亮
                $('.nav').find('li').click(function() {
                    // 为当前点击的导航加上高亮，其余的移除高亮
                    $(this).addClass('on').siblings('li').removeClass('on');
                    var catalogId = $(this).data('tagid');
                    $.post('/scenic/scenicPage',{catalogId:catalogId},function (data) {
                        $("#scenicPage").html(data);
                    });
                });

                $(function () {
                    //查询评论列表
                    $('#scenicPageForm').ajaxSubmit(function (data) {
                        $("#scenicPage").html(data);
                    });

                })
            </script>

            <!--评论列表分页-->
            <form id="scenicPageForm" action="/scenic/scenicPage" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="com-box " id="scenicPage">

                </div>
            </form>
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
                target="_blank" href="http://trip.elong.com/">艺龙旅游指南</a><a target="_blank" href="http://www.cncn.com">欣欣旅游网</a>
            <a target="_blank" href="http://www.8264.com/">户外运动</a><a target="_blank" href="http://www.yue365.com/">365音乐网</a><a
                target="_blank" href="http://ishare.iask.sina.com.cn/">爱问共享资料</a><a target="_blank"
                                                                                    href="http://www.uzai.com/">旅游网</a>
            <a target="_blank" href="http://www.zongheng.com/">小说网</a>
            <a target="_blank" href="http://www.xuexila.com/">学习啦</a><a target="_blank" href="http://www.yododo.com">游多多自助游</a><a
                target="_blank" href="http://www.zhcpic.com/">问答</a><a target="_blank"
                                                                       href="http://huoche.mafengwo.cn/">火车时刻表</a>
            <a target="_blank" href="http://www.lvmama.com">驴妈妈旅游网</a>
            <a target="_blank" href="http://www.haodou.com/">好豆美食网</a><a target="_blank" href="http://www.taoche.com/">二手车</a><a
                target="_blank" href="http://www.lvye.cn">绿野户外</a><a target="_blank"
                                                                     href="http://www.tuniu.com/">途牛旅游网</a>
            <a target="_blank" href="http://www.mapbar.com/">图吧</a>
            <a target="_blank" href="http://www.chnsuv.com">SUV联合越野</a><a target="_blank"
                                                                          href="http://www.uc.cn/">手机浏览器</a><a
                target="_blank" href="http://sh.city8.com/">上海地图</a><a target="_blank" href="http://www.tianqi.com/">天气预报查询</a>
            <a target="_blank" href="http://www.ly.com/">同程旅游</a>
            <a target="_blank" href="http://www.tieyou.com/">火车票</a><a target="_blank" href="http://www.yunos.com/">YunOS</a><a
                target="_blank" href="http://you.ctrip.com/">携程旅游</a><a target="_blank" href="http://www.jinjiang.com">锦江旅游</a>
            <a target="_blank" href="http://www.huoche.net/">火车时刻表</a>
            <a target="_blank" href="http://www.tripadvisor.cn/">TripAdvisor</a><a target="_blank"
                                                                                   href="http://www.tianxun.com/">天巡网</a><a
                target="_blank" href="http://www.mayi.com/">短租房</a><a target="_blank"
                                                                      href="http://www.zuzuche.com">租租车</a>
            <a target="_blank" href="http://www.5fen.com/">五分旅游网</a>
            <a target="_blank" href="http://www.zhuna.cn/">酒店预订</a><a target="_blank" href="http://www.ailvxing.com">爱旅行网</a><a
                target="_blank" href="http://360.mafengwo.cn/all.php">旅游</a><a target="_blank"
                                                                               href="http://vacations.ctrip.com/">旅游网</a>
            <a target="_blank" href="http://www.wed114.cn">wed114结婚网</a>
            <a target="_blank" href="http://www.chexun.com/">车讯网</a><a target="_blank" href="http://www.aoyou.com/">遨游旅游网</a><a
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
</body>

</html>