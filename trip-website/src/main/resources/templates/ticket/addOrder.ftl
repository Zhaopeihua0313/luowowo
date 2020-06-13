<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎下单：${ticketInfo.name}</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">

    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>

    <link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/v6/header_new.css,/styles/v4/modules/step.css,/styles/v5/modules/tip.css,/styles/v5/modules/tags.css,/styles/lv/calendar.css,/styles/v4/modules/selectbox.css,/styles/lv/buttons.css,/styles/v5/modules/dialog.css,/styles/common/poplogin.css,/styles/lv/dialog.css,/styles/lv/icons.css,/styles/lv/tips.css,/styles/order/order2016.css">
    <link rel="stylesheet" href="http://pic.lvmama.com/js/ui/lvmamaUI/css/jquery.common.css">

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">
</head>

<body class="order order_ticket">


<#assign currentNav="ticket">
<#include "../common/navbar.ftl">

<div class="mainBox">

    <div class="wrap">
        <!-- 操作步骤 -->
        <ol class="ui-step ui-step-3">
            <li class="ui-step1 ui-step-start ui-step-active">
                <div class="ui-step-arrow">
                    <i class="arrow_r1"></i> <i class="arrow_r2"></i>
                </div> <span class="ui-step-text">填写订单</span>
            </li>
            <li class="ui-step2 ">
                <div class="ui-step-arrow">
                    <i class="arrow_r1"></i> <i class="arrow_r2"></i>
                </div> <span class="ui-step-text">在线支付</span>
            </li>
            <li class="ui-step3 ui-step-end ">
                <div class="ui-step-arrow">
                    <i class="arrow_r1"></i> <i class="arrow_r2"></i>
                </div> <span class="ui-step-text">预订成功</span>
            </li>
        </ol>
        <!-- 操作步骤 -->
        <!-- 未登录提示 -->

        <div class="orderTicket clearfix">
            <!--订单明细-->
            <div class="orderInfo orderTicketInfo" style="top: 139px;left: 1241.5px;">
                <div class="orderTicketInfo-list">
                    <h3>费用明细</h3>
                    <ul class="nobd">
                        <li class="primary"><em>门票价格</em><dfn><i>￥</i>${(ticketInfo.salePrice)!}</dfn></li>

                        <li><em>${(ticketInfo.name)!}</em><dfn class="dark"><span class="f12">1 X <i>￥</i></span>${(ticketInfo.salePrice)!}</dfn></li></ul>
                    <ul class="last"></ul>
                </div>
                <div class="ticketPriceTotal">
                    <em>应付金额</em>
                    <div class="priceCount">
                        <dfn><span class="yh">￥</span>${(ticketInfo.salePrice)!}</dfn>
                    </div>
                </div>
            </div><!-- //orderInfo -->
            <div class="orderMainLeft">
                <div class="orderMain">

                    <#--订单开始  -->
                    <form method="POST" action="/order/createOrder" name="orderForm" id="orderForm" autocomplete="smartystreets">
                        <!-- 预订信息 开始 -->
                        <div class="orderBox">
                            <div class="orderTit">
                                <span class="iconBg"><b class="orderIcon orderIcon-viewpoint"></b></span>
                                <h3>${ticketInfo.name}</h3>
                                <span class="orderTit-subTit">在线支付</span>
                            </div>



                            <!--商品信息-->
                            <div class="ticketLi last main">
                                <div class="ticketTit">
                                    <a href="/ticket/detail?tid=${ticketInfo.id}" class="ticketTit-link" target="_blank">${ticketInfo.name}
                                        <span class="icon_arrownew"><i>◆</i><b>◆</b></span>
                                    </a>
                                    <#list ticketInfo.tagss! as tag>
                                        <span class="tagsback">
                                            <i>${tag.name}</i>
                                        </span>
                                    </#list>
                                </div>

                                <dl class="orderDl">
                                    <dt>数&emsp;&emsp;量：</dt>
                                    <dd class="orderNumBox clearfix">
                                        <!-- 不可再增加或减少时，给 orderReduce 加num_stop-->
                                        <a href="javascript:;" class="orderContro orderReduce num_stop">-</a>
                                        <#--订单产品 数量 ！！！！！！！！！！！！！！！！！！！！！！-->
                                        <input type="text" class="ordeRoomNum js_input" name="orderProductCount"
                                               id="orderProductCount"
                                               value="1" goodsid="948280" adult="1" child="0" maxquantity="100"
                                               minquantity="1" goodstype="NOTICETYPE_DISPLAY" mainitem="true"
                                               autocomplete="off" stockquantity="0" tickettype="" ticketdisneynum="1"
                                               style="height: 28px;">
                                        <a href="javascript:;" class="orderContro orderAdd">+</a>
                                    </dd>
                                </dl>

                            <!-- 主商品 -->
                            <!-- 保险 -->
                            <div id="insuranceDiv">
                                <div id="insuranceSubmit" style="display:none;" xmlns="http://www.w3.org/1999/html"></div>
                            </div>
                        </div>

                        <div id="saleReAddition">
                            <div id="wifiAddition">
                            </div>
                            <div id="connectsAddition">
                                <div id="access_air"></div>
                                <div id="give_air"></div>
                                <div id="rent_car"></div>
                            </div>
                            <div id="deliveryAddtion">
                            </div>
                        </div>

                        <!-- 用户信息 -->
                        <div class="orderBox order_box" style="padding: 0 0px 40px;">
                            <div class="orderTit">
                                <span class="iconBg"><b class="orderIcon orderIcon-checkIn"></b></span>
                                <h3>用户信息 </h3>
                                <span class="orderTit-info">请确认用户信息</span>
                            </div>
                            <div id="userinfoDiv"><div class="ticketInput" id="Jtenantlist">
                                <div class="ticketGroup">
                                    <#--产品名： 如门票-->
                                    <h3 class="ticketInput-ticTit">${(ticketInfo.name)!}</h3>
                                    <#--订单产品 门票id ！！！！！！！！！！！！！！！！！！！！！！-->
                                    <input type="hidden" name="orderProductId" id="orderProductId"
                                           value="${(ticketInfo.id)!}">
                                    <#--订单产品 类型 门票  ！！！！！！！！！！！！！！！！！！！！！！-->
                                    <input type="hidden" name="orderProductType"  id="orderProductType"
                                           value="ticket">

                                    <div class="playerLi">
                                        <div class="user_info border_t1_dotted" index="0">
                                            <p class="orderUser">
                                                <em>游玩人 1</em> <span class="tagPink JS_pinkTip" style="height: 13px;">取票人</span>
                                                <span class="toubao_text c_c" style="display: none;">已投保</span>
                                            </p>
                                            <dl class="orderDl js_user_dl">
                                                <dt><span class="red">*</span>中文姓名：</dt>
                                                <dd>
                                                    <#--订单使用者姓名！！！！！！！！！！！！！！！！！！！！！！-->
                                                    <input class="input js_yz" id="orderUserName" name="orderUserName"
                                                           type="text" maxlength="20" placeholder="请输入姓名" style="height: 15px;">
                                                    <div id="passportCodeExample" style="display: none"><a href="javascript:;" class="chujinUserBtn-exp sampTip js_exp" style="">范例填写</a></div>
                                                    <span class="error_text"><i class="tip-icon tip-icon-error"></i>请输入姓名</span>
                                                </dd>
                                            </dl>

                                            <#--手机号-->
                                            <dl class="orderDl js_user_dl">
                                                <dt><span class="red">*</span>手机号码：</dt>
                                                <dd>
                                                    <#--订单使用者手机！！！！！！！！！！！！！！！！！！！！！！-->
                                                    <input class="input js_yz js_textBig" id="orderUserPhone" name="orderUserPhone"
                                                           maxlength="11" type="text" placeholder="请输入手机号码" style="height: 15px;"
                                                           value="18814187461"
                                                           item_type="main" autocomplete="smartystreets">
                                                    <span class="ts_text" zitem="init">订单信息会发送至您的手机，请保持手机畅通。</span>
                                                    <span class="error_text" zitem="exception"><i class="tip-icon tip-icon-error"></i>手机号码不正确。</span>
                                                </dd>
                                            </dl>

                                            <#--身份证-->
                                            <dl class="orderDl js_user_dl">
                                                <dt><span class="red">*</span>证件类型：</dt>
                                                <dd>
                                                    <div id="selectbox_1563778857820" class="selectbox selectbox-idCard">
                                                        <p class="select-info like-input" style="height: 28px;">
                                                            <span class="select-arrow">
                                                                <i class="ui-arrow-bottom dark-ui-arrow-bottom"></i>
                                                            </span><span class="select-value">身份证</span>
                                                        </p>
                                                        <div class="selectbox-drop" style="display: none;">
                                                            <ul class="select-results">
                                                                <li rel="ID_CARD" class="liActive">身份证</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <select class="js_zhengjian selectFixWidth js_idType_change"
                                                            onchange="idTypeOnchange()" data-class="selectbox-idCard"
                                                            id="idType0" num="0" " style="display: none;">
                                                        <option value="ID_CARD">身份证</option>
                                                    </select>
                                                    <#--订单使用者身份证！！！！！！！！！！！！！！！！！！！！！！-->
                                                    <input class="input js_yz js_textBig"  id="orderUserCardNumber" style="height: 15px;"
                                                           name="orderUserCardNumber" maxlength="25" type="text"
                                                           value="440902199902082013"
                                                           placeholder="证件号码">
                                                    <span class="ts_text">该证件为入园凭证或购买保险凭证，请准确填写。</span>
                                                    <span id="idNoError0" class="error_text"></span>
                                                </dd>
                                            </dl>

                                            <dl class="orderDl js_user_dl bx_check" style="display: none">
                                                <dt>&nbsp;</dt>
                                                <dd>
                                                    <label class="check js_bx_check">
                                                        <input class="checkbox" name="" value="0"
                                                               onchange="LVMAMA.order.ticket.baoxianPersonNumCheck(this);" type="hidden">
                                                    </label>
                                                </dd>
                                            </dl>
                                            <#--保存按钮-->
                                            <div class="Preser_box" style="display: none">
                                                <label class="check">
                                                    <input id="saveCk0" checked="checked" class="checkbox"
                                                           name="travellers[0].saveFlag" value="true" type="checkbox">
                                                    保存
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            </div>

                        </div>
                        <#--<script src="http://pic.lvmama.com/js/new_v/jquery-1.7.min.js"></script>-->


                        <!--短信验证码  开始-->
                        <div id="msg_auth_code_div" class="orderMobileCode" style="display:none;">
                            <div class="tiptext tip-info order_login">
                                <span class="tip-icon tip-icon-info"></span> 您的账户存在一定风险，为了您资金的安全，请输入短信验证码
                            </div>
                            <div class="user_info no_bd">
                                <dl class="orderDl" id="ticketRiskAuthDl">
                                    <dt><span class="red">*</span>短信验证码：</dt>
                                    <dd>
                                        <input id="riskAuthCode" name="riskAuthCode" class="input" type="text" placeholder="请输入验证码">
                                        <span class="btn btn-lg mg0 js_order_yzm">获取验证码</span>
                                        <span id="riskAuthCodeInfo" class="ts_text"></span>
                                        <span id="riskAuthCodeError" class="error_text" style="display:none;"><i class="tip-icon tip-icon-error"></i>请输入正确的短信验证码</span>
                                    </dd>
                                </dl>
                                <div class="ml20" style="display:none;" id="noLpkBindMobile">
                                    <a class="btn btn-lg" href="javascript:void(0);" onclick="window.open('http://www.lvmama.com/myspace/userinfo/phone.do','_blank');">绑定手机号</a>
                                    <span class="ts_text ml10"><i class="tip-icon tip-icon-info"></i>绑定后刷新页面继续付款</span>
                                </div>
                            </div>
                        </div>
                        <!--短信验证码  结束-->

                    </form>
                    <#--下单按钮-->
                    <div class="orderFoot">
                        <div class="payBox">
                            <a class="btn btn-xl js_tijiao btn-orange" href="javascript:;" id="submitCreateOrder" submitflag="true">
                                立即下单
                            </a>
                            <p class="payBox-contract"><a href="javascript:;" class="check checked"><span class="checkbox"></span></a>已阅读并同意 <a href="javascript:;" class="orderLinkBtn js_xieyiBtn">骡窝窝旅游网预订条款</a></p>
                        </div>
                    </div>
                </div><!-- //orderMain -->
            </div>

        </div>
    </div><!-- //warp -->
