<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>骡窝窝~门票</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">



<#--<script async="" src="https://pics.lvjs.com.cn/js/common/sa-sdk-javascript-1.12.9/sensorsdata.min.js" charset="UTF-8"></script>-->
<#--<script src="//www.lvmama.com/2019homePage/getSensorsJs.do"></script>-->
<#--<link rel="canonical" href="http://ticket.lvmama.com/">-->
    <link rel="stylesheet"
          href="http://pic.lvmama.com/min/index.php?f=/styles/v6/header_new.css,/styles/channel/ticket/v1/ticket.css,/styles/lv/buttons.css,/styles/v5/modules/tip.css">

    <#--script type="text/javascript" src="//www.lvmama.com/2017index/ztRecommendInfoJson.do?blockId=219944&amp;station=superScript&amp;callback=success_jsoncallback"></script>
    <script src="//www.lvmama.com/php-seo/ads/ex?dest_id=229&amp;channel_id=10&amp;place_id=13&amp;jsonpCallback=jsonpCallback&amp;v=07256429595185749"></script>
    <script language="javascript" type="text/javascript" src="https://libs.de.coremetrics.com/configs/52710000.js"></script>-->
    <script>
        $(function () {
            //查询
            $("#_j_index_search_btn_all").click(function () {
                var type = $(".tab-selected").data("index");
                $("#searchType").val(type);
                $("#kwSearchForm").submit();
            });
            //dialogCommon("saaa")

            //默认游记list
            $("#searchForm").ajaxForm(function (data) {
                $("#_j_tn_content").html(data);
            });
            $("#searchForm").submit();

            //排序
            $(".orderTypeBtn").click(function () {
                $(this).closest("li").addClass("active");
                var type = $(this).data("type");
                $("#currentPage").val(1);
                $("#orderType").val(type);
                $("#searchForm").submit();
            });

        })


    </script>

</head>


<body class="ticket ticketChannel">
<#assign currentNav="ticket">
<#include "../common/navbar.ftl">

