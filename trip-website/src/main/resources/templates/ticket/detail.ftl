<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${scenic.name} 门票价格团购/预订【骡窝窝门票】</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/color.css" rel="stylesheet" type="text/css">
    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/styles/ticketDetail.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">

    <link rel="canonical" href="http://ticket.lvmama.com/scenic-152470">
    <style>
        #introduction img {
            padding: 10px;
        }

        .dpnew_enter {
            position: relative;
        }

        .dpnew_enter_pic {
            position: absolute;
            left: 607px;
            top: 49px;
            z-index: 2;
            width: 179px;
            height: 95px;
        }
    </style>
    <link rel="stylesheet" href="http://pic.lvmama.com/js/ui/lvmamaUI/css/jquery.common.css">
    <style type="text/css">
        .BMap_mask {
            background: transparent url(about:blank);
        }

        .BMap_noscreen {
            display: none;
        }

        .BMap_button {
            cursor: pointer;
        }

        .BMap_zoomer {
            background-image: url(http://api.map.baidu.com/images/mapctrls1d3.gif);
            background-repeat: no-repeat;
            overflow: hidden;
            font-size: 1px;
            position: absolute;
            width: 7px;
            height: 7px;
        }

        .BMap_stdMpCtrl div {
            position: absolute;
        }

        .BMap_stdMpPan {
            width: 44px;
            height: 44px;
            overflow: hidden;
            background: url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat;
        }

        .BMap_ie6 .BMap_stdMpPan {
            background: none;
        }

        .BMap_ie6 .BMap_smcbg {
            left: 0;
            width: 44px;
            height: 464px;
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://api.map.baidu.com/images/mapctrls2d0.png');
        }

        .BMap_ie6 .BMap_stdMpPanBg {
            z-index: -1;
        }

        .BMap_stdMpPan .BMap_button {
            height: 15px;
            width: 15px;
        }

        .BMap_panN, .BMap_panW, .BMap_panE, .BMap_panS {
            overflow: hidden;
        }

        .BMap_panN {
            left: 14px;
            top: 0;
        }

        .BMap_panW {
            left: 1px;
            top: 12px;
        }

        .BMap_panE {
            left: 27px;
            top: 12px;
        }

        .BMap_panS {
            left: 14px;
            top: 25px;
        }

        .BMap_stdMpZoom {
            top: 45px;
            overflow: hidden;
        }

        .BMap_stdMpZoom .BMap_button {
            width: 22px;
            height: 21px;
            left: 12px;
            overflow: hidden;
            background-image: url(http://api.map.baidu.com/images/mapctrls2d0.png);
            background-repeat: no-repeat;
            z-index: 10;
        }

        .BMap_ie6 .BMap_stdMpZoom .BMap_button {
            background: none;
        }

        .BMap_stdMpZoomIn {
            background-position: 0 -221px;
        }

        .BMap_stdMpZoomOut {
            background-position: 0 -265px;
        }

        .BMap_ie6 .BMap_stdMpZoomIn div {
            left: 0;
            top: -221px;
        }

        .BMap_ie6 .BMap_stdMpZoomOut div {
            left: 0;
            top: -265px;
        }

        .BMap_stdMpType4 .BMap_stdMpZoom .BMap_button {
            left: 0;
            overflow: hidden;
            background: -webkit-gradient(linear, 50% 0, 50% 100%, from(rgba(255, 255, 255, 0.85)), to(rgba(217, 217, 217, 0.85)));
            z-index: 10;
            -webkit-border-radius: 22px;
            width: 34px;
            height: 34px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            -webkit-box-shadow: 0 2px 3.6px #CCC;
            display: -webkit-box;
            -webkit-box-align: center;
            -webkit-box-pack: center;
            -webkit-box-sizing: border-box;
        }

        .BMap_stdMpType4 .BMap_smcbg {
            position: static;
            background: url(http://api.map.baidu.com/images/mapctrls2d0_mb.png) 0 0 no-repeat;
            -webkit-background-size: 24px 32px;
        }

        .BMap_stdMpType4 .BMap_stdMpZoomIn {
            background-position: 0 0;
        }

        .BMap_stdMpType4 .BMap_stdMpZoomIn .BMap_smcbg {
            width: 24px;
            height: 24px;
            background-position: 0 0;
        }

        .BMap_stdMpType4 .BMap_stdMpZoomOut {
            background-position: 0 0;
        }

        .BMap_stdMpType4 .BMap_stdMpZoomOut .BMap_smcbg {
            width: 24px;
            height: 6px;
            background-position: 0 -25px;
        }

        .BMap_stdMpSlider {
            width: 37px;
            top: 18px;
        }

        .BMap_stdMpSliderBgTop {
            left: 18px;
            width: 10px;
            overflow: hidden;
            background: url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat -23px -226px;
        }

        .BMap_stdMpSliderBgBot {
            left: 19px;
            height: 8px;
            width: 10px;
            top: 124px;
            overflow: hidden;
            background: url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat -33px bottom;
        }

        .BMap_ie6 .BMap_stdMpSliderBgTop, .BMap_ie6 .BMap_stdMpSliderBgBot {
            background: none;
        }

        .BMap_ie6 .BMap_stdMpSliderBgTop div {
            left: -23px;
            top: -226px;
        }

        .BMap_ie6 .BMap_stdMpSliderBgBot div {
            left: -33px;
            bottom: 0;
        }

        .BMap_stdMpSliderMask {
            height: 100%;
            width: 24px;
            left: 10px;
            cursor: pointer;
        }

        .BMap_stdMpSliderBar {
            height: 11px;
            width: 19px;
            left: 13px;
            top: 80px;
            overflow: hidden;
            background: url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat 0 -309px;
        }

        .BMap_stdMpSliderBar.h {
            background: url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat 0 -320px;
        }

        .BMap_ie6 .BMap_stdMpSliderBar, .BMap_ie6 .BMap_stdMpSliderBar.h {
            background: none;
        }

        .BMap_ie6 .BMap_stdMpSliderBar div {
            top: -309px;
        }

        .BMap_ie6 .BMap_stdMpSliderBar.h div {
            top: -320px;
        }

        .BMap_zlSt, .BMap_zlCity, .BMap_zlProv, .BMap_zlCountry {
            position: absolute;
            left: 34px;
            height: 21px;
            width: 28px;
            background-image: url(http://api.map.baidu.com/images/mapctrls2d0.png);
            background-repeat: no-repeat;
            font-size: 0;
            cursor: pointer;
        }

        .BMap_ie6 .BMap_zlSt, .BMap_ie6 .BMap_zlCity, .BMap_ie6 .BMap_zlProv, .BMap_ie6 .BMap_zlCountry {
            background: none;
            overflow: hidden;
        }

        .BMap_zlHolder {
            display: none;
            position: absolute;
            top: 0;
        }

        .BMap_zlHolder.hvr {
            display: block;
        }

        .BMap_zlSt {
            background-position: 0 -380px;
            top: 21px;
        }

        .BMap_zlCity {
            background-position: 0 -401px;
            top: 57px;
        }

        .BMap_zlProv {
            background-position: 0 -422px;
            top: 81px;
        }

        .BMap_zlCountry {
            background-position: 0 -443px;
            top: 105px;
        }

        .BMap_ie6 .BMap_zlSt div {
            top: -380px;
        }

        .BMap_ie6 .BMap_zlCity div {
            top: -401px;
        }

        .BMap_ie6 .BMap_zlProv div {
            top: -422px;
        }

        .BMap_ie6 .BMap_zlCountry div {
            top: -443px;
        }

        .BMap_stdMpType1 .BMap_stdMpSlider, .BMap_stdMpType2 .BMap_stdMpSlider, .BMap_stdMpType3 .BMap_stdMpSlider, .BMap_stdMpType4 .BMap_stdMpSlider, .BMap_stdMpType2 .BMap_stdMpZoom, .BMap_stdMpType3 .BMap_stdMpPan, .BMap_stdMpType4 .BMap_stdMpPan {
            display: none;
        }

        .BMap_stdMpType3 .BMap_stdMpZoom {
            top: 0;
        }

        .BMap_stdMpType4 .BMap_stdMpZoom {
            top: 0;
        }

        .BMap_cpyCtrl a {
            font-size: 11px;
            color: #7979CC;
        }

        .BMap_scaleCtrl {
            height: 23px;
            overflow: hidden;
        }

        .BMap_scaleCtrl div.BMap_scaleTxt {
            font-size: 11px;
            font-family: Arial, sans-serif;
        }

        .BMap_scaleCtrl div {
            position: absolute;
            overflow: hidden;
        }

        .BMap_scaleHBar img, .BMap_scaleLBar img, .BMap_scaleRBar img {
            position: absolute;
            width: 37px;
            height: 442px;
            left: 0;
        }

        .BMap_scaleHBar {
            width: 100%;
            height: 5px;
            font-size: 0;
            bottom: 0;
        }

        .BMap_scaleHBar img {
            top: -437px;
            width: 100%;
        }

        .BMap_scaleLBar, .BMap_scaleRBar {
            width: 3px;
            height: 9px;
            bottom: 0;
            font-size: 0;
            z-index: 1;
        }

        .BMap_scaleLBar img {
            top: -427px;
            left: 0;
        }

        .BMap_scaleRBar img {
            top: -427px;
            left: -5px;
        }

        .BMap_scaleLBar {
            left: 0;
        }

        .BMap_scaleRBar {
            right: 0;
        }

        .BMap_scaleTxt {
            text-align: center;
            width: 100%;
            cursor: default;
            line-height: 18px;
        }

        .BMap_omCtrl {
            background-color: #fff;
            overflow: hidden;
        }

        .BMap_omOutFrame {
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
        }

        .BMap_omInnFrame {
            position: absolute;
            border: 1px solid #999;
            background-color: #ccc;
            overflow: hidden;
        }

        .BMap_omMapContainer {
            position: absolute;
            overflow: hidden;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
        }

        .BMap_omViewMv {
            border-width: 1px;
            border-style: solid;
            border-left-color: #84b0df;
            border-top-color: #adcff4;
            border-right-color: #274b8b;
            border-bottom-color: #274b8b;
            position: absolute;
            z-index: 600;
        }

        .BMap_omViewInnFrame {
            border: 1px solid #3e6bb8;
        }

        .BMap_omViewMask {
            width: 1000px;
            height: 1000px;
            position: absolute;
            left: 0;
            top: 0;
            background-color: #68c;
            opacity: .2;
            filter: progid:DXImageTransform.Microsoft.Alpha(opacity=20);
        }

        .BMap_omBtn {
            height: 13px;
            width: 13px;
            position: absolute;
            cursor: pointer;
            overflow: hidden;
            background: url(http://api.map.baidu.com/images/mapctrls1d3.gif) no-repeat;
            z-index: 1210;
        }

        .anchorBR .BMap_omOutFrame {
            border-top: 1px solid #999;
            border-left: 1px solid #999;
        }

        .quad4 .BMap_omBtn {
            background-position: -26px -27px;
        }

        .quad4 .BMap_omBtn.hover {
            background-position: 0 -27px;
        }

        .quad4 .BMap_omBtn.BMap_omBtnClosed {
            background-position: -39px -27px;
        }

        .quad4 .BMap_omBtn.BMap_omBtnClosed.hover {
            background-position: -13px -27px;
        }

        .anchorTR .BMap_omOutFrame {
            border-bottom: 1px solid #999;
            border-left: 1px solid #999;
        }

        .quad1 .BMap_omBtn {
            background-position: -39px -41px;
        }

        .quad1 .BMap_omBtn.hover {
            background-position: -13px -41px;
        }

        .quad1 .BMap_omBtn.BMap_omBtnClosed {
            background-position: -26px -41px;
        }

        .quad1 .BMap_omBtn.BMap_omBtnClosed.hover {
            background-position: 0 -41px;
        }

        .anchorBL .BMap_omOutFrame {
            border-top: 1px solid #999;
            border-right: 1px solid #999;
        }

        .quad3 .BMap_omBtn {
            background-position: -27px -40px;
        }

        .quad3 .BMap_omBtn.hover {
            background-position: -1px -40px;
        }

        .quad3 .BMap_omBtn.BMap_omBtnClosed {
            background-position: -40px -40px;
        }

        .quad3 .BMap_omBtn.BMap_omBtnClosed.hover {
            background-position: -14px -40px;
        }

        .anchorTL .BMap_omOutFrame {
            border-bottom: 1px solid #999;
            border-right: 1px solid #999;
        }

        .quad2 .BMap_omBtn {
            background-position: -40px -28px;
        }

        .quad2 .BMap_omBtn.hover {
            background-position: -14px -28px;
        }

        .quad2 .BMap_omBtn.BMap_omBtnClosed {
            background-position: -27px -28px;
        }

        .quad2 .BMap_omBtn.BMap_omBtnClosed.hover {
            background-position: -1px -28px;
        }

        .anchorR .BMap_omOutFrame {
            border-bottom: 1px solid #999;
            border-left: 1px solid #999;
            border-top: 1px solid #999;
        }

        .anchorL .BMap_omOutFrame {
            border-bottom: 1px solid #999;
            border-right: 1px solid #999;
            border-top: 1px solid #999;
        }

        .anchorB .BMap_omOutFrame {
            border-top: 1px solid #999;
            border-left: 1px solid #999;
            border-right: 1px solid #999;
        }

        .anchorT .BMap_omOutFrame {
            border-bottom: 1px solid #999;
            border-right: 1px solid #999;
            border-left: 1px solid #999;
        }

        .anchorNon .BMap_omOutFrame, .withOffset .BMap_omOutFrame {
            border: 1px solid #999;
        }

        .BMap_zoomMask0, .BMap_zoomMask1 {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: transparent url(http://api.map.baidu.com/images/blank.gif);
            z-index: 1000;
        }

        .BMap_contextMenu {
            position: absolute;
            border-top: 1px solid #adbfe4;
            border-left: 1px solid #adbfe4;
            border-right: 1px solid #8ba4d8;
            border-bottom: 1px solid #8ba4d8;
            padding: 0;
            margin: 0;
            width: auto;
            visibility: hidden;
            background: #fff;
            z-index: 10000000;
        }

        .BMap_cmShadow {
            position: absolute;
            background: #000;
            opacity: .3;
            filter: alpha(opacity=30);
            visibility: hidden;
            z-index: 9000000;
        }

        div.BMap_cmDivider {
            border-bottom: 1px solid #adbfe4;
            font-size: 0;
            padding: 1px;
            margin: 0 6px;
        }

        div.BMap_cmFstItem {
            margin-top: 2px;
        }

        div.BMap_cmLstItem {
            margin-bottom: 2px;
        }

        .BMap_shadow img {
            border: 0 none;
            margin: 0;
            padding: 0;
            position: absolute;
            height: 370px;
            width: 1144px;
        }

        .BMap_pop .BMap_top {
            border-top: 1px solid #ababab;
            background-color: #fff;
        }

        .BMap_pop .BMap_center {
            border-left: 1px solid #ababab;
            border-right: 1px solid #ababab;
            background-color: #fff;
        }

        .BMap_pop .BMap_bottom {
            border-bottom: 1px solid #ababab;
            background-color: #fff;
        }

        .BMap_shadow, .BMap_shadow img, .BMap_shadow div {
            -moz-user-select: none;
            -webkit-user-select: none;
        }

        .BMap_checkbox {
            background: url(http://api.map.baidu.com/images/mapctrls1d3.gif);
            vertical-align: middle;
            display: inline-block;
            width: 11px;
            height: 11px;
            margin-right: 4px;
            background-position: -14px 90px;
        }

        .BMap_checkbox.checked {
            background-position: -2px 90px;
        }

        .BMap_pop .BMap_top img, .BMap_pop .BMap_center img, .BMap_pop .BMap_bottom img {
            display: none;
        }

        @media print {
            .BMap_noprint {
                display: none;
            }

            .BMap_noscreen {
                display: block;
            }

            .BMap_mask {
                background: none;
            }

            .BMap_pop .BMap_top img, .BMap_pop .BMap_center img, .BMap_pop .BMap_bottom img {
                display: block;
            }
        }

        .BMap_vectex {
            cursor: pointer;
            width: 11px;
            height: 11px;
            position: absolute;
            background-repeat: no-repeat;
            background-position: 0 0;
        }

        .BMap_vectex_nodeT {
            background-image: url(http://api.map.baidu.com/images/nodeT.gif);
        }

        .BMap_vectex_node {
            background-image: url(http://api.map.baidu.com/images/node.gif);
        }
    </style>
</head>


<body class="ticket responsive ticket_revision" allyes_city="GZ">


<#assign currentNav="ticket">
<#include "../common/navbar.ftl">

<div class="body_bg">
    <div class="dest-main">

        <#--景点简单信息-->
        <div class="overview">
            <div class="dtitle clearfix">
			<span class="xorder">
                <span class="price"><dfn>¥<i>
                    <#--price-->
                    ${(mixTicket.salePrice)!}</i></dfn>起</span>
                <#--购买 预定按钮-->
                <a href="#destorder" class="btn btn-large btn-reision"><span class="btn-text">立即预订</span></a>
			</span>
                <#--景点名称-->
                <div class="titbox">
                    <h1 class="tit" title="${(scenic.name)!}">${(scenic.name)!}</h1>
                    <span class="mp_star"><i>${scenic.visitnum}</i> 人去过</span>
                    <span class="tags-revision">门票价格团购/预订</span>
                </div>
            </div>
            <div class="dcontent clearfix">
                <!--组装产品图片-->
                <div class="ticket_img_scroll">

                    <div class="datu fl">
                        <a href="javascript:;" class="datu_prev"></a>
                        <a href="javascript:;" class="datu_next"></a>
                        <ul class="pic_mod_ul">
                            <li style="display: list-item;">
                                <img src="${(scenic.coverUrl)!}" id="bigImg"
                                    width="462" height="308">
                            </li>
                        </ul>
                    </div>
                    <div class="xtu fr" style="height: 271px;">

                        <dl class="pic_tab_dl picTab" style="width: 95px; top: 0px;">
                            <#--景点相册-->
                            <#list photosArr as photo>
                                <dd>
                                    <img src="${photo}" width="95" height="64"><div class="ticket_meng"></div>
                                </dd>
                            </#list>
                            <dt style="top: 0px;"></dt></dl>
                    </div>

                </div>
                <div class="dinfo">
                    <div class="sec-info">
                        <div class="sec-inner">
                            <p class="btn_collect clearfix">
                                <span class="icon icon_collectXin"></span>
                                <span class="collectText">关注</span>
                                <span class="collectedText">已关注</span>
                                <span class="cancelText">取消关注</span>
                            </p>
                            <dl class="dl-hor">
                                <dt>景点地址：</dt>
                                <dd>
                                    <#--address-->
                                    <p class="linetext" title="${(scenic.location)!}">${(scenic.location)!}</p>
                                    <#--查看地图按钮-->
                                    <a href="https://map.baidu.com/search/${(scenic.name)!}/?querytype=s&da_src=shareurl&wd=${(scenic.name)!}&c=257&src=0&pn=0&sug=0&l=13"
                                       class="xlink" target="_blank">
                                        <i class="icon dicon-local"></i>查看地图
                                    </a>
                                </dd>
                            </dl>
                            <#--<dl class="dl-hor index3">
                                <dt>营业时间：</dt>
                                <dd class="hasdown">
                                    <p class="canHover">
                                        &lt;#&ndash;business_hours&ndash;&gt;
                                        ${(ticketDetail.business_hours)!}
                                        <i class="icon_arrow"></i>
                                    </p>
                                </dd>
                            </dl>-->

                            <dl class="dl-hor service_list">
                                <dt>服务保障：</dt>
                                <dd>
                                    <a href="javascript:;" class="service_poptip" tip-content="顺利入园，快速服务"><i
                                            class="icon_bz1"></i>入园保障</a>

                                    <a href="javascript:;" class="service_poptip" tip-content="信息可靠，如实描述"><i
                                            class="icon_bz6"></i>如实描述</a>
                                    <a href="javascript:;" class="service_poptip" tip-content="买贵就赔，保证便宜"><i
                                            class="icon_bz4"></i>贵就赔</a>
                                </dd>
                            </dl>

                            <dl class="dl-hor index3">
                                <dt>景点简介：</dt>
                                <dd class="hasdown">
                                    <p class="canHover">
                                    <#--business_hours-->
                                    ${(scenic.intro)!}
                                        <i class="icon_arrow"></i>
                                    </p>
                                </dd>
                            </dl>

                            <!--领券--><!-- test Y -->
                        </div>
                    </div>
                    <!--有精华点评显示下面的div-->

                </div>


            </div>
        </div>

        <#--景点门票头部-->
        <div id="destorder" class="tab-outer mt20">
            <div class="tab-dest tab-fixed" style="">
                <ul class="ul-hor js-ticketTab" style="border-bottom: #ff9d00 solid 2px;">
                    <li class="" style="background: #ff9d00;border: 1px solid #ff9d00;color: #ffffff">
                        <a href="javascript:;" style="color: #ffffff">景点门票</a>
                    </li>
                </ul>
                <span class="nav_tips pa">注：门票限网上及手机客户端预订，不接受电话预订。</span>
            </div>
        </div>
        <!-- 景点门票商品列表开始 -->
        <div class="dcontent dorder-list">
            <div class="dpro-list">
                <table class="ptable table-full" style="display: block;">
                    <#--门票列表头-->
                    <thead class="pttit">
                        <tr>
                            <td></td>
                            <td>
                                <dl class="ptditem">
                                    <dd class="pdpaytype">支付方式</dd>
                                    <dd class="pdlvprice">销售价</dd>
                                    <#--<dd class="pdprefer"></dd>-->
                                    <dd class="pdprice">
                                        门市价
                                    </dd>
                                    <dd class="pdAdvbookingTime">提前预订时间</dd>
                                    <dt class="pdname">产品名称</dt>
                                </dl>
                            </td>
                        </tr>
                    </thead>
                    <#--门票数据主体-->
                    <tbody class="ptbox short" id="24780798">

                        <#--循环票-->

                        <#if adultTickets?? >
                            <tr>
                                <#--票类型 成人票 儿童票等-->
                                <td class="ptdname" ><div class="ptname"><h5>成人票</h5></div></td>
                                <td>
                                    <div class="ptdlist">
                                        <div class="pdlist-inner">
                                            <!-- 这个是门票的时候价格表-->
                                        <#list adultTickets as ticket>
                                            <dl class="ptditem" style="width: 1059px;">
                                                <#--购买按按-->
                                                <dd class="pdpaytype">
                                                    <!-- 在线支付ipay 加 ipay-online 景区则不加-->
                                                    <span class="ipay ipay-online">
                                                        <a href="/ticket/addOrder?tid=${ticket.id}"
                                                            class="btn btn-w btn-small  btn-orange"
                                                            ticket_types="${ticket.catalogName}"
                                                            commodity_name="${ticket.name}"
                                                            commodity_price="${ticket.salePrice}"
                                                            ticket_submit_order_types="预订"
                                                            product_id="181554">预订
                                                        </a>
                                                         <i class="itype">
                                                             在线支付
                                                         </i>
                                                    </span>
                                                </dd>
                                                <#--销售价格-->
                                                <dd class="pdlvprice">
                                                    <#--price-->
                                                    <dfn>¥<i>${ticket.salePrice}</i></dfn>
                                                </dd>
                                                <#--市场价格-->
                                                <dd class="pdprice" <#--style="width: 88px;"-->>
                                                    <span class="JS_order_detail_poptip" style="font-size: 16px">
                                                        ¥${(ticket.marketPrice)!}
                                                     </span>
                                                </dd>
                                                <#--预定时间-->
                                                <dd class="pdAdvbookingTime"  <#--style="width: 250px;"-->>
                                                    ${(ticket.presetTime)!}
                                                </dd>
                                                <#--门票名称+标签-->
                                                <dt class="pdname">
                                                    <a href="javascript:;" class="ptlink service_poptip"
                                                       data1=""
                                                       <#--tip-content="433米·白云星空观光票-成人票 <span class='tagsback'><i>不可退</i></span>"-->>
                                                        ${(ticket.name)!}
                                                        <#--标签循环-->
                                                        <#list ticket.tagss as tag >
                                                            <span class="tagsback"><i>${tag.name}</i></span>
                                                        </#list>
                                                        <span class="icon_arrownew"></span>
                                                    </a>
                                                </dt>
                                                    <#--门票说明-->
                                                    <dd class="pdetails" style="display: none;">
                                                        <div class="tiptext tip-light">
                                                            <div class="tip-arrow tip-arrow-11">
                                                                <em>◆</em>
                                                                <i>◆</i>
                                                            </div>
                                                            <div class="tip-other">
                                                                <div class="pdetails-li">
                                                                    ${ticket.content.content}
                                                                    <#--<ul>
                                                                        <li><em class="pdl-tit">预订时间</em>
                                                                            <span class="tagsback"><i>随买随用</i></span>20:00前可订今日票，预订成功后可立即使用
                                                                        </li>
                                                                        <li><em class="pdl-tit">有效期限</em>(若门票使用人在游玩期间多次入园，必须出示门票，景区工作人员会验证是否为使用人本人。)指定游玩日当天内有效</li>

                                                                    </ul>-->
                                                                </div>
                                                            </div>
                                                            <a href="javascript:;" class="view-details">收起</a>
                                                        </div><!--//.tiptext-->
                                                    </dd>
                                            </dl>
                                        </#list>
                                            <!-- 列表循环结束-->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </#if>
                        <#if childTickets?? >
                            <tr>
                            <#--票类型 成人票 儿童票等-->
                                <td class="ptdname" ><div class="ptname"><h5>儿童票</h5></div></td>
                                <td>
                                    <div class="ptdlist">
                                        <div class="pdlist-inner">
                                            <!-- 这个是门票的时候价格表-->
                                            <#list childTickets as ticket>
                                                <dl class="ptditem" style="width: 1059px;">
                                                <#--购买按按-->
                                                    <dd class="pdpaytype">
                                                        <!-- 在线支付ipay 加 ipay-online 景区则不加-->
                                                        <span class="ipay ipay-online">
                                                        <a href="/ticket/addOrder?tid=${ticket.id}"
                                                           class="btn btn-w btn-small  btn-orange"
                                                           ticket_types="${ticket.catalogName}"
                                                           commodity_name="${ticket.name}"
                                                           commodity_price="${ticket.salePrice}"
                                                           ticket_submit_order_types="预订"
                                                           product_id="181554">预订
                                                        </a>
                                                         <i class="itype">
                                                             在线支付
                                                         </i>
                                                    </span>
                                                    </dd>
                                                <#--销售价格-->
                                                    <dd class="pdlvprice">
                                                    <#--price-->
                                                        <dfn>¥<i>${ticket.salePrice}</i></dfn>
                                                    </dd>
                                                <#--市场价格-->
                                                    <dd class="pdprice" <#--style="width: 88px;"-->>
                                                    <span class="JS_order_detail_poptip" style="font-size: 16px">
                                                        ¥${(ticket.marketPrice)!}
                                                     </span>
                                                    </dd>
                                                <#--预定时间-->
                                                    <dd class="pdAdvbookingTime"  <#--style="width: 250px;"-->>
                                                    ${(ticket.presetTime)!}
                                                    </dd>
                                                <#--门票名称+标签-->
                                                    <dt class="pdname">
                                                        <a href="javascript:;" class="ptlink service_poptip"
                                                           data1=""
                                                        <#--tip-content="433米·白云星空观光票-成人票 <span class='tagsback'><i>不可退</i></span>"-->>
                                                        ${(ticket.name)!}
                                                        <#--标签循环-->
                                                            <#list ticket.tagss as tag >
                                                                <span class="tagsback"><i>${tag.name}</i></span>
                                                            </#list>
                                                            <span class="icon_arrownew"></span>
                                                        </a>
                                                    </dt>
                                                <#--门票说明-->
                                                    <dd class="pdetails" style="display: none;">
                                                        <div class="tiptext tip-light">
                                                            <div class="tip-arrow tip-arrow-11">
                                                                <em>◆</em>
                                                                <i>◆</i>
                                                            </div>
                                                            <div class="tip-other">
                                                                <div class="pdetails-li">
                                                                ${ticket.content.content}
                                                                    <#--<ul>
                                                                        <li><em class="pdl-tit">预订时间</em>
                                                                            <span class="tagsback"><i>随买随用</i></span>20:00前可订今日票，预订成功后可立即使用
                                                                        </li>
                                                                        <li><em class="pdl-tit">有效期限</em>(若门票使用人在游玩期间多次入园，必须出示门票，景区工作人员会验证是否为使用人本人。)指定游玩日当天内有效</li>

                                                                    </ul>-->
                                                                </div>
                                                            </div>
                                                            <a href="javascript:;" class="view-details">收起</a>
                                                        </div><!--//.tiptext-->
                                                    </dd>
                                                </dl>
                                            </#list>
                                            <!-- 列表循环结束-->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </#if>
                        <#if elderlyTickets?? >
                            <tr>
                            <#--票类型 成人票 儿童票等-->
                                <td class="ptdname" ><div class="ptname"><h5>长者票</h5></div></td>
                                <td>
                                    <div class="ptdlist">
                                        <div class="pdlist-inner">
                                            <!-- 这个是门票的时候价格表-->
                                            <#list elderlyTickets as ticket>
                                                <dl class="ptditem" style="width: 1059px;">
                                                <#--购买按按-->
                                                    <dd class="pdpaytype">
                                                        <!-- 在线支付ipay 加 ipay-online 景区则不加-->
                                                        <span class="ipay ipay-online">
                                                        <a href="/ticket/addOrder?tid=${ticket.id}"
                                                           class="btn btn-w btn-small  btn-orange"
                                                           ticket_types="${ticket.catalogName}"
                                                           commodity_name="${ticket.name}"
                                                           commodity_price="${ticket.salePrice}"
                                                           ticket_submit_order_types="预订"
                                                           product_id="181554">预订
                                                        </a>
                                                         <i class="itype">
                                                             在线支付
                                                         </i>
                                                    </span>
                                                    </dd>
                                                <#--销售价格-->
                                                    <dd class="pdlvprice">
                                                    <#--price-->
                                                        <dfn>¥<i>${ticket.salePrice}</i></dfn>
                                                    </dd>
                                                <#--市场价格-->
                                                    <dd class="pdprice" <#--style="width: 88px;"-->>
                                                    <span class="JS_order_detail_poptip" style="font-size: 16px">
                                                        ¥${(ticket.marketPrice)!}
                                                     </span>
                                                    </dd>
                                                <#--预定时间-->
                                                    <dd class="pdAdvbookingTime"  <#--style="width: 250px;"-->>
                                                    ${(ticket.presetTime)!}
                                                    </dd>
                                                <#--门票名称+标签-->
                                                    <dt class="pdname">
                                                        <a href="javascript:;" class="ptlink service_poptip"
                                                           data1=""
                                                        <#--tip-content="433米·白云星空观光票-成人票 <span class='tagsback'><i>不可退</i></span>"-->>
                                                        ${(ticket.name)!}
                                                        <#--标签循环-->
                                                            <#list ticket.tagss as tag >
                                                                <span class="tagsback"><i>${tag.name}</i></span>
                                                            </#list>
                                                            <span class="icon_arrownew"></span>
                                                        </a>
                                                    </dt>
                                                <#--门票说明-->
                                                    <dd class="pdetails" style="display: none;">
                                                        <div class="tiptext tip-light">
                                                            <div class="tip-arrow tip-arrow-11">
                                                                <em>◆</em>
                                                                <i>◆</i>
                                                            </div>
                                                            <div class="tip-other">
                                                                <div class="pdetails-li">
                                                                ${ticket.content.content}
                                                                    <#--<ul>
                                                                        <li><em class="pdl-tit">预订时间</em>
                                                                            <span class="tagsback"><i>随买随用</i></span>20:00前可订今日票，预订成功后可立即使用
                                                                        </li>
                                                                        <li><em class="pdl-tit">有效期限</em>(若门票使用人在游玩期间多次入园，必须出示门票，景区工作人员会验证是否为使用人本人。)指定游玩日当天内有效</li>

                                                                    </ul>-->
                                                                </div>
                                                            </div>
                                                            <a href="javascript:;" class="view-details">收起</a>
                                                        </div><!--//.tiptext-->
                                                    </dd>
                                                </dl>
                                            </#list>
                                            <!-- 列表循环结束-->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </#if>
                        <#if generalTickets?? >
                            <tr>
                            <#--票类型 成人票 儿童票等-->
                                <td class="ptdname" ><div class="ptname"><h5>通用票</h5></div></td>
                                <td>
                                    <div class="ptdlist">
                                        <div class="pdlist-inner">
                                            <!-- 这个是门票的时候价格表-->
                                            <#list generalTickets as ticket>
                                                <dl class="ptditem" style="width: 1059px;">
                                                <#--购买按按-->
                                                    <dd class="pdpaytype">
                                                        <!-- 在线支付ipay 加 ipay-online 景区则不加-->
                                                        <span class="ipay ipay-online">
                                                        <a href="/ticket/addOrder?tid=${ticket.id}"
                                                           class="btn btn-w btn-small  btn-orange"
                                                           ticket_types="${ticket.catalogName}"
                                                           commodity_name="${ticket.name}"
                                                           commodity_price="${ticket.salePrice}"
                                                           ticket_submit_order_types="预订"
                                                           product_id="181554">预订
                                                        </a>
                                                         <i class="itype">
                                                             在线支付
                                                         </i>
                                                    </span>
                                                    </dd>
                                                <#--销售价格-->
                                                    <dd class="pdlvprice">
                                                    <#--price-->
                                                        <dfn>¥<i>${ticket.salePrice}</i></dfn>
                                                    </dd>
                                                <#--市场价格-->
                                                    <dd class="pdprice" <#--style="width: 88px;"-->>
                                                    <span class="JS_order_detail_poptip" style="font-size: 16px">
                                                        ¥${(ticket.marketPrice)!}
                                                     </span>
                                                    </dd>
                                                <#--预定时间-->
                                                    <dd class="pdAdvbookingTime"  <#--style="width: 250px;"-->>
                                                    ${(ticket.presetTime)!}
                                                    </dd>
                                                <#--门票名称+标签-->
                                                    <dt class="pdname">
                                                        <a href="javascript:;" class="ptlink service_poptip"
                                                           data1=""
                                                        <#--tip-content="433米·白云星空观光票-成人票 <span class='tagsback'><i>不可退</i></span>"-->>
                                                        ${(ticket.name)!}
                                                        <#--标签循环-->
                                                            <#list ticket.tagss as tag >
                                                                <span class="tagsback"><i>${tag.name}</i></span>
                                                            </#list>
                                                            <span class="icon_arrownew"></span>
                                                        </a>
                                                    </dt>
                                                <#--门票说明-->
                                                    <dd class="pdetails" style="display: none;">
                                                        <div class="tiptext tip-light">
                                                            <div class="tip-arrow tip-arrow-11">
                                                                <em>◆</em>
                                                                <i>◆</i>
                                                            </div>
                                                            <div class="tip-other">
                                                                <div class="pdetails-li">
                                                                ${ticket.content.content}
                                                                    <#--<ul>
                                                                        <li><em class="pdl-tit">预订时间</em>
                                                                            <span class="tagsback"><i>随买随用</i></span>20:00前可订今日票，预订成功后可立即使用
                                                                        </li>
                                                                        <li><em class="pdl-tit">有效期限</em>(若门票使用人在游玩期间多次入园，必须出示门票，景区工作人员会验证是否为使用人本人。)指定游玩日当天内有效</li>

                                                                    </ul>-->
                                                                </div>
                                                            </div>
                                                            <a href="javascript:;" class="view-details">收起</a>
                                                        </div><!--//.tiptext-->
                                                    </dd>
                                                </dl>
                                            </#list>
                                            <!-- 列表循环结束-->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </#if>

                    </tbody>


                </table>


                <table class="ptable table-full around" id="traffic_hotel" style="display: none;">
                    <thead class="pttit">
                    <tr>
                        <td></td>
                        <td>
                            <dl class="ptditem">
                                <dd class="pdprefer">优惠</dd>
                                <dd class="pdlvprice">销售价</dd>
                                <dt class="pdname">产品名称</dt>
                            </dl>
                        </td>
                    </tr>
                    </thead>
                    <tbody class="ptbox">
                    <tr>
                        <td class="ptdname">
                            <div class="ptname"><h5>交通+酒店</h5>
                                <ul class="ptbox_tab">
                                    <li class="active">上海出发</li>
                                </ul>
                            </div>
                        </td>
                        <td>
                            <div class="ptdlist gt_list">
                                <div class="ptdlist-inner" style="display:block;">

                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/855192?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>3258</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/855192?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【双“隆”记，机票可选】珠海长隆横琴湾酒店、广州长隆酒店双飞4晚5日自由行（前2晚住珠海、后2晚住广州，珠海进广州返）"
                                               target="_blank">
                                                【双“隆”记，机票可选】珠海长隆横琴湾酒店、广州长隆酒店双飞4晚5日自由行（前2晚住珠海、后2晚住广州，珠海进广州返）
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/855794?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>3196</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/855794?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【双“隆”记，机票可选】珠海长隆企鹅酒店、广州长隆酒店双飞4晚6日自由行（前2晚住珠海、第3晚和第4晚住广州，第5天住宿自理，珠海进广州返）"
                                               target="_blank">
                                                【双“隆”记，机票可选】珠海长隆企鹅酒店、广州长隆酒店双飞4晚6日自由行（前2晚住珠海、第3晚和第4晚住广州，第5天住宿自理，珠海进广州返）
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/855793?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>3166</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/855793?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【双“隆”记，机票可选】珠海长隆企鹅酒店、广州长隆酒店双飞4晚5日自由行（前2晚住珠海、后2晚住广州，珠海进广州返）"
                                               target="_blank">
                                                【双“隆”记，机票可选】珠海长隆企鹅酒店、广州长隆酒店双飞4晚5日自由行（前2晚住珠海、后2晚住广州，珠海进广州返）
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/855194?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>3288</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/855194?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【双“隆”记，机票可选】珠海长隆横琴湾酒店、广州长隆酒店双飞4晚6日自由行（前2晚住珠海、第3和第4晚住广州，第5天住宿自理，珠海进广州返）"
                                               target="_blank">
                                                【双“隆”记，机票可选】珠海长隆横琴湾酒店、广州长隆酒店双飞4晚6日自由行（前2晚住珠海、第3和第4晚住广州，第5天住宿自理，珠海进广州返）
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/811583?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>3136</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/811583?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【双“隆”记，机票可选】广州长隆酒店、珠海长隆企鹅酒店双飞4晚6日自由行（前2晚住广州、第3晚和第4晚住珠海，第5天住宿自理，广州进珠海出）"
                                               target="_blank">
                                                【双“隆”记，机票可选】广州长隆酒店、珠海长隆企鹅酒店双飞4晚6日自由行（前2晚住广州、第3晚和第4晚住珠海，第5天住宿自理，广州进珠海出）
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/811268?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>3228</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/811268?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【双“隆”记，机票可选】广州长隆酒店、珠海长隆横琴湾酒店双飞4晚6日自由行（前2晚住广州、第3和第4晚住珠海，第5天住宿自理，广州进珠海出）"
                                               target="_blank">
                                                【双“隆”记，机票可选】广州长隆酒店、珠海长隆横琴湾酒店双飞4晚6日自由行（前2晚住广州、第3和第4晚住珠海，第5天住宿自理，广州进珠海出）
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/653416?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1452</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/653416?losc=071037&amp;ict=i"
                                               class="ptlink" title="【随心游】广州番禺香江大酒店双飞4日3晚(连住3晚广州番禺香江大酒店（番禺大道店），可自由搭配机票)"
                                               target="_blank">
                                                【随心游】广州番禺香江大酒店双飞4日3晚(连住3晚广州番禺香江大酒店（番禺大道店），可自由搭配机票)
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591947?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1410</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591947?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="广州双飞5日2晚自由行(前2晚入住广州长隆香江酒店(广州长隆野生动物世界店)，后2晚住宿自理，航班自由搭配 )"
                                               target="_blank">
                                                广州双飞5日2晚自由行(前2晚入住广州长隆香江酒店(广州长隆野生动物世界店)，后2晚住宿自理，航班自由搭配 )
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591888?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1380</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591888?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="广州双飞4日2晚自由行(前2晚入住广州长隆香江酒店(广州长隆野生动物世界店)，后1晚住宿自理，航班自由搭配 )"
                                               target="_blank">
                                                广州双飞4日2晚自由行(前2晚入住广州长隆香江酒店(广州长隆野生动物世界店)，后1晚住宿自理，航班自由搭配 )
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591834?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1870</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591834?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="【亲子乐游游】广州双飞5日2晚自由行(前2晚入住广州长隆熊猫酒店，后2晚住宿自理，自由搭配往返航班 )"
                                               target="_blank">
                                                【亲子乐游游】广州双飞5日2晚自由行(前2晚入住广州长隆熊猫酒店，后2晚住宿自理，自由搭配往返航班 )
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591781?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1840</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591781?losc=071037&amp;ict=i"
                                               class="ptlink" title="【亲子乐游游】广州双飞4日2晚自由行(前2晚入住广州长隆熊猫酒店，后1晚住宿自理，自由搭配往返航班)"
                                               target="_blank">
                                                【亲子乐游游】广州双飞4日2晚自由行(前2晚入住广州长隆熊猫酒店，后1晚住宿自理，自由搭配往返航班)
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591773?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1870</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591773?losc=071037&amp;ict=i"
                                               class="ptlink" title="【欢乐游】广州长隆双飞5日2晚自由行(前2晚入住广州长隆酒店，后2晚住宿自理，自由搭配往返航班 )"
                                               target="_blank">
                                                【欢乐游】广州长隆双飞5日2晚自由行(前2晚入住广州长隆酒店，后2晚住宿自理，自由搭配往返航班 )
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591689?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1840</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591689?losc=071037&amp;ict=i"
                                               class="ptlink" title="【欢乐游】广州长隆双飞4日2晚自由行(前2晚入住广州长隆酒店，后1晚住宿自理，自由搭配往返航班)"
                                               target="_blank">
                                                【欢乐游】广州长隆双飞4日2晚自由行(前2晚入住广州长隆酒店，后1晚住宿自理，自由搭配往返航班)
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591678?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1176</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591678?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="广州双飞5日2晚自由行(前2晚连住广州番禺香江大酒店（番禺大道店），后2晚住宿自理，自由搭配往返航班)"
                                               target="_blank">
                                                广州双飞5日2晚自由行(前2晚连住广州番禺香江大酒店（番禺大道店），后2晚住宿自理，自由搭配往返航班)
                                            </a>
                                        </dt>
                                    </dl>
                                    <!-- 这个是门票的时候价格表-->
                                    <dl class="ptditem">
                                        <dd class="pdpaytype">
                                                    <span class="ipay">
                                                            <a href="http://dujia.lvmama.com/group/2591663?losc=071037&amp;ict=i"
                                                               class="btn btn-w btn-small  btn-orange" target="_blank">查看</a>

                                                    </span>
                                        </dd>
                                        <dd class="pdprefer">

                                        </dd>
                                        <dd class="pdlvprice">
                                            <dfn>¥<i>1146</i><span>起</span></dfn>
                                        </dd>
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/group/2591663?losc=071037&amp;ict=i"
                                               class="ptlink"
                                               title="广州双飞4日2晚自由行(前2晚连住广州番禺香江大酒店（番禺大道店），后1晚住宿自理，自由搭配往返航班)"
                                               target="_blank">
                                                广州双飞4日2晚自由行(前2晚连住广州番禺香江大酒店（番禺大道店），后1晚住宿自理，自由搭配往返航班)
                                            </a>
                                        </dt>
                                    </dl>
                                    <dl class="ptdMore">
                                        <dt class="pdname">
                                            <a href="http://dujia.lvmama.com/tour/guangzhouta152470/freetour?losc=071037&amp;ict=i"
                                               target="_blank">查看更多相关产品&nbsp;&gt;</a>
                                        </dt>
                                    </dl>
                                </div>

                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
                <!-- 跟团游 -->
            </div>
        </div>

        <!-- 商品列表结束 -->


        <!-- 浮动导航2 -->
        <div class="tab-outer mt20">
            <div class="tab-dest tab-fixed" style="">
                <ul class="ul-hor J_scrollnav">

                    <li date_id="policy" class="active" >
                        <a href="javascript:;">预订须知</a>
                    </li>
                    <li date_id="introduction" class="">
                        <a href="javascript:;">景点介绍
                        </a>
                    </li>


                </ul>
                <a href="#destorder" class="btn btn-large cbtn-orange nav_yd" style="display: none;"><span
                        class="btn-text">立即预订</span><!-- <i class="icon icon-r dicon-rarr"></i> --></a>
            </div>
        </div>


        <div class="dside">
            <div class="sidebox dside-search">
                <div class="stitle">
                    <h4 class="stit">景点门票搜索</h4>
                </div>
                <div class="scontent">
                    <div class="dsearch form-inline">
                        <input type="text" class="input-text" name="searchText" placeholder="请输入目的地/景点/主题/城市"><a href=""
                                                                                                                 id="searchButton"
                                                                                                                 class="dsearch-btn"
                                                                                                                 target="_blank"><i
                            class="icon dicon-search"></i></a>
                    </div>
                    <hr>
                    <dl class="dl-ver">
                        <dt>相关景点推荐</dt>
                        <dd>
                            <#list popularTickets! as aboutTicket>
                                <a href="/ticket/detail?tid=${aboutTicket.id}" title="${aboutTicket.scenic.name}">${aboutTicket.scenic.name}</a>
                            </#list>
                        </dd>
                    </dl>
                </div>
            </div>

            <#--景点最多人关注的门票-->
            <div class="sidebox dside-theme">
                <div class="stitle">
                    <h3 class="stit"> ${scenic.parent.name} 备受关注景点</h3>
                </div>
                <div class="scontent">
                    <#--景点门票循环-->
                    <#list favorTickets! as favorTicket>
                        <dl class="dl-hor">
                            <dt>
                                <a href="/ticket/detail?tid=${favorTicket.id}">
                                    <img width="90" height="60"
                                         src="${favorTicket.scenic.coverUrl}">
                                </a>
                            </dt>
                            <dd>
                                <p><a href="javascript:;" target="_blank">${favorTicket.scenic.name}</a></p>
                                <p class="ticket_price_p"><dfn><i>${favorTicket.scenic.favornum}人</i><em>收藏</em></dfn></p>
                                <p></p>
                            </dd>
                        </dl>
                    </#list>
                </div>
            </div>

            <#--景点最多人去的门票-->
            <div class="sidebox dside-near dside-good">
                <div class="stitle">
                    <h3 class="stit">
                        ${scenic.parent.name} 最多人去景点
                    </h3>
                </div>
                <div class="scontent">
                    <ul class="textlist js_imgshow" id="good_common_list_ticket">

                        <#--景点门票循环-->
                        <#list popularTickets! as popularTicket>
                            <li class="<#if popularTicket_index == 0>active</#if>">
                                <a href="/ticket/detail?tid=${popularTicket.id}"
                                   hidefocus="false">
                                    <img width="228" height="152"
                                         src="${(popularTicket.scenic.coverUrl)!}">
                                </a>
                                <dfn>¥<i>${popularTicket.salePrice}</i><em>起</em></dfn>
                                <a href="javascript:;" target="_blank"
                                   hidefocus="false"><em class="rank_num ">${popularTicket_index+1}</em>${popularTicket.scenic.name}</a>
                            </li>
                        </#list>

                    </ul>
                </div>
            </div>
        </div><!--//.dside-->

        <div class="dmain">
            <!--组装产品详情-->

            <!--预订须知--开始-->
            <#--<div id="policy" class="dbox policy" xmlns="http://www.w3.org/1999/html">
                <div class="dtitle">
                    <h3 class="dtit"><i class="icon dicon-policy"></i>预订须知</h3>
                </div>
                &lt;#&ndash;shouldKnow&ndash;&gt;
                    ${(ticketDetail.shouldKnow)!}
            </div><!--预订须知--结束&ndash;&gt;-->

            <div id="policy" class="dbox policy" xmlns="http://www.w3.org/1999/html">
                <div class="dtitle">
                    <h3 class="dtit"><i class="icon dicon-policy"></i>预订须知</h3>
                </div>
                <div class="dcontent">
                    <div class="dactive">
                        <!-- 多了个嵌套 darea-->
                        <div class="darea">
                            <h5>免票政策</h5>
                            <p>a. 3周岁（不含）以下或1米（含）以下的儿童免票。（在入园时，其监护人必须携带并出示能被接受的儿童或婴幼儿本人含出生日期及照片的政府签发的有效身份证件原件 （“官方身份证件”））</p><p>* 以上信息仅供参考，具体以景区当日信息为准。</p>
                        </div>

                        <div class="darea">
                            <h5> 优惠政策</h5>
                            <p>
                                景区规定统一售价，暂无其他优惠政策。</p><p>*以上信息仅供参考，具体以景区当日信息为准。</p><p>
                        </p>
                        </div>
                        <div class="darea">
                            <h5> 设施包含</h5>
                            <p>
                                收费停车场、婴儿车租赁、行李寄存、商店、餐厅
                            </p>
                        </div>
                        <div class="darea">
                            <h5>开具发票</h5>
                            <p>在线申请发票：如需开具发票可在下单时填写发票信息或提交订单后在订单详情页中申请开具发票，我司在收到完整信息后向您寄送发票，为避免因发生不可抗力或意外事项致实际消费额与发票开具的相应数额不符，建议您在游玩归来后2个月内索取发票---在线支付</p><p></p>
                        </div>
                        <div class="darea noline">
                            <h5> 重要说明</h5>
                            <p>
                                敬请注意：
                            </p><p>根据相关法律法规和政府部门的指导意见，所有游客及其随身行李在进入上海迪士尼乐园前必须进行安全检查。
                        </p><p>以下物品不得携带入园（包括但不限于）：易燃易爆物品；武器；需加热、再加热、加工、冷藏或保温的食品（如需加热水食用的方便面及带自热功能的食品等）及带有刺激性气味的食品（如榴莲等）；酒精饮料；罐装或玻璃容器；超出规定尺寸的行李；大型三脚架；折叠椅及凳子；动物；相关法律禁止的物品及其他具有危险性或破坏性的物品。
                        </p>
                        </div>
                    </div>
                    <div class="darea">
                        <h5>安全须知</h5>
                        <p>1.为了您人身、财产的安全，请您避免在公开场合暴露贵重物品及大量现金。外出时需时刻看管好首饰、相机等随身物品。</p>
                        <p>2.游泳、漂流、潜水、浮潜、冲浪、快艇、滑雪、滑冰、热气球、高空跳伞、滑翔伞、动力伞、攀岩、登山、骑马、驾驶、温泉、冲沙、索道、蹦极等活动项目，均存在危险。参与前请根据自身条件，充分参考当地相关部门及其它专业机构的相关公告和建议后量力而行。请您在预订前阅读为您整理各项高风险活动的。<strong><a target="_blank" href="http://www.lvmama.com/zt/promo/safetytips/high_risk.html">《安全须知》</a></strong></p>
                    </div>
                </div>
            </div>

            <!--优惠活动--开始-->
            <a id="jdhd" style="font-size:0; padding-top:35px; display:block;" hidefocus="false"></a>
            <div id="activity" class="dbox activity">
                <!--如果没有精彩活动，则不显示精彩活动列表-->
            </div><!--精彩活动--结束-->

            <!--景点介绍--开始-->
            <div id="introduction" class="dbox introduction">
                <div class="dtitle">
                    <h2 class="dtit"><i class="icon dicon-introduction"></i>景点介绍</h2>
                </div>

                <#--循环景点图-->
                <#list photosArr as photo>
                    <img src="${photo}" style="height: 226px;width: 350px;padding: 10px;"/><br>
                </#list>
                <#--景点内容-->
                ${(scenic.content.content)!}


            </div><!--景点介绍--结束-->


        </div>


    </div><!-- //resortAlert -->
</div>

<#--/js/v6/comment/new_comment.js-->
<script type="text/javascript"
        src="http://pic.lvmama.com/min/index.php?f=/js/new_v/jquery-1.7.2.min.js,/js/ui/lvmamaUI/lvmamaUI.js,/js/v6/header_new.js,/js/v6/public/searchComplete.js,/js/v5/modules/pandora-poptip.js,/js/v6/ticket/ticket_detail.js"></script>

<div class="poptip tip-light poptip-default" style="left: 645.024px; top: 201.507px; display: none;" id="poptip1">
    <div class="tip-arrow tip-arrow-12"><em>◆</em> <i>◆</i></div>
    <div class="tip-content"><h5 class="tip-title" style="display: none;"></h5>
        <p>顺利入园，快速服务</p></div>
</div>




<div class="complete_box" style="display:none">
    <ul class="complete_list"></ul>
</div>
<div class="complete_box_hotel hotelDestBox" style="display:none"></div>
<div class="complete_box_hotel hotelKeywordBox" style="display:none"></div>
<div class="complete_error_tips" style="display:none;"><span>找不到目的地：</span><span class="word"></span><i>×</i></div>
<div id="right-bottom-tools"><a id="sideInve" target="_blank" href="https://wj.qq.com/s/1293296/f5ae"
                                title="有奖问卷"></a><a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"
                                                    class="" style="visibility: hidden;"></a><a
        href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" id="Feedback" title="意见反馈"
        class="" style="visibility: hidden;"></a></div>
<div class="footBar P800 w12 open">
    <div class="syfootBar-overlay"></div>
    <div class="syfootBar-wrap"><a class="footBar-gnsyl-lv"
                                   href="http://www.lvmama.com/zt/promo/cjyoulun?losc=089761&amp;ict=i"
                                   target="_blank"></a><a class="footBar-gnsyl_channel"
                                                          href="http://www.lvmama.com/zt/promo/cjyoulun?losc=089761&amp;ict=i"
                                                          target="_blank">买国内送邮轮</a>
        <div class="footBar-opt">
            <div class="footBar-opt-overlay"></div>
            <div class="footBar-opt-wei"><span class="footBar-sao"></span><em>微信扫一扫，小程序预订更优惠</em></div>
            <div class="footBar-opt-app"><a class="T3D T3dY an5s"
                                            href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPhone下载</a><a
                    class="T3D T3dY an5s" href="http://m.lvmama.com/rewrite/d.php" target="_blank">Android下载</a><a
                    class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8"
                    target="_blank">iPad下载</a></div>
        </div>
        <span class="footBar-close"></span></div>
</div>
<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>

<script >
    $(function () {
        //门票说明弹窗
        $( '.pdname a' ).on( 'click', function( e ) {
            console.log(  $( $($(this).parent()).next() ) );
            $($($(this).parent()).next()).toggle();
        } );
        //相册点击事件
        $('.picTab img').on('click', function () {
            $('#bigImg').attr('src', $(this).attr("src"));
        });
    });
</script>

<#include "../common/footer.ftl">
</body>


</html>