</div><!-- //mainBox -->

<script>
    $(function () {
        //下单按钮绑定事件提交表单
        $('#submitCreateOrder').on('click', function () {
            //订单信息
            var orderProductId = $('#orderProductId').val();
            var orderProductCount = $('#orderProductCount').val();
            var orderProductType = $('#orderProductType').val();
            var orderUserName = $('#orderUserName').val();
            var orderUserPhone = $('#orderUserPhone').val();
            var orderUserCardNumber = $('#orderUserCardNumber').val();
            $.get("/order/createOrder",
                    {
                        orderProductId:orderProductId,
                        orderProductCount:orderProductCount,
                        orderProductType:orderProductType,
                        orderProductName:"${ticketInfo.name}",
                        orderUserName:orderUserName,
                        orderUserPhone:orderUserPhone,
                        orderUserCardNumber:orderUserCardNumber,
                        orderRealPrice:${ticketInfo.salePrice},
                        orderCreateUserId:${(userInfo.id)!0}
                    },
                    function (data) {
                checkData(data, 1000, "下单成功", "/mine/myorder", "no");
            });
        });
    })
</script>


<!-- 弹层 -->
<!-- 遮罩 -->
<div class="alertOpcity"></div>
<!-- 游玩人提示 -->
<div class="roomAlert" style="display: none;">
    <div class="roomAlert-wrap">
        <span class="tip-icon tip-icon-warning"></span>选择的联系人多于游玩人。
    </div>
