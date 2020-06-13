<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>机票查询</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/css+hotel+datepicker-range^a1w^1552035728.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/css+mfw-header.2015^ylvs^1559526017.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/mfw-footer.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/mfw-toolbar.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/js/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>
    <script type="text/javascript" src="/js/plugins/jrender/jrender.min.js"></script>

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">

    <style>
        .arrow {
            width: 78px;
            height: 7px;
            margin-top: 15px;
            display: inline-block;
            background: url('/images/flight/sprites4.png') -50px -150px no-repeat;
            background-size: auto;
            vertical-align: middle;
        }

        .btn_search > a {
            display: block;
            background-color: #ff9d00;

            color: #fff;
            font-size: 18px;
            position: absolute;
            right: 50;
            right: 50px;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .flightpc-children .flightpc-children-test, .flightpc-children .flightpc-children-test span {
            display: inline-block;
            vertical-align: middle;
            font-size: 12px;
            font-family: PingFangSC-Light;
            font-weight: 300;
            line-height: 16px;
            margin-left: 8px;
        }

        .flightpc-children .flightpc-children-test span {
            color: #717376;
        }

        }
        .flightpc-children .flightpc-children-test, .flightpc-children .flightpc-children-test span {
            display: inline-block;
            vertical-align: middle;
            font-size: 12px;
            font-family: PingFangSC-Light;
            font-weight: 300;
            line-height: 16px;
            margin-left: 8px;
        }

        .flightpc-children .flightpc-children-icon {
            margin-top: 1px;
            margin-left: 8px;
            display: inline-block;
            vertical-align: middle;
            width: 14px;
            height: 14px;
            background-image: url(https://p1-q.mafengwo.net/s14/M00/A9/BC/wKgE2l0lkt2AHBFrAAACA5pPOCI472.png);
            background-size: 100% 100%;
            position: relative;
        }

        .flightpc-children .flightpc-children-icon .flightpc-children-desc:after, .flightpc-children .flightpc-children-icon .flightpc-children-desc:before {
            content: "";
            width: 0;
            height: 0;
            font-size: 0;
            border-left: 6px dashed transparent;
            border-right: 6px dashed transparent;
            position: absolute;
            left: 94px;
            margin-left: -3px;
        }

        .flightpc-children .flightpc-children-icon .flightpc-children-desc:before {
            border-bottom: 6px solid #e5e5e5;
            top: -6px;
        }

        .flightpc-children .flightpc-children-btn {
            margin-left: 67px;
            display: inline-block;
            vertical-align: middle;
            width: 14px;
            height: 14px;
            border-radius: 14px;
            background: #fff;
            border: 1px solid #e5e5e5;
        }

        .flightpc-children .active {
            width: 6px;
            height: 6px;
            background: #fff;
            border-radius: 12px;
            border: 5px solid #ff9d00;
        }

        .flightpc-children .flightpc-children-icon .flightpc-children-desc:after {
            border-bottom: 6px solid #fff;
            top: -5px;
        }

        .flightpc-children .flightpc-children-icon .flightpc-children-desc:after, .flightpc-children .flightpc-children-icon .flightpc-children-desc:before {
            content: "";
            width: 0;
            height: 0;
            font-size: 0;
            border-left: 6px dashed transparent;
            border-right: 6px dashed transparent;
            position: absolute;
            left: 94px;
            margin-left: -3px;
        }

        .flightpc-children .flightpc-children-icon:hover .flightpc-children-desc {
            display: block;
        }

        .flightpc-children .flightpc-children-icon .flightpc-children-desc {
            display: none;
            position: absolute;
            left: -91px;
            top: 20px;
            width: 496px;
            height: auto;
            padding: 12px;
            background: #fff;
            -webkit-box-shadow: 0 1px 5px 1px rgba(0, 0, 0, .12);
            box-shadow: 0 1px 5px 1px rgba(0, 0, 0, .12);
            z-index: 100;
            border-radius: 4px;
        }


    </style>

    <script>
        $(function () {
            //查询类别开关，api 是用接口，my 是用数据库数据源
            var source = "api";

            //携带儿童按钮绑定事件
            $('.flightpc-children-btn').click(function () {
                if ($('.flightpc-children-btn').hasClass('active')) {
                    $('.flightpc-children-btn').removeClass("active");
                    source = "my";
                } else {
                    $('.flightpc-children-btn').addClass('active');
                    source = "api";
                }
            });


            //出发城市三字码
            var orgCity;
            //到达城市三字码
            var dstCity;
            //出发航班城市的标签点击事件 (为文本框赋值)
            $(".departGroupLayer a").click(function () {
                $("#departCity").val('');
                var flight = $(this).data('name');
                orgCity = $(this).data('code');
                $("#departCity").val(flight);
                $("#departCityLayer").css('display', 'none');
            });

            //航班城市选择框的显示
            $("#departCity").click(function () {
                $("#departCityLayer").css('display', 'block');
            });

            //到达航班城市的标签点击事件 (为文本框赋值)
            $(".destGroupLayer a").click(function () {
                $("#destCity").val('');
                var flight = $(this).data('name');
                dstCity = $(this).data('code');
                $("#destCity").val(flight);
                $("#destCityLayer").css('display', 'none');
            });

            //航班城市选择框的显示
            $("#destCity").click(function () {
                $("#destCityLayer").css('display', 'block');
            });

            var tab = '#hot';

            //城市选择款的nav栏
            $(".hcl-sort").mouseenter(function () {
                $(this).attr('class', 'hcl-sort on');
                $(tab).css('display', 'none');
                tab = '#' + $(this).data('tab');
                $(tab).css('display', 'block');
            });

            //城市选择款nae栏的颜色改变
            $(".hcl-sort").mouseleave(function () {
                $(this).attr('class', 'hcl-sort');
            });

            //' 换'按钮的点击事件
            $("#citySwitc").click(function () {
                //值切换
                var temp = $("#departCity").val();
                var destval = $("#destCity").val();
                $("#departCity").val(destval);
                $("#destCity").val(temp);
                //三字码
                var temp2 = orgCity;
                orgCity = dstCity;
                dstCity = temp2;
            });

            //查询按键点击处理
            $("#search").click(function () {
                var deptTime = $("#depTime").val();
                console.log(orgCity);
                console.log(dstCity);
                console.log(deptTime);

                if (!orgCity || !dstCity || !deptTime ) {
                    dialogCommon("请输入完整参数", 1000, "no");
                }

                //发送异步请求查询航班数据
                $.get('/flight/search_'+source, {'orgCity': orgCity, 'dstCity': dstCity, 'depTime': deptTime, 'source': source}, function (data) {

                    console.log(data);

                    //调用自己 mysql 数据源
                    if (source == "my") {
                        //查询无航班时提示，自己的数据源
                        if (data.replace(/\s*/g,"") == "" || data.replace(/\s*/g,"") == null) {
                            dialogCommon("无对应航班", 1000, "no");
                            return;
                        }
                        //把查询到的数据页面内嵌到页面里
                        $("#airinfo").html(data);
                    } else {
                        //调用接口的
                        if (data.success) {
                            console.log(data);
                            //console.log(data.derrCode);
                            var flightInfo = data.data;
                            var a = JSON.parse(flightInfo); //查询不到航班时 a=null
                            if (a.errCode != 0) {
                                console.log("111");
                                dialogCommon("请输入参数", 100220, "no");
                                return;
                            }


                            console.log("a:::::");
                            var flightInfos = a.flightInfos;
                            console.log(flightInfos);
                            if (flightInfos.length > 0) {
                                //伪造自己数据
                                var infoStr = JSON.stringify(flightInfos);
                                var reg = eval('/' + "机场" + '/g');
                                var reg1 = eval('/' + "国际" + '/g');
                                infoStr = infoStr.replace(reg, "加薪机场 ヾ(✿ﾟ▽ﾟ)ノ  ");
                                infoStr = infoStr.replace(reg1, "(0▽0)");
                                flightInfos = JSON.parse(infoStr);

                                //var b = a.result.output.result;
                                $("#airinfo").renderValues({list: flightInfos}, {
                                    beginFly: function (item, value) {
                                        $(item).html(value.substr(11, 5));
                                    },
                                    endFly: function (item, value) {
                                        $(item).html(value.substr(11, 5));
                                    },
                                    fprice: function (item, value) {                //用来提供航班机票价格
                                        var valStr = JSON.stringify(value);
                                        $(item).html(value.price);
                                    }
                                });

                                /**
                                 * 订购按钮绑定事件 获取航班数据 到下单页面
                                 */
                                $(".btn_search_jx").on("click", function () {
                                <#if !userInfo??>
                                    dialogCommon("请登录再订购", 1000, "no");
                                <#else >
                                    var the = $(this);

                                    var r = confirm("确认是否订购该机票？");
                                    if (r == true) {
                                        //alert("预订成功!");
                                        //封装航班数据
                                        var flightNo = the.find('.my-flightNo').html();
                                        var tkTime = the.find('.my-tkTime').html();
                                        var leavePort = the.find('.my-leavePort').html();
                                        var arTime = the.find('.my-arTime').html();
                                        var arrivePort = the.find('.my-arrivePort').html();
                                        var price = the.find('.my-price').html();
                                        var leaveCity = the.find('.my-leaveCity').html();
                                        var arriveCity = the.find('.my-arriveCity').html();

                                        var dataJson = {
                                            flightNo:flightNo,
                                            tkTime:tkTime,
                                            leavePort:leavePort,
                                            arTime:arTime,
                                            arrivePort:arrivePort,
                                            price:price,
                                            leaveCity:leaveCity,
                                            arriveCity:arriveCity
                                        };

                                        //制造form 去机票下单页面
                                        var formHtml = $("<form method='post' action='/order/flight'>" +
                                                "<input type='hidden' name='flightNo' value='"+ flightNo +"' >" +
                                                "<input type='hidden' name='tkTime' value='"+ tkTime +"' >" +
                                                "<input type='hidden' name='leavePort' value='"+ leavePort +"' >" +
                                                "<input type='hidden' name='arTime' value='"+ arTime +"' >" +
                                                "<input type='hidden' name='arrivePort' value='"+ arrivePort +"' >" +
                                                "<input type='hidden' name='price' value='"+ price +"' >" +
                                                "<input type='hidden' name='leaveCity' value='"+ leaveCity +"' >" +
                                                "<input type='hidden' name='arriveCity' value='"+ arriveCity +"' >" +
                                                "</form>");
                                        var form = $(formHtml);
                                        $(document.body).append(form);
                                        form.submit();

                                    } else {
                                        alert("取消预订!");
                                    }
                                </#if>
                                });

                            } else {
                                dialogCommon("无对应航班", 1000, "no");
                            }

                        } else {
                            if (data.msg) {
                                dialogCommon(data.msg, 1000, "no");
                            }
                        }
                    }

                });
            });

        });
    </script>
</head>

<body>
<#assign currentNav="flight">
<#include "../common/navbar.ftl">
<div class="container" ng-controller="indexController">
    <div class="m-title"><i class="icon-flight"></i>国内机票</div>
    <div class="fm flight">
        <div class="book-form">
            <ul class="book-tab">
                <li class="on" id="one_way_btn" ng-click="setOneWay()"><a href="javascript:;"><i class="icon-go"></i>单程</a>
                </li>
                <li class="" id="round_way_btn" ng-click="setRonudWay()"><a href="javascript:;"><i
                        class="icon-round"></i>往返</a></li>
            </ul>
            <div class="book-content" style="height: 300px;">
                <div class="item">
                    <span class="label">出发城市</span>
                    <div class="inp-wrap">
                        <label><input type="text" id="departCity" placeholder="点击输入" class="ng-pristine ng-valid"
                                      data-code=""></label>
                    </div>
                    <div class="hot-city-layer" id="departCityLayer" style="width: 490px; display: none;">
                        <!--航班城市分类导航栏-->
                        <div class="hcl-nav">
                            <a class="hcl-sort on" id="departHotTab" data-tab="hot" href="javascript:;">国内热门</a>
                            <a href="javascript:;" data-tab="ABCDE" class="hcl-sort">ABCDE</a>
                            <a href="javascript:;" data-tab="FGHJ" class="hcl-sort">FGHJ</a>
                            <a href="javascript:;" data-tab="KLMNP" class="hcl-sort">KLMNP</a>
                            <a href="javascript:;" data-tab="QRSTW" class="hcl-sort">QRSTW</a>
                            <a href="javascript:;" data-tab="XYZ" class="hcl-sort">XYZ</a>
                        </div>
                        <!--航班城市列表-->
                        <div class="hcl-list" id="startFlight">
                            <div class="departGroupLayer ng-scope" id="hot" style="display: block;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list hotFlights as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="ABCDE" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialA as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="FGHJ" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialF as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="KLMNP" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialK as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="QRSTW" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialQ as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="XYZ" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialX as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="switch"><a href="javascript:;" id="citySwitc">换</a></span>
                <div class="item">
                    <span class="label">到达城市</span>
                    <div class="inp-wrap">
                        <label><input type="text" id="destCity" placeholder="点击输入" ng-model="destCityName"
                                      class="ng-pristine ng-valid" data-code=""></label>
                    </div>
                    <div class="hot-city-layer" id="destCityLayer" style="width: 490px; display: none;">
                        <!--航班城市分类导航栏-->
                        <div class="hcl-nav">
                            <a class="hcl-sort on" id="departHotTab" data-tab="hot2" href="javascript:;">国内热门</a>
                            <a href="javascript:;" data-tab="ABCDE2" class="hcl-sort">ABCDE</a>
                            <a href="javascript:;" data-tab="FGHJ2" class="hcl-sort">FGHJ</a>
                            <a href="javascript:;" data-tab="KLMNP2" class="hcl-sort">KLMNP</a>
                            <a href="javascript:;" data-tab="QRSTW2" class="hcl-sort">QRSTW</a>
                            <a href="javascript:;" data-tab="XYZ2" class="hcl-sort">XYZ</a>
                        </div>
                        <!--航班城市列表-->
                        <div class="hcl-list" id="startFlight">
                            <div class="destGroupLayer ng-scope" id="hot2" style="display: block;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list hotFlights as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="ABCDE2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialA as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="FGHJ2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialF as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>

                            <div class="destGroupLayer ng-scope" id="KLMNP2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialK as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="QRSTW2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialQ as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="XYZ2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialX as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.cityName}" data-code="${ele.cityCode}">${ele.cityName}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <!--出发时间-->
                <div class="item">
                    <span class="label">出发日期</span>
                    <div class="inp-wrap">
                        <input id="depTime" type="text" onclick="WdatePicker()" placeholder="点击输入">
                    </div>
                </div>
            <#--返回日期-->
                <div class="item" id="goTime" style="display: none">
                    <span class="label">返回日期</span>
                    <div class="inp-wrap">
                        <input id="depTime" type="text" onclick="WdatePicker()" placeholder="点击输入">
                    </div>
                    <script>
                        $(function () {
                            $('#round_way_btn').on('click', function () {
                                $('#one_way_btn').removeClass("on");
                                $(this).addClass("on");
                                $('#goTime').show();
                            });
                            $('#one_way_btn').on('click', function () {
                                $('#round_way_btn').removeClass("on");
                                $(this).addClass("on");
                                $('#goTime').hide();
                            });

                        });
                        $(document).ready(function (e) {
                            $("#one_way_btn").click(function (e) {
                                if ($(".inp-wrap").hasClass("show")) {
                                    // 执行隐藏
                                    $(".inp-wrap").hide().removeClass("show");
                                }

                            });
                        });
                    </script>
                </div>
                <div class="flightpc-children">
                    <div class="flightpc-children-btn active"></div>
                    <div class="flightpc-children-test">
                        携带儿童
                        <span>(2-12岁)</span></div>
                    <div class="flightpc-children-icon">
                        <div class="flightpc-children-desc">
                            <div class="fpc-children-desc-title" style="font-weight: bolder">儿童票购票说明</div>
                            <div class="fpc-children-desc-h">儿童票(2-12岁，按乘机当天的实际年龄计算)
                            </div>
                            <div class="fpc-children-desc-p">
                                1. 2岁(含)-12岁(不含)请购买儿童票。票价为成人全价票的50%，不收取机场建设费，燃油费收取成人的50%。暂不支持儿童购买成人折扣票。
                            </div>
                            <div class="fpc-children-desc-p">
                                2. 购买儿童票时需同时购买成人票，一个成人最多携带两名儿童。已购买完成人票想要再补订儿童票时，请直接联系相应航空公司。
                            </div>
                            <div class="fpc-children-desc-p">
                                3. 购买儿童票时可选择证件类型为身份证(填写户口本上登记的身份证号)，乘机时可用户口本登机。
                            </div>
                            <div class="fpc-children-desc-p">
                                4. 在新增联系人时正常录入乘机人姓名和证件号码即可，系统会根据出生日期和乘机日期自动判断所选乘客是否为儿童，并计算相应的票价。
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item item-btn" style="padding-top: 20px;"><a href="javascript:;" id="search">搜索</a></div>
            </div>
        </div>
        <div class="flight-focus">
            <div class="flight-slide" data-mes-g="0-2" data-mes-t="轮播图区域" data-slide="1"
                 style="position: relative; overflow: hidden;height: 391px;">
                <img id="ad" src="" alt="广告图标">
                <ul class="slide-img" style="width:3650px;" data-mes-g="0-2-0" data-mes-t="轮播图">
                    <li style="position: absolute; width: 730px;">
                        <a href="" target="_blank" data-index="0" data-url="" data-param="扫码购机票" data-source="www">
                            <img src="https://b3-q.mafengwo.net/s14/M00/1B/6B/wKgE2l0IoqiADHpKAAItDErw7lk257.png?imageMogr2%2Fthumbnail%2F%21620x350r%2Fgravity%2FCenter%2Fcrop%2F%21620x350%2Fquality%2F100"
                                 height="350" width="620" style="height: 392px;">
                        </a>
                    </li>
                </ul>
            <#--<ul class="slide-nav" data-mes-g="0-2-1" data-mes-t="导航区">
                <li class="on" data-mes-g="0-2-1-0" data-mes-t="导航0">扫码购机票</li>
            </ul>-->
                <span class="slide-btn btn-left" data-btn-prev="1" data-mes-g="0-2-2" data-mes-t="控制左"
                      style="display: none;"><i></i></span>
                <span class="slide-btn btn-right" data-btn-next="1" data-mes-g="0-2-3" data-mes-t="控制右"
                      style="display: none;"><i></i></span>
            </div>
        </div>
        <!--//轮播图-->
        <div class="fm service">
            <ul>
                <li class="s1" style="margin-top: 43px;"><i></i>100%航协认证</li>
                <li class="s2"
                "><i></i>出行保证</li>
                <li class="s3"
                "><i></i><span>7x24小时服务<br><strong>4006345678</strong></span></li>
            </ul>
        </div> <!--保证-->
    </div>

<#-- ----------------------------------------------- -->
    <div class="f-sortbar">
        <div class="loading-bar"><span id="progress_bar" style="width: 100%; display: none;"></span></div>
        <ul class="clearfix">
            <li class="item1">航空信息</li>
            <li class="item2" ng-click="sortByDepTime()"><span class="f-sort" id="sort_dep_time">起飞时间<i
                    class="up"></i><i class="down"></i></span></li>
            <li class="item3" ng-click="sortByArrTime()"><span class="f-sort" id="sort_arr_time">到达时间<i
                    class="up"></i><i class="down"></i></span></li>
        </ul>
    </div>

    <#--接口数据源-->
    <div id="airinfo" >

        <#--航班列表循环 -->
        <div id="flight_list" style="" render-loop="list">
            <div class="f-list ng-scope" ng-repeat="one in result.flights|orderBy:sort.key:sort.type" ng-if="loaded">
                <div class="f-item" ng-attr-id="{{ 'airline-item-' + one.flight_no }}" ng-click="showSubInfo(one)"
                     id="airline-item-9C8542">
                    <div class="f-item-info ng-scope" ng-if="one.flight_no" style="position: relative">
                        <div class="f-line">
                            <span class="airline-logo"><i ng-attr-id="{{ 'logo-item-' + one.flight_no }}"
                                                          id="logo-item-9C8930" class="airline-logo-9C"></i></span>
                            <p class="f-name ng-binding">航班<span class="ng-binding"></span>
                            </p>
                            <#--渲染 航班号 list.flightNo #################################-->
                            <p class="sub ng-binding" render-html="list.flightNo">航班号</p>
                        </div>
                        <div class="f-time">
                            <#--渲染 起飞时间 list.tkTime #################################-->
                            <div class="time ng-binding" ng-bind="one.dep_time" render-key="list.tkTime"
                                 render-fun="beginFly">起飞时间
                            </div>
                            <#--渲染 起飞机场 list.leavePort #################################-->
                            <p class="sub ng-binding" render-html="list.leavePort">起飞机场</p>
                        </div>
                        <div class="through">
                            <div class="arrow"></div>
                            <p class="duration ng-binding" ng-bind="one.takingTime"></p>
                            <div class="f-pop f-pop-stay">
                                <i class="pop-arrow"></i>
                                <strong>经停</strong>
                                <p>经停城市：<span ng-bind="one.stop_infos.city_name" class="ng-binding"></span></p>
                            </div>
                        </div>
                        <div class="f-time">
                            <#--渲染 降落时间 list.arTime #################################-->
                            <div class="time ng-binding" ng-bind="one.arr_time" render-key="list.arTime"
                                 render-fun="endFly">降落时间
                            </div>
                            <#--渲染 降落机场 list.arrivePort #################################-->
                            <p class="sub ng-binding" render-html="list.arrivePort">降落机场</p>
                        </div>
                        <#--订购-->
                        <div class="item item-btn btn_search">
                            <#--订购按钮 the-->
                            <a id="btn_search" class="btn_search_jx"
                                >订购
                                <span render-html="list.flightNo" class="my-flightNo" style="display:none;"></span>
                                <span render-html="list.tkTime" class="my-tkTime" style="display:none;"></span>
                                <span render-html="list.leavePort" class="my-leavePort" style="display:none;"></span>
                                <span render-html="list.arTime" class="my-arTime" style="display:none;"></span>
                                <span render-html="list.arrivePort" class="my-arrivePort" style="display:none;"></span>
                                <span render-html="list.leaveCity" class="my-leaveCity" style="display:none;"></span>
                                <span render-html="list.arriveCity" class="my-arriveCity" style="display:none;"></span>
                                <span  class="my-price" style="display:none;"
                                      render-key="list.lowestPriceInfo" render-fun="fprice"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#--自己的 mysql 数据源-->
    <div id="data">
    </div>

</div>

<#include "../common/footer.ftl">

</body>

</html>