<!-- 主体内容 -->
<div class="wrap">
    <!-- 周末促销  开始 -->
    <div class="main_box">
        <h3 class="main_tit">
            打响周末
        </h3>
        <div class="main_content_box clearfix main_weekend weekend_js promotion_start">
            <div class="main_content_l">
                <div class="promotion_l_bg">
                    <img src="http://pic.lvmama.com/uploads/pc/place2/2017-07-14/265cb99b-8bdb-4149-9eb2-5fd4d8c92b62.jpg"
                         width="222" height="242" alt="">
                </div>
                <div class="promotion_weekend_time" style="display: none">
                    还有 <span id="weekend_time" data-time="19323000"><i>05</i>：<i>17</i>：<i>01</i></span> <samp>结束</samp>
                </div>
                <a href="http://s.lvmama.com/ticket/F1K440100?keyword=%E5%B9%BF%E5%B7%9E&amp;tabType=ticket#list"
                   target="_blank" onclick="cmcTag('门票频道页-PC-站点-P2-打响周末-查看活动详情','PC门票频道页导航');">查看活动详情&gt;</a>
            </div>
            <ul class="promotion_list">
                <#--循环周末门票-->
                <#list weekTickets as weekTicket >
                <li>
                    <a href="/ticket/detail?tid=${weekTicket.id}" target="_blank"
                       onclick="cmcTag('门票频道页-PC-站点-P2-打响周末-001-英西峰林','PC门票频道页导航');">
                        <div class="promotion_img_box">
                            <img src="${weekTicket.scenic.coverUrl}"
                                 width="222" height="150" alt="">
                            <span class="promotion_tag">周末特惠</span>
                            <p class="promotion_comment ticket_icon">92.5% 好评</p>
                        </div>

                        <div class="promotion_footer">
                            <h5 title="英西峰林">${weekTicket.scenic.name}</h5>
                            <span class="btn btn-big btn-orange" href="javascript:;" target="_blank">抢购</span>
                            <p><span>¥<dfn>${weekTicket.salePrice}</dfn></span><samp>起</samp></p>
                        </div>
                    </a>
                </li>
                </#list>
            </ul>
        </div>
    </div>
    <!-- 周末促销  结束 -->

    <!-- 景点推荐 开始 -->
    <div class="main_box">
        <h3 class="main_tit">景点推荐
            <#--<a id="smartShelfUrl" href="javascript:void(0);">查看更多<span>&gt;</span></a>-->
        </h3>
        <div class="main_content_box main_recommend clearfix">
            <#--景点列表： 广州 深圳 阳江 .........-->
            <ul class="recommend_tab_t">
            <#--遍历顶级景点-->
            <#list scenics! as d >
                <#if d_index==0>
                    <li class="city_js active" data="${d.id!}" data2="">${d.name!}</li>
                <#else >
                    <li class="city_js" data="${d.id!}" data2="">${d.name!}</li>
                </#if>
            </#list>
            </ul>

            <!-- 景点列表 -->
            <div class="recommend_list_content" style="display: block;">
                <div class="main_content_l ticket_icon catalogList">
                    <ul class="recommend_tab_l">
                    <#--景点分类-->
                        <li class="active subject_js" data="0">所有分类<i class="ticket_icon"></i></li>
                    <#list catalogs! as t>
                        <#if t_index==0>
                            <li class=" subject_js" data="${t.id!}">${t.name!}<i class="ticket_icon"></i></li>
                        <#else >
                            <li class=" subject_js" data="${t.id!}">${t.name!}<i class="ticket_icon"></i></li>
                        </#if>
                    </#list>
                    </ul>
                </div>
                <ul class="promotion_list clearfix scenicTicketList" style="display: block;">

                <#--门票对应地区主题的景点门票信息-->
                <#if tickets??>

                    <#list tickets as ticket>
                    <#--推荐门票-->
                        <li>
                            <a href="/ticket/detail?tid=${ticket.id}" target="_blank"
                               onclick="cmcTag('门票频道页-PC-站点-P4-景点推荐-广州主题乐园-001-广州塔','PC门票频道页景点推荐');">
                                <div class="promotion_img_box">
                                    <img src="${(ticket.scenic.coverUrl)!}" width="222" height="150" alt="">
                                </div>
                                <div class="promotion_footer">
                                    <h5 title="${(ticket.scenic.name)!}">${(ticket.scenic.name)!}</h5>
                                    <span class="promotion_comment_b">${(ticket.scenic.visitnum)!} 人去过</span>
                                    <p><span>¥<dfn>${(ticket.salePrice)!}</dfn></span><samp>起</samp></p>
                                </div>
                            </a>
                        </li>
                    </#list>
                </#if>

            </div>

        </div>
    </div>
    <!-- 景点推荐  结束 -->

    <!-- 专题活动 -->
    <div class="main_box">
        <h3 class="main_tit">官方旗舰店</h3>
        <div class="main_content_box main_zhuanti">
            <ul class="zhuanti_list clearfix">
                <li>
                    <a href="http://www.lvmama.com/zt/promo/hygy/" target="_blank"
                       onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-001-','PC门票频道页专题活动');">
                        <h4></h4>
                        <img src="http://pic.lvmama.com/uploads/pc/place2/2017-05-19/21a448d2-b897-4b6b-855b-77b9be131bae.jpg"
                             width="283" height="120" alt="">
                    </a>
                </li>
                <li>
                    <a href="http://www.lvmama.com/zt/promo/2018gzhcldjq/" target="_blank"
                       onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-002-','PC门票频道页专题活动');">
                        <h4></h4>
                        <img src="http://pic.lvmama.com/uploads/pc/place2/2017-05-19/8250b6b1-2e92-4d4d-ba3d-5a8678f3828d.jpg"
                             width="283" height="120" alt="">
                    </a>
                </li>
                <li>
                    <a href="http://www.lvmama.com/zt/promo/hongkongdisney/" target="_blank"
                       onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-003-','PC门票频道页专题活动');">
                        <h4></h4>
                        <img src="http://pic.lvmama.com/uploads/pc/place2/2017-05-24/2a019a7e-5b1d-454d-987d-3a02af474687.jpg"
                             width="283" height="120" alt="">
                    </a>
                </li>
                <li>
                    <a href="http://www.lvmama.com/zt/promo/2018rjqjd/ " target="_blank"
                       onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-004-','PC门票频道页专题活动');">
                        <h4></h4>
                        <img src="http://pic.lvmama.com/uploads/pc/place2/2018-08-01/31a18704-6433-4eb3-af4f-905af60fbc41.jpg"
                             width="283" height="120" alt="">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 专题活动 结束-->