</div>

<!-- 更多门票弹层(添加更多门票) -->
<div id="otherTicketDiv">
    <div class="ticketAlertBox addTicket">
        <a href="javascript:;" class="js_closeTicketAlert ticketAlertBox-close"><span class="orderIcon orderIcon-closebig"></span></a>
        <div class="ticketAlertBox-head">
            <h3>添加该景点其他门票</h3>
            <span class="dark">2019-07-22</span>
        </div>
        <dl class="ptditem">
            <dd class="pdSelect">选择</dd>
            <dd class="pdlvprice">价格</dd>
            <dt class="pdname">门票名称</dt>
        </dl>
        <div class="addTicket-table">
            <table>
                <tbody>
                </tbody>
            </table>
        </div><!-- //addTicket-table -->
        <div class="addTicket-btn">
            <a href="javascript:;" class="btn btn-lg btn-orange js_ticketConfirm">确认</a>
        </div>
    </div><!-- //addTicket --></div>

<!--范例弹出层结构 开始-->
<div class="fanli_box" style="display: none; left: 10px; top: -20px;">
    <ul class="fanli_tab">
        <li class="active">老版护照<span class="order_icon"></span></li>
        <li>新版护照<span class="order_icon"></span></li>
        <li>台湾通行证<span class="order_icon"></span></li>
        <li>港澳通行证<span class="order_icon"></span></li>
    </ul>

    <ul class="fanli_list">
        <li style="display:block;">
            <p>以中国大陆护照上的位置为例</p>
            <img src="http://pic.lvmama.com/img/v6/order/fanli_1.png" width="360" height="318">
        </li>
        <li>
            <p>以中国大陆护照上的位置为例</p>
            <img src="http://pic.lvmama.com/img/v6/order/fanli_2.png" width="360" height="318">
        </li>
        <li>
            <p>以中国大陆护照上的位置为例</p>
            <img src="http://pic.lvmama.com/img/v6/order/fanli_3.png" width="360" height="318">
        </li>
        <li>
            <p>以中国大陆护照上的位置为例</p>
            <img src="http://pic.lvmama.com/img/v6/order/fanli_4.png" width="360" height="318">
        </li>
    </ul>

    <div class="info_arrow"><span>◆</span><i>◆</i></div>
