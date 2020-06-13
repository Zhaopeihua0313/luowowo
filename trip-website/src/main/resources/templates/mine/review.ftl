<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的游记</title>
    <link href="../styles/base.css" rel="stylesheet" type="text/css">
    <link href="../styles/review.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
</head>

<#assign currentMineNav="reviews"/>

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
            <#include "../common/mineMenu.ftl">
            </div>
        </div>
    </div>
    <div class="wrapper">
        <div class="line-main">
            <div class="reviews-nums pad_left" id="_j_topfilter">
                <ul class="clearfix">
                    <li class="num-gold _j_filter" data-filter="2">
                        <a role="button">
                            <i class="icon-gold"></i><b>1</b><br>金牌点评<span class="split"></span>
                        </a>
                    </li>
                    <li class="num-reviews _j_filter on" data-filter="0">
                        <a role="button">
                            <b>${commentsNum}</b><br>点评<span class="split"></span>
                        </a>
                    </li>
                    <li class="num-ding _j_filter" data-filter="1">
                        <a role="button">
                            <b>2</b><br><i class="icon-ding"></i>点赞<span class="split"></span>
                        </a>
                    </li>
                    <li class="num-notReviews _j_filter" data-filter="3">
                        <a role="button">
                            <b>0</b><br>未点评<span class="split"></span>
                        </a>
                    </li>
                </ul>
                <!-- <div class="btn_review"><a href="javascript:;" target="_blank">写点评</a></div> -->
            </div>

            <div class="reviews-list">
                <div id="_j_poilist">
                <#list comments as c>
                    <div class="poi-item  have _j_poiitem _j_poiitem_5422742 _j_commentitem_191713354"
                         data-lng="98.2974353" data-lat="8.0902522" data-typeid="3" data-itemid="191713354">
                            <span class="cover">
                                <a href="javascript:;" target="_blank"><img
                                        src="http://n3-q.mafengwo.net/s6/M00/B7/6F/wKgB4lKyW6SAbKw4AAOCFQ2cSXw78.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90"
                                        style="width: 120px;height: 120px;"></a>
                            </span>
                        <div class="poi-detail">
                                <span class="s-ding">
                                    <a class="icon-ding disabled"></a>
                                    <span class="_j_dingnum hide">0</span>
                                </span>
                            <h3 class="title"><a href="/scenic/detail?scenicId=${c.scenicId!}"
                                                 target="_blank">${c.scenicName!}<br><span></span></a>
                            </h3>
                            <div class="rating" data-star="3" data-originstar="3">
                                <div class="review-score" data-japp="comment_dialog" data-jappconf="path"
                                     data-source="24" data-poi_id="5422742" data-commentid="191713354"
                                     data-typeid="3">
                                    <span class="star${c.overallScore!}"></span>
                                </div>
                                <div class="info">
                                    <span class="tip" style="margin-left:0"></span>

                                <#--<span>公共服务3</span>-->
                                <#--<span>风光3</span> <span>当地特色3</span>-->
                                </div>
                            </div>
                            <div class="poi-rev _j_comment">
                            ${c.content!}
                            </div>
                            <div class="poi-photo"
                                 data-imgs="[{&quot;pic_url&quot;:&quot;http:\/\/b1-q.mafengwo.net\/s11\/M00\/E9\/3F\/wKgBEFrpYmyAKS38AARXP2BaPM403.jpeg?imageMogr2%2Fthumbnail%2F%2190x90r%2Fgravity%2FCenter%2Fcrop%2F%2190x90%2Fquality%2F90&quot;,&quot;pic_url1&quot;:&quot;http:\/\/b1-q.mafengwo.net\/s11\/M00\/E9\/3F\/wKgBEFrpYmyAKS38AARXP2BaPM403.jpeg&quot;}]">
                                <#list c.pics as pic>
                                    <a><img class="_j_poi_photo" src="${pic!}" style="width: 120px;height: 120px;"
                                            data-index="0"></a>
                                </#list>
                            </div>
                        </div>
                        <div class="poi-btns">
                            <div class="option" id="_j_pluplader_btn_container_1">
                                <a class="btn-addPhoto _j_addimg" data-poiid="5422742" data-poiname="斯里纳斯国家海洋公园"
                                   data-commentid="191713354" role="button" title="添加图片"
                                   style="position: relative;"></a> <a class="btn-modfiy"
                                                                       data-japp="comment_dialog" data-jappconf="path"
                                                                       role="button" data-source="24"
                                                                       data-poi_id="5422742" data-commentid="191713354"
                                                                       data-typeid="3" title="编辑"></a>
                                <div id="html5_1dbk80mdq6b91fgd1jsjo0999e3_container"
                                     class="moxie-shim moxie-shim-html5"
                                     style="position: absolute; top: 0px; left: 0px; width: 21px; height: 18px; overflow: hidden; z-index: -1;">
                                    <input id="html5_1dbk80mdq6b91fgd1jsjo0999e3" type="file"
                                           style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;"
                                           multiple="" accept="image/jpeg,image/gif,image/png,.JPEG"></div>
                            </div>
                        </div>
                        <div class="poi-btns">
                            <span class="time">${c.createTime?string('yyyy-MM-dd HH:mm:ss')}</span></div>
                        <div class="reply hide">
                            <ul>

                            </ul>
                            <div class="more _j_morereply hide"><a>还有-2条回复</a></div>
                            <div class="add _j_editreply hide">
                                <textarea></textarea>
                                <div>
                                    <a class="btn btn-cancel _j_cancel">取消</a>
                                    <a class="btn btn-submit _j_sunmitreply" data-commentid="191713354">回复</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <#--<div class="poi-item  have _j_poiitem _j_poiitem_6553036 _j_commentitem_191713351"-->
                <#--data-lng="98.30631" data-lat="8.0986" data-typeid="2" data-itemid="191713351">-->
                <#--<span class="cover">-->
                <#--<a href="javascript:;" target="_blank"><img-->
                <#--src="http://p1-q.mafengwo.net/s12/M00/74/F6/wKgED1urQOSAczCIAANNAp1Y29o80.jpeg?imageMogr2%2Fthumbnail%2F%21120x120r%2Fgravity%2FCenter%2Fcrop%2F%21120x120%2Fquality%2F90"-->
                <#--style="width: 120px;height: 120px;"></a>-->
                <#--</span>-->
                <#--<div class="poi-detail">-->
                <#--<span class="s-ding">-->
                <#--<a class="icon-ding disabled"></a>-->
                <#--<span class="_j_dingnum hide">0</span>-->
                <#--</span>-->
                <#--<h3 class="title"><a href="javascript:;" target="_blank">普吉岛机场酒店<br><span>Phuket-->
                <#--Airport Inn</span></a></h3>-->
                <#--<div class="rating" data-star="3" data-originstar="3">-->
                <#--<div class="review-score" data-japp="comment_dialog" data-jappconf="path"-->
                <#--data-source="24" data-poi_id="6553036" data-commentid="191713351"-->
                <#--data-typeid="2">-->
                <#--<span class="star3"></span>-->
                <#--</div>-->
                <#--<div class="info">-->
                <#--<span class="tip" style="margin-left:0">一般般</span>-->

                <#--<span>位置3</span> <span>清洁度3</span> <span>设施3</span> <span>服务3</span>-->
                <#--<span>舒适度3</span> <span>餐饮1</span>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="poi-rev _j_comment">-->
                <#--普吉岛机场酒店 Phuket Airport Inn-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="poi-btns">-->
                <#--<div class="option" id="_j_pluplader_btn_container_2">-->
                <#--<a class="btn-addPhoto _j_addimg" data-poiid="6553036"-->
                <#--data-poiname="普吉岛机场酒店 Phuket Airport Inn" data-commentid="191713351"-->
                <#--role="button" title="添加图片" style="position: relative;"></a> <a-->
                <#--class="btn-modfiy" data-japp="comment_dialog" data-jappconf="path" role="button"-->
                <#--data-source="24" data-poi_id="6553036" data-commentid="191713351"-->
                <#--data-typeid="2" title="编辑"></a>-->
                <#--<div id="html5_1dbk80mnr83v1i783mg16djt268_container"-->
                <#--class="moxie-shim moxie-shim-html5"-->
                <#--style="position: absolute; top: 0px; left: 0px; width: 21px; height: 18px; overflow: hidden; z-index: -1;">-->
                <#--<input id="html5_1dbk80mnr83v1i783mg16djt268" type="file"-->
                <#--style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;"-->
                <#--multiple="" accept="image/jpeg,image/gif,image/png,.JPEG"></div>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="poi-btns">-->
                <#--<span class="time">2019-05-22 17:52:19</span></div>-->
                <#--<div class="reply hide">-->
                <#--<ul>-->

                <#--</ul>-->
                <#--<div class="more _j_morereply hide"><a>还有-2条回复</a></div>-->
                <#--<div class="add _j_editreply hide">-->
                <#--<textarea></textarea>-->
                <#--<div>-->
                <#--<a class="btn btn-cancel _j_cancel">取消</a>-->
                <#--<a class="btn btn-submit _j_sunmitreply" data-commentid="191713351">回复</a>-->
                <#--</div>-->
                <#--</div>-->
                <#--</div>-->
                <#--</div>-->
                </#list>
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