</div>

<div class="hh_cooperate">
    <!-- 友情链接 -->
    <p>
        <b>友情链接：</b>
        <span>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-10822149">合肥万达门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-10690393">扬州乐园门票</a>
			<a target="_blank" href="http://shanghai.gongjiao.com">上海公交</a>
			<a target="_blank" href="http://www.16fan.com/">十六番</a>
			<a target="_blank" href="http://www.myvacation.cn">小众旅游</a>
			<a target="_blank" href="http://shenzhen.tianqi.com/">深圳天气</a>
			<a target="_blank" href="http://www.xaoyo.com">天气预报查询</a>
			<a target="_blank" href="http://huoche.mipang.com">火车票网上订票</a>
			<a target="_blank" href="http://www.itrip.com/">欧洲自由行</a>
			<a target="_blank" href="http://www.qimaren.com/">成都中国青年旅行社</a>
			<a target="_blank" href="http://www.92rank.com">中国猕猴桃网</a>
			<a target="_blank" href="http://www.jutuw.com/">峨眉山旅游</a>
			<a target="_blank" href="http://www.yousc.com/">四川旅游网</a>
			<a target="_blank" href="http://www.xishiqu.com/">上海演唱会门票</a>
			<a target="_blank" href="http://down.znds.com/">智能电视软件</a>
			<a target="_blank" href="http://www.zhcpic.com/">哲狐旅行问答</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-121304">大宁郁金香公园</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-10812324">上海中心大厦</a>
			<a target="_blank" href="http://flight.lvmama.com/booking/PEK-SHA.html">北京到上海机票</a>
			<a target="_blank" href="http://flight.lvmama.com/booking/SHA-PEK.html">上海到北京机票</a>
			<a target="_blank" href="http://www.cct.cn/">康辉旅游</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-159996">云台山门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-456">峨眉山门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-127">黄山门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-344">华山门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-3577">长白山门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-105307">织金洞门票</a>
			<a target="_blank" href="http://www.kanzhun.com">查工资</a>
			<a target="_blank" href="http://www.yjldp.com">长岛渔家乐</a>
			<a target="_blank" href="http://www.zxart.cn/">艺术网</a>
			<a target="_blank" href="http://www.syoits.com">金运之旅</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-102901">乔家大院门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-162087">平遥古城门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-485">五台山门票</a>
			<a target="_blank" href="http://ticket.lvmama.com/scenic-175649">上海迪士尼门票</a>
			<a target="_blank" href="http://www.lvmama.com/lvyou/guide/2015-1208-199837.html" rel="nofollow">查看更多</a>
		</span>
    </p>
    <!-- // 友情链接 -->
    <!-- 热门精选 -->

