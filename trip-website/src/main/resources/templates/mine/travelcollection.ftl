<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的收藏</title>
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
                    <li id="_j_pathnav" class="on"><a class="tags_link" href="/mine/travelcollection"
                                                      title="我的收藏">我的收藏</a>
                    </li>
                    <li><a class="tags_link" href="javascript:;" title="我的订单">我的订单</a></li>
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
                <li class="s_curr"><a href="javascript:;">地点收藏</a></li>
                <li><a href="javascript:;">游记收藏</a></li>
                <li><a href="javascript:;">攻略收藏</a></li>
                <li><a href="javascript:;">旅行社收藏</a></li>
            </ul>
        </div>

        <div class="p-country">
        <#if scenics??>
            <#list scenics as s>
                <div class="p-hd">
                ${(s.parent.name)!}
                </div>
                <div class="p-item">
                    <div class="p-item-main clearfix">
                        <div class="p-toggle">
                            <a class="btn-toggle" href="javascript:void(0)" data-mddid="11047"><span>收起</span><i
                                    class="arr-up"></i></a>
                        </div>
                        <div class="p-content">
                            <div class="img"><a href="javascript:;" target="_blank"><img
                                    src="${s.coverUrl!}"
                                    width="140" height="90"></a></div>
                            <div class="p-title">
                                <a href="/scenic/list?destId=${s.destId!}"
                                   target="_blank"><strong>${s.name!}</strong></a><span class="en">
                                    </span><span class="s-pull"><b>${s.visitnum}</b>人去过</span>
                            </div>
                            <p class="favtip">该目的地已被收藏了<em>${s.favornum}</em>次</p>
                            <p class="summary">${s.intro}</p>

                        </div>
                    </div>
                <#--<div class="p-item-poi">-->
                <#--<div class="p-nav clearfix">-->
                <#--<a class="on" href="javascript:void(0)"><i class="p-icon-hotel"></i>住宿<span>2</span></a>-->
                <#--</div>-->
                <#--<ul class="p-poi clearfix">-->
                <#--<li>-->
                <#--<a href="javascript:;" target="_blank">-->
                <#--<div class="img"><img-->
                <#--src="http://b4-q.mafengwo.net/s6/M00/9E/0C/wKgB4lMOLoWANyARAAET45U6C3w68.jpeg?imageMogr2%2Fthumbnail%2F%21240x240r%2Fgravity%2FCenter%2Fcrop%2F%21240x240%2Fquality%2F90"-->
                <#--width="162" height="100"></div>-->
                <#--<div class="info">-->
                <#--<p class="title">普吉岛芭东巴尔米拉度假酒店</p>-->
                <#--<p><em>2397</em>条评论</p>-->
                <#--</div>-->
                <#--</a>-->
                <#--</li>-->
                <#--<li>-->
                <#--<a href="javascript:;" target="_blank">-->
                <#--<div class="img"><img-->
                <#--src="http://b1-q.mafengwo.net/s12/M00/9C/8A/wKgED1uk79OAK7C2AAc7O4pWYic23.jpeg?imageMogr2%2Fthumbnail%2F%21240x240r%2Fgravity%2FCenter%2Fcrop%2F%21240x240%2Fquality%2F90"-->
                <#--width="162" height="100"></div>-->
                <#--<div class="info">-->
                <#--<p class="title">阿玛塔拉康体度假村</p>-->
                <#--<p><em>62</em>条评论</p>-->
                <#--</div>-->
                <#--</a>-->
                <#--</li>-->
                <#--</ul>-->
                <#--</div>-->
                </div>
            </#list>
        </#if>
        </div>

        <div class="p-country favPost hide">
            <ul id="favlist">
                <form name="favorite" action="" method="post">
                <#if travels??>
                    <#list travels as t>
                        <li class="post_item">
                            <a class="delPost hide" href="javascript:void(0)" data-id="6555539" data-type="0"
                               title="删除"></a>
                            <div class="pic"><a href="http://localhost/travel/detail?id=${t.id}" target="_blank"><img
                                    src="${t.coverUrl}" width="215" height="135"></a>
                            </div>
                            <dl class="clearfix">
                                <dd>
                                    <h2><a href="http://localhost/travel/detail?id=${t.id}"
                                           target="_blank">${t.title}</a></h2>
                                    <div class="count"><b></b><a href="javascript:void(0);">${t.viewnum}</a></div>
                                    <div class="author">
                                        <p class="authorA">
                                            <a href="javascript:;" target="_blank"><img
                                                    src="${t.author.headImgUrl}" width="35" height="25"></a>作者：<a
                                                href="javascript:;" target="_blank">${t.author.nickname!}</a>
                                        </p>
                                        <p class="authorB"><a href="javascript:;" target="_blank"><img
                                                src=""></a>时间：
                                        <#--<a-->
                                        <#--href="javascript:;" target="_blank">80後_.</a> -->
                                        ${t.travelTime?string('yyyy-MM-dd')}
                                        </p>
                                    </div>
                                    <div class="post_info">
                                        <p>${t.summary}
                                        </p>
                                    </div>
                                </dd>
                            </dl>
                        </li>
                    </#list>
                </#if>
                <#--<li class="post_item">-->
                <#--<a class="delPost hide" href="javascript:void(0)" data-id="3294240" data-type="0"-->
                <#--title="删除"></a>-->
                <#--<div class="pic"><a href="javascript:;" target="_blank"><img-->
                <#--src="http://n2-q.mafengwo.net/s7/M00/9D/94/wKgB6lTNA8-AMrK2AAlg4GRUhKI23.jpeg?imageMogr2%2Fthumbnail%2F%21196x140r%2Fgravity%2FCenter%2Fcrop%2F%21196x140%2Fquality%2F90"></a>-->
                <#--</div>-->
                <#--<dl class="clearfix">-->
                <#--<dd>-->
                <#--<h2><a href="javascript:;" target="_blank">【I‘m Back! 肝裂之作，再战普吉, 以此纪</a></h2>-->
                <#--<div class="count"><b></b><a href="javascript:void(0);">965/269228</a></div>-->
                <#--<div class="author">-->
                <#--<p class="authorA">-->
                <#--<a href="javascript:;" target="_blank"><img-->
                <#--src="http://b2-q.mafengwo.net/s7/M00/03/C5/wKgB6lTHE0KAFzscAAB26z2HT-o32.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>作者：<a-->
                <#--href="javascript:;" target="_blank">馮花,</a>-->
                <#--</p>-->
                <#--<p class="authorB"><a href="javascript:;" target="_blank"><img-->
                <#--src="http://b2-q.mafengwo.net/s7/M00/03/C5/wKgB6lTHE0KAFzscAAB26z2HT-o32.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>回复：<a-->
                <#--href="javascript:;" target="_blank">馮花.</a> 2015-02-11 02:08:51</p>-->
                <#--</div>-->
                <#--<div class="post_info">-->
                <#--<p> 2015.3.1-->
                <#--我的第一篇，梦寐以求的蜂首终于来了！在此非常感谢蚂蜂窝对此篇游记的肯定！！！收到通知的时候我真的非常激动。游记前前后后写了好几天，希望走过路过的蜂友们，动动鼠标点个顶，我也就心满意足了-->
                <#--原本</p>-->
                <#--</div>-->
                <#--</dd>-->
                <#--</dl>-->
                <#--</li>-->
                <#--<li class="post_item">-->
                <#--<a class="delPost hide" href="javascript:void(0)" data-id="5470560" data-type="0"-->
                <#--title="删除"></a>-->
                <#--<div class="pic"><a href="javascript:;" target="_blank"><img-->
                <#--src="http://p2-q.mafengwo.net/s9/M00/9F/2F/wKgBs1cnHu6AGijEAAtY2zoulcE88.jpeg?imageMogr2%2Fthumbnail%2F%21196x140r%2Fgravity%2FCenter%2Fcrop%2F%21196x140%2Fquality%2F90"></a>-->
                <#--</div>-->
                <#--<dl class="clearfix">-->
                <#--<dd>-->
                <#--<h2><a href="javascript:;" target="_blank">【仙境中的难民】马来西亚九日纪行（吉隆坡</a></h2>-->
                <#--<div class="count"><b></b><a href="javascript:void(0);">20/2735</a></div>-->
                <#--<div class="author">-->
                <#--<p class="authorA">-->
                <#--<a href="javascript:;" target="_blank"><img-->
                <#--src="http://n1-q.mafengwo.net/s11/M00/8A/4B/wKgBEFpTi1-AR9yXAACHQudfnQw25.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>作者：<a-->
                <#--href="javascript:;" target="_blank">唐亮</a>-->
                <#--</p>-->
                <#--<p class="authorB"><a href="javascript:;" target="_blank"><img-->
                <#--src="http://n4-q.mafengwo.net/s12/M00/D0/E3/wKgED1vL4wmAaDuaAACNfIw66k457.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>回复：<a-->
                <#--href="javascript:;" target="_blank">徐小芮</a> 2016-05-02 19:49:18</p>-->
                <#--</div>-->
                <#--<div class="post_info">-->
                <#--<p> 写在前头-->
                <#--写在前头：在这蚂蜂窝里好多大神和大牛，我只是一名普通大学生，拍的照片或许不够美，毕竟不是专业的，用的也只是入门级的单反。写的文字也没有美感，理工男的文笔不太行。但是我会尽量把游记写详细点，写-->
                <#--</p>-->
                <#--</div>-->
                <#--</dd>-->
                <#--</dl>-->
                <#--</li>-->
                </form>
            </ul>
        </div>
        <div class="p-country post-list hide">
        <#list details as s>
            <ul>
                <li class="post-item clearfix">
                    <div class="post-cover">
                        <a href="http://localhost/strategy/detail?id=${s.id}" target="_blank">
                            <img class="lazy" width="215" height="135" alt="带着母亲去三亚悠闲的自由行，高性价比的出行方式_游记"
                                 src="${s.coverUrl}"
                                 style="display: inline;"></a>
                    </div>

                    <h2 class="post-title yahei ">
                        <a href="http://localhost/strategy/detail?id=${s.id}" class="title-link"
                           target="_blank">${s.title}</a>
                    </h2>
                <#--<div class="post-author">-->
                <#--<span class="author">-->
                <#--<a href="javascript:;" target="_blank" rel="nofollow"><img class="lazy"-->
                <#--src="http://n2-q.mafengwo.net/s11/M00/8C/44/wKgBEFrd5bOAGGFYAAAY-AmpOe094.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"-->
                <#--style="display: inline;"></a>-->
                <#--作者：<a href="javascript:;" target="_blank" rel="nofollow">Serena</a>-->
                <#--</span>-->
                <#--<span class="last-comment">-->
                <#--<a href="javascript:;" target="_blank" rel="nofollow"><img-->
                <#--src="http://p3-q.mafengwo.net/s12/M00/35/CD/wKgED1uqIt-AG3w5AAAbM62rsh0384.png?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>-->
                <#--回复：<a href="javascript:;" target="_blank" rel="nofollow">马蜂窝用户</a>-->
                <#--<span class="comment-date">19-05-20 23:03</span>-->
                <#--</span>-->
                <#--</div>-->
                    <div class="post-content">
                    ${s.summary}
                    </div>
                    <span class="status"><i class="icon_view"></i>${s.viewnum}<i class="icon_comment"></i>${s.replynum}</span>
                </li>
            </ul>
        </#list>
        </div>
        <div class="p-country hot-list hide">
            <div class="hot-about clearfix _j_hotel" data-id="15735096">
                <div class="flt1">
                    <a href="javascript:;" target="_blank" class="_j_search_link"><img
                            src="http://b2-q.mafengwo.net/s13/M00/D6/30/wKgEaVyle-2AUoVNAAX-JArlBT856.jpeg?imageMogr2%2Fthumbnail%2F%21480x300r%2Fgravity%2FCenter%2Fcrop%2F%21480x300%2Fquality%2F90"
                            style="width:150px;height:90px;"></a>
                </div>
                <div class="ct-text">
                    <h3>
                        <a href="javascript:;" target="_blank" class="_j_search_link">华安华侨<span
                                class="sr-keyword">旅行社</span></a>
                    </h3>
                    <div class="seg-desc">
                        <p>地址:华安大同路40号</p>
                    </div>
                </div>
            </div>
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
</body>

</html>