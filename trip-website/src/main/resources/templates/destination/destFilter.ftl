<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>目的地筛选</title>
    <link href="/styles/dest/dest/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/destfilter/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/destfilter/destfilter.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/theme/destfilter.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <link href="https://css.mafengwo.net/css/mfw-footer.css?1558532347" rel="stylesheet" type="text/css"/>
<#--浏览历史JS-->
<#include "../common/headerJSBroHistory.ftl">
</head>


<body>
    <#assign currentNav="destination">
    <#include "../common/navbar.ftl">
<div class="container">
    <div class="row-top">
        <div class="wrapper">
            <div class="top-bar">
                <div class="crumb">
                    <div class="item"><a href="javascript:;" target="_blank">目的地</a><em>&gt;</em></div>
                    <div class="item cur">目的地筛选</div>
                </div>
            </div>
            <div class="filter-title">目的地筛选</div>
            <div class="filter-nav">
                <dl class="clearfix search_time">
                    <dt>时间</dt>
                    <dd class="J_dd">
                        <div class="month clearfix">
                            <a class="on" href="javascript:void(0)" data-mid="-1">不限</a>
                                <#list months as m>
                                <a href="javascript:void(0)" class="destinationSearch" data-mid="${m.id!}">${m.name}</a>
                                </#list>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="11">11月</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="12">12月</a>
                        </div>
                        <#--<div class="festival clearfix">-->
                                <#--<#list holidays as h>-->
                                    <#--<a href="javascript:void(0)" class="destinationSearch" data-tid="${h.id}">${h.name}</a>-->
                                <#--</#list>-->
                        <#--</div>-->
                        <div class="festival clearfix">
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="1">元旦</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="2">春节</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="4">清明</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="5">五一</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="6">端午</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="9">中秋</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="10">国庆</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="2">寒假</a>
                            <a href="javascript:void(0)" class="destinationSearch" data-mid="8">暑假</a>
                        </div>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>主题</dt>
                    <dd class="J_dd theme_dest">
                        <a class="on" href="javascript:void(0)" data-themeid="-1">不限</a>
                        <div class="sub-nav">
                            <dl class="clearfix">
                                <dt>全年适宜：</dt>
                                <dd>
                                    <#list allYear as y>
                                        <a href="javascript:void(0)"  data-themeid="${y.id}">${y.name}</a>
                                    </#list>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>季节：</dt>
                                <dd>
                                        <#list seasons as mon>
                                            <a href="javascript:void(0)"  data-themeid="${mon.id}">${mon.name}</a>
                                        </#list>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>出行方式：</dt>
                                <dd>
                                        <#list ways as met>
                                            <a href="javascript:void(0)"  data-themeid="${met.id}">${met.name}</a>
                                        </#list>
                                </dd>
                            </dl>
                        </div>
                    </dd>
                </dl>
                <dl class="clearfix">
                    <dt>天数</dt>
                    <dd class="J_dd search_day">
                        <a class="on" href="javascript:void(0)" data-daytype="-1">不限</a>
                        <a href="javascript:void(0)" class="destinationSearch" data-daytype="5">2-3天</a>
                        <a href="javascript:void(0)" class="destinationSearch" data-daytype="6">4-5天</a>
                        <a href="javascript:void(0)" class="destinationSearch" data-daytype="7">6-9天</a>
                        <a href="javascript:void(0)" class="destinationSearch" data-daytype="8">10天及以上</a>

                    </dd>
                </dl>
            <#--数据-->
                <form action="/destination/searchPage" method="post" id="searchForm">
                    <input type="hidden" name="currentPage" id="currentPage" value="1">
                    <#--<input type="hidden" name="type" id="type" value="-1">-->
                    <input type="hidden" name="timeId" id="timeId" value="-1">
                    <input type="hidden" name="themeId" id="themeId" value="-1">
                    <input type="hidden" name="dayType" id="dayType" value="-1">
                <#--<div id="destinationSearchPageData">

                </div>-->
                    <div class="row-list">
                        <div class="wrapper" id="destinationSearchPageData">
                        <#--查询出目的地数据-->
                    </div>
                        </div>

            </div>
        </div>
    </div>

    <#--<div id="destinationSearchPageData">

    </div>-->
        <div class="row-list">
            <div class="wrapper" id="destinationSearchPageData">
            <#--查询出目的地数据-->
            </div>
        </div>

    </form>
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