<#--<script src="http://pic.lvmama.com/min/index.php?f=/js/new_v/jquery-1.7.2.min.js,/js/v6/header_new.js,/js/v5/modules/pandora-countdown.js,/js/channel/ticket/v1/ticket.js,/js/v5/modules/pandora-poptip.js"></script>
<script src="http://pic.lvmama.com/min/index.php?f=/js/v5/ibm/eluminate.js,/js/v5/ibm/coremetrics-initalize.js,/js/common/losc.js"></script>-->

    <script>
        $(function () {
            $("#smartShelfUrl").click(function () {
                var destUrl = $(".recommend_tab_t").find("li.active").attr("data2");
                var index = $(".recommend_tab_t li").index($(".recommend_tab_t li.active"));
                var subjectid = $(".recommend_tab_l").find("li.active").eq(index).attr("data");
                var cityName = $(".recommend_tab_t").find("li.active").html();

                if (destUrl == "") {
                    window.open("http://s.lvmama.com/ticket/T" + subjectid + "?keyword=" + cityName + "#list");
                } else {
                    window.open("http://" + destUrl);
                }
            });

            //景点推荐上面的切换
            $(document).on('mouseover', '.recommend_tab_t li', function (e) {
                var num = $(this).index();      //景点列表标签的索引
                $(this).addClass('active').siblings().removeClass('active');    //给当前的加激活并且给其他的不激活
                var subjectDiv = $('.recommend_list_content').eq(num);
                var scenicId = $(this).attr("data");
                console.log("scenicId：" + scenicId);
                if (true || subjectDiv.find('ul').length == 0) {
                    $.ajax({
                        type: "POST",
                        url: "/ticket/reloadSubAndProd",
                        data: {
                            scenicId: scenicId
                        },
                        success: function (data) {
                            var splitHtml = data.split("<!--&-->");
                            $('.catalogList').html(splitHtml[0]);
                            console.log(splitHtml[1]);
                            $('.scenicTicketList').html(splitHtml[1]);
                            //subjectDiv.append(splitHtml[1]);
                        }
                    });
                }
                subjectDiv.show().siblings('.recommend_list_content').hide();
            });

            //景点推荐左侧的切换
            $(document).on('mouseover', '.recommend_tab_l li', function (e) {
                var num = $(this).index();
                $(this).addClass('active').siblings().removeClass('active');
                var prodUl = $(this).parents('.main_content_l').siblings('.promotion_list').eq(num);
                var subjectId = $(this).attr("data");
                var destId = $("ul.recommend_tab_t").find("li.active").attr("data");
                $.ajax({
                    type: "POST",
                    url: "/ticket/reloadProd",
                    data: {
                        scenicId: destId,               //景点id
                        scenicCataId: subjectId        //景点分类id
                    },
                    success: function (data) {
                        //console.log(data);
                        console.log(subjectId);
                        $('.scenicTicketList').html(data);
                        if (prodUl.find('li').length == 0) {
                            prodUl.append(data);
                        }
                    }
                });
                prodUl.show().siblings('.promotion_list').hide();
            });



        });

    </script>

</div>
<div class="poptip tip-light poptip-default" style="left: 407px; top: 861.5px; display: none;" id="poptip1">
    <div class="tip-arrow tip-arrow-3"><em>◆</em> <i>◆</i></div>
    <div class="tip-content">
        <h5 class="tip-title" style="display: none;"></h5>
        <p><img src="http://pic.lvmama.com/img/v6/applet_poptip_ticket.png" width="160" height="184"></p>
    </div>
</div>
<div id="right-bottom-tools">
    <a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部" class="" style="visibility: hidden;"></a>
    <a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" id="Feedback" title="意见反馈"
       class="" style="visibility: hidden;"></a><span id="rbtApplet" class="JS_appletPop"
                                                      tip-content="<img src='http://pic.lvmama.com/img/v6/applet_poptip_ticket.png' width='160' height='184'>"></span>
</div>
<div class="s_complete_box"></div>
<div class="footBar P800 w12 open">
    <div class="syfootBar-overlay"></div>
    <div class="syfootBar-wrap">
        <a class="footBar-gnsyl-lv" href="http://www.lvmama.com/zt/promo/cjyoulun?losc=089761&amp;ict=i"
           target="_blank"></a>
        <a class="footBar-gnsyl_channel" href="http://www.lvmama.com/zt/promo/cjyoulun?losc=089761&amp;ict=i"
           target="_blank">买国内送邮轮</a>
        <div class="footBar-opt">
            <div class="footBar-opt-overlay"></div>
            <div class="footBar-opt-wei"><span class="footBar-sao"></span><em>微信扫一扫，小程序预订更优惠</em></div>
            <div class="footBar-opt-app">
                <a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPhone下载</a>
                <a class="T3D T3dY an5s" href="http://m.lvmama.com/rewrite/d.php" target="_blank">Android下载</a>
                <a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8"
                   target="_blank">iPad下载</a>
            </div>
        </div>
        <span class="footBar-close"></span>
    </div>
</div>
<#include "../common/footer.ftl">
</body>

</html>