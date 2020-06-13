<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的游记</title>
    <link href="../styles/base.css" rel="stylesheet" type="text/css">
    <link href="../styles/mytravelnotes.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script>
        $(function () {
            //顶：点赞
            $(".MyDing").click(function () {

                var tid = $(this).data("iid");
                $.get("/mine/travelThumbup", {travelId: tid}, function (data) {
                    if (data.success) {
                        $("#"+tid).html(data.data);
                        dialogCommon("顶成功啦", 1000, "no");

                    } else {
                        if (data.code == 102) {
                            dialogCommon(data.msg, 1000, "no");
                        } else {
                            dialogCommon("你今天已经顶过了", 1000, "no");
                        }
                    }
                });
            });
        })
    </script>
</head>

<#assign currentMineNav="travels"/>

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
                        <span class="MAvaLevel">LV.${user.level}</span>
                    </div>
                </div>
            <#include "../common/mineMenu.ftl">
            </div>
        </div>
    </div>
    <div class="center clearfix">
        <div class="side_bar note_side flt1">
            <div class="MUsers">
                <div class="MUsersTitle">访问人数</div>
                <div class="MUsersTitle">
                    <img src="/img/1111.jpg" style="">
                </div>
                <div class="MUsersDetail">
                    <div class="MUsersAtom">
                        <ul class="clearfix"></ul>
                    </div>
                </div>
                <div class="MUsersBehavior">
                    <span>累计访问<i>${sum}</i></span><span>今日<i>${todayNum}</i></span>
                </div>
            </div>
        </div>
        <div class="content flt2">
            <div class="common_block my_notes">
                <div class="common_title clearfix">
                    <div class="MAvaMore clearfix">
                        <div class="MAvaNums">
                            <strong>${total}</strong>
                            <p>游记</p>
                        </div>
                        <div class="MAvaNums">
                            <strong>${replyNum}</strong>
                            <p>回复</p>
                        </div>
                        <div class="MAvaNums last">
                            <strong>${readNum}</strong>
                            <p>阅读</p>
                        </div>
                    </div>
                </div>
                <div id="article_list">
                    <div class="notes_list">
                        <ul>
                        <#list travels as t>
                            <li data-order="1" data-top="0">
                                <dl>
                                    <dt>
                                        <a href="http://localhost/travel/detail?id=${t.id}" target="_blank" id="_j_coverlink_12894894"><img
                                                src="${t.coverUrl}"
                                                height="400" width="680" alt="封面"></a>
                                    <div class="hover_item">
                                        <div class="thumb_description">
                                            <strong>${t.dest.name}/</strong>
                                            <#if t.dest.parent??>
                                            <span>${t.dest.parent.name}/</span>
                                            </#if>
                                        </div>
                                    </div>
                                    </dt>
                                    <dd>
                                        <div class="note_title clearfix">
                                            <#--<div class="MDing">-->
                                                <#--<span id="topvote12894894">${t.thumbsupnum}</span><a role="button"-->
                                                                                      <#--data-japp="articleding"-->
                                                                                      <#--rel="nofollow" data-iid="12894894"-->
                                                                                      <#--data-vote="0" title="顶一下">顶</a>-->
                                            <#--</div>-->
                                                <div class="MDing">
                                                    <div class="MDing">
                                                        <span id='${t.id}'>${t.thumbsupnum}</span>
                                                        <a class="MyDing"
                                                           role="button"
                                                           data-japp="articleding"
                                                           rel="nofollow"
                                                           data-iid="${t.id}"
                                                           data-vote="0"
                                                           title="顶一下">顶</a>
                                                    </div>
                                                </div>
                                            <div class="note_info">
                                                <h3>
                                                    <a href="javascript:;" target="_blank" title="游记1">${t.title}</a>
                                                </h3>
                                                <div class="note_more">

                                                        <span class="MInfoNum"><i
                                                                class="MIcoView"></i><em>${t.viewnum}/${t.replynum}</em></span>

                                                    <span class="MInfoNum"><i class="MIcoStar"></i><em>${t.favornum}</em></span>
                                                    <span class="time">${t.createTime?string('yyyy-MM-dd HH:mm:ss')}</span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="note_word">
                                            ${t.summary}
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                        </#list>
                            <#--<li data-order="2" data-top="0">-->
                                <#--<dl>-->
                                    <#--<dt>-->
                                        <#--<a href="javascript:;" target="_blank" id="_j_coverlink_12878770"><img-->
                                                <#--src="http://images.mafengwo.net/images/home_new2015/default.jpg"-->
                                                <#--height="400" width="680" alt="封面"></a>-->
                                    <#--<div class="hover_item">-->
                                        <#--<div class="thumb_description">-->
                                            <#--<strong>北京/</strong>-->
                                            <#--<span>中国/</span>-->
                                        <#--</div>-->
                                    <#--</div>-->
                                    <#--</dt>-->
                                    <#--<dd>-->
                                        <#--<div class="note_title clearfix">-->
                                            <#--<div class="MDing">-->
                                                <#--<span id="topvote12878770">0</span><a role="button"-->
                                                                                      <#--data-japp="articleding"-->
                                                                                      <#--rel="nofollow" data-iid="12878770"-->
                                                                                      <#--data-vote="0" title="顶一下">顶</a>-->
                                            <#--</div>-->
                                            <#--<div class="note_info">-->
                                                <#--<h3>-->
                                                    <#--<a href="javascript:;" target="_blank" title="222222">222222</a>-->
                                                <#--</h3>-->
                                                <#--<div class="note_more">-->

                                                        <#--<span class="MInfoNum"><i-->
                                                                <#--class="MIcoView"></i><em>3/0</em></span>-->

                                                    <#--<span class="MInfoNum"><i class="MIcoStar"></i><em>0</em></span>-->
                                                    <#--<span class="time">2019-05-22 16:43:52</span>-->
                                                <#--</div>-->
                                            <#--</div>-->
                                        <#--</div>-->
                                        <#--<div class="note_word">-->
                                            <#--332323424-->
                                        <#--</div>-->
                                    <#--</dd>-->
                                <#--</dl>-->
                            <#--</li>-->
                        </ul>
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