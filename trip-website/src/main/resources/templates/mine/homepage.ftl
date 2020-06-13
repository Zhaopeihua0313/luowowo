<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人中心</title>
    <link href="../styles/base.css" rel="stylesheet" type="text/css">
    <link href="../styles/homepage.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript" src="../js/homepage.js"></script>
    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">


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
                            alert(data.msg);
                        } else {
                            dialogCommon("你今天已经顶过啦", 1000, "no");
                        }
                    }
                });
            });
        })
    </script>

</head>

<#assign currentMineNav="home"/>

<body style="position: relative;">

<#--自己头部-->
<#--<#include "../common/navbar.ftl">-->

<#--原生黑头部-->
<#include "../common/mineNavbar.ftl">
<div class="main">
    <div class="banner">
        <div class="banner_img banner_note" id="_j_banner" style="background-image: url(../images/banner_note.gif);text-align: center;
                background-color: #006488;
                height: 260px;
                background-position: center 0;
                background-repeat: no-repeat;">
        </div>
        <div class="tags_bar" style="position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            height: 58px;">
            <div class="center clearfix">
            <#include "../common/mineMenu.ftl">
            </div>
        </div>
    </div>
    <div class="center clearfix">
        <div class="side_bar flt1">
            <div class="MAvatar">
                <div class="MAvaImg hasAva">
                    <img src="${user.headImgUrl}"
                         height="120" width="120" alt="蚂蜂测试窝用户"><a href="javascript:;"><i></i></a>
                </div>
                <div class="MAvaName">${user.nickname}

                    <i class="MGenderMale"></i>
                </div>

                <div class="its_tags">
                    <a href="javascript:;" target="_blank" title="VIP"><i class="vip"></i></a>
                    <a href="javascript:;" target="_blank" title="分舵"><i class="duo"></i>
                    </a><a href="javascript:;" target="_blank" title="指路人"><i class="zhiluren"></i></a>
                </div>
                <div class="MAvaInfo clearfix MAvaMyInfo">
                        <span class="MAvaLevel flt1">等级：<a href="javascript:;" title="Lv.5"
                                                           target="_blank">Lv.${user.level}</a></span>
                    <span class="MAvaPlace flt1" title="广州">现居：${user.city}</span> <span class="MAvaSet"><a title="设置"
                                                                                                            href="javascript:;"
                                                                                                            target="_blank"></a></span>
                </div>
                <div id="_j_profilearea" class="MAvaProfile">
                    <div class="MProfile _j_showintrobox" data-intro="sdddds" style="display: block;">
                        <pre>${user.info}</pre>
                    </div>
                    <div class="MAvaInput _j_inputarea hide">
                        <textarea id="_j_introarea" placeholder="例：摄影师/旅居澳洲/潜水爱好者" maxlength="100"></textarea>
                        <a role="button" id="_j_introsaver" class="MAvaBtn" title="保存">保存</a>
                    </div>

                </div>
                <div class="MAvaMore clearfix">
                    <div class="MAvaNums">
                        <strong><a href="javascript:;" target="_blank">${caresNum!}</a></strong>
                        <p>关注</p>
                    </div>
                    <div class="MAvaNums">
                        <strong><a href="javascript:;" target="_blank">${total!}</a></strong>
                        <p>游记</p>
                    </div>
                    <div class="MAvaNums last">
                        <strong><a href="javascript:;" target="_blank">${sum!}</a></strong>
                        <p>收藏</p>
                    </div>
                </div>
            </div>

            <div class="MUsers">
                <div class="MUsersTitle">我的关注</div>
                <div class="MUsersDetail" id="_j_followcnt">
                    <div class="MUsersAtom">
                        <ul class="clearfix _j_followlist">
                        <#list cares as care>
                            <li>
                                <a href="javascript:;" target="_blank">
                                    <img src="${care.headImgUrl!}"
                                         height="48" width="48" alt="" title="">
                                </a>
                                <p><a href="javascript:;" target="_blank" title="桃小桃和她的喵">${care.nickname!}</a></p>
                            </li>
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://p3-q.mafengwo.net/s8/M00/ED/05/wKgBpVYUydOAKdaaAAlyxu5BVPc94.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="云云" title="云云">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank" title="云云">云云</a></p>-->
                        <#--</li>-->
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://b1-q.mafengwo.net/s12/M00/B0/D7/wKgED1xEOeCAepriAADB6P4hrk080.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="文刀水羊" title="文刀水羊">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank" title="文刀水羊">文刀水羊</a></p>-->
                        <#--</li>-->
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://n4-q.mafengwo.net/s11/M00/1A/8F/wKgBEFr-7WKAfFPiAABz4qeKy-c65.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="翔太" title="翔太">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank" title="翔太">翔太</a></p>-->
                        <#--</li>-->
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://b3-q.mafengwo.net/s9/M00/B2/19/wKgBs1aVP9uAeflmAASv31idm1M01.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="Sordino_Li" title="Sordino_Li">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank" title="Sordino_Li">Sordino_Li</a></p>-->
                        <#--</li>-->
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://n1-q.mafengwo.net/s9/M00/D3/93/wKgBs1da3ceAFTPMAACjdPpGr3M65.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="butterflyvalley" title="butterflyvalley">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank"-->
                        <#--title="butterflyvalley">butterflyvalley</a></p>-->
                        <#--</li>-->
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://b4-q.mafengwo.net/s9/M00/C3/D2/wKgBs1hYqd-AIbARAAClh_wvlnc64.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="幸存者格蕾丝" title="幸存者格蕾丝">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank" title="幸存者格蕾丝">幸存者格蕾丝</a></p>-->
                        <#--</li>-->
                        <#--<li>-->
                        <#--<a href="javascript:;" target="_blank">-->
                        <#--<img src="http://p1-q.mafengwo.net/s10/M00/5F/95/wKgBZ1mWdF6AFf2fAAB1tTikS6w24.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
                        <#--height="48" width="48" alt="法系强迫症" title="法系强迫症">-->
                        <#--</a>-->
                        <#--<p><a href="javascript:;" target="_blank" title="法系强迫症">法系强迫症</a></p>-->
                        <#--</li>-->
                        </#list>
                        </ul>
                    </div>
                    <!-- <div class="MSimplePages _j_follow_page_action" data-total="13"><span
                            class="MPrev _j_prev disabled" title="上一页"></span><span class="MNext _j_next"
                            title="下一页"></span></div> -->
                </div>
            </div>
        </div>
        <div class="content flt2">
            <div class="common_block my_notes">
                <div class="notes_list">
                    <ul>
                    <#list travels as t>
                        <li data-order="1" data-top="0">
                            <dl>
                                <dt>
                                    <a href="/travel/detail?id=${t.id}" target="_blank" id="_j_coverlink_12894894"><img
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
                                                <a href="javascript:;" target="_blank" title="游记1">${t.title}</a></h3>
                                            <div class="note_more">

                                                <span class="MInfoNum"><i class="MIcoView"></i><em>${t.viewnum}
                                                    /${t.replynum}</em></span>

                                                <span class="MInfoNum"><i
                                                        class="MIcoStar"></i><em>${t.favornum}</em></span>
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
                    <#--data-japp="articleding" rel="nofollow" data-iid="12878770"-->
                    <#--data-vote="0" title="顶一下">顶</a>-->
                    <#--</div>-->
                    <#--<div class="note_info">-->
                    <#--<h3>-->
                    <#--<a href="javascript:;" target="_blank" title="222222">222222</a>-->
                    <#--</h3>-->
                    <#--<div class="note_more">-->
                    <#--<span class="MInfoNum"><i class="MIcoView"></i><em>3/0</em></span>-->
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
                <div class="more_notes">
                    <a class="btn_deleted" href="javascript:;"><i></i>已删除游记</a>
                    <a href="javascript:;">共<strong>${total}</strong>篇游记 </a>
                </div>

            </div>
            <div class="common_block my_ask my_dp" id="_j_commentwrap">
                <div class="dp_list">
                    <ul>
                    <#if comments??>
                        <#list comments as c>
                            <li class="first">
                                <dl>
                                    <dt>
                                    <div class="dp_handles flt2">
                                        <div class="dp_ding flt2"><a role="button" title="顶一下" class="disabled"
                                                                     data-id="191713354"></a><strong class="_j_dingnum"
                                                                                                     style="display:none">0</strong>
                                        </div>
                                    </div>
                                    <div class="dp_title"><a href="/scenic/detail?scenicId=${c.scenicId!}"
                                                             target="_blank"><span>${c.scenicName!}</span><br></a>
                                    </div>
                                    <div class="MStar">
                                        <div class="review-score"><span class="star${c.overallScore!}"></span></div>
                                        <span class="MStarTips">顶</span>
                                    </div>
                                    </dt>
                                    <dd>
                                        <div class="dp_detail">
                                            <div class="dp_word">${c.content!}</div>
                                            <div class="poi-photo"
                                                 data-imgs="[{&quot;pic_url&quot;:&quot;http:\/\/b1-q.mafengwo.net\/s11\/M00\/E9\/3F\/wKgBEFrpYmyAKS38AARXP2BaPM403.jpeg?imageMogr2%2Fthumbnail%2F%2190x90r%2Fgravity%2FCenter%2Fcrop%2F%2190x90%2Fquality%2F90&quot;,&quot;pic_url1&quot;:&quot;http:\/\/b1-q.mafengwo.net\/s11\/M00\/E9\/3F\/wKgBEFrpYmyAKS38AARXP2BaPM403.jpeg&quot;}]">
                                                <#list c.pics as pic>
                                                    <a href="/scenic/detail?scenicId=${c.scenicId!}">
                                                        <img class="_j_poi_photo" src="${pic!}"
                                                             style="width: 120px;height: 120px;"
                                                             data-index="0">
                                                    </a>
                                                </#list>
                                            </div>
                                            <div class="dp_pics">
                                                <ul class="clearfix">
                                                </ul>
                                            </div>
                                            <div class="dp_comment MInfoNum"><i
                                                    class="MIcoComment"></i><span><strong>1</strong>条回复</span></div>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                        </#list>
                    </#if>
                    <#--<li>-->
                    <#--<dl>-->
                    <#--<dt>-->
                    <#--<div class="dp_handles flt2">-->
                    <#--<div class="dp_ding flt2"><a role="button" title="顶一下" class="disabled"-->
                    <#--data-id="191713351"></a><strong class="_j_dingnum"-->
                    <#--style="display:none">0</strong></div>-->
                    <#--</div>-->
                    <#--<div class="dp_title"><a href="javascript:;"-->
                    <#--target="_blank"><span>普吉岛机场酒店</span><br>Phuket Airport Inn</a></div>-->
                    <#--<div class="MStar">-->
                    <#--<div class="MStarIco MStarL3"><span></span></div>-->
                    <#--<span class="MStarTips">一般般</span>-->
                    <#--</div>-->
                    <#--</dt>-->
                    <#--<dd>-->
                    <#--<div class="dp_detail">-->
                    <#--<div class="dp_word">普吉岛机场酒店 Phuket Airport Inn</div>-->
                    <#--<div class="dp_pics">-->
                    <#--<ul class="clearfix">-->
                    <#--</ul>-->
                    <#--</div>-->
                    <#--<div class="dp_comment MInfoNum"><i-->
                    <#--class="MIcoComment"></i><span><strong>0</strong>条回复</span></div>-->
                    <#--</div>-->
                    <#--</dd>-->
                    <#--</dl>-->
                    <#--</li>-->
                    </ul>
                </div>
                <div class="more_notes">
                    <a href="javascript:;">共<strong>${replyNum}</strong>点评</a>
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