</div>






<div class="lv-safety">
    <a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息" href="http://www.miibeian.gov.cn/"></a>
    <a class="safety3" target="_blank" rel="nofollow" title="网络110报警服务" href="http://www.cyberpolice.cn"></a>
    <a class="safety4" target="_blank" rel="nofollow" title="支付宝特约商家"></a>
    <a class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a>
    <a class="safety6" target="_blank" rel="nofollow" title="上海工商" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>
    <a class="safety7" target="_blank" rel="nofollow" title="可信网站" href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&amp;comefrom=trust&amp;trustKey=dn&amp;trustValue=www.lvmama.com"></a>
    <a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业" href="https://credit.szfw.org/CX20160614015657160455.html" id="___szfw_logo___" hidefocus="false"></a>
    <a class="safety9" target="_blank" rel="nofollow" title="网络社会征信网" href="http://www.zx110.org"></a>
    <a class="safety10" target="_blank" rel="nofollow" title="360网站安全检测" href="http://webscan.360.cn"></a>
    <a class="safety11" target="_blank" rel="nofollow" title="网监安全" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>
    <a class="safety13" target="_blank" rel="nofollow" title="举报中心" href="http://www.shjbzx.cn/"></a>
</div>
</div><!-- //footer --><!-- 公共底部结束  -->

<link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/lv/ui.css">
<link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/lv/calendar.css,/styles/v4/modules/selectbox.css">


<#include "../common/footer.ftl">
</body>
</html>