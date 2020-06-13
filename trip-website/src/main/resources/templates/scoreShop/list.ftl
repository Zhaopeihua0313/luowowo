<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>积分商城</title>

    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/styles/ticketDetail.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>

    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/strategyDetail.css" rel="stylesheet" type="text/css">

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">

    <link href="http://css.mafengwo.net/css/cv/css+base:css+jquery.suggest:css+plugins:css+plugins+jquery.jgrowl:css+other+popup:css+app+topbar_v2^alw^1542357401.css" rel="stylesheet" type="text/css"/>
    <link href="http://css.mafengwo.net/css/daoju.css?1537192876" rel="stylesheet" type="text/css"/>

    <link href="/styles/scoreshop/css+base_css+jquery.suggest_css+plugins_css+plugins+jquery.jgrowl_css+other+popup_css+app+topbar_v2^alw^1542357401.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>

    <script>
        $(function () {
            //自动查询积分商品渲染
            var showProducts = function () {
                $.get('/score/productList', function (data) {
                    $("#itemBox").html(data);
                });
            };
            showProducts();
            var showMyProps = function () {
                $.get('/score/myProps', function (data) {
                    $("#itemBox").html(data);
                });
            };

            //积分商品 我的商品 切换绑定事件
            $("#shop").on('click', function () {
                $(this).addClass("active");
                $("#my_props").removeClass("active");
                $("#huaban").css("left", "0px");
                showProducts();
            });
            $("#my_props").on('click', function () {
                $(this).addClass("active");
                $("#shop").removeClass("active");
                $("#huaban").css("left", "180px");
                showMyProps()
            });

            //留言板刷新 渲染数据到页面
            var cmtList = function () {
                $.get('/score/cmtList', function (data) {
                    $("#cmt_list").html(data);
                });
            };
            cmtList();


            //留言按钮绑定事件
            $('#cmt_put').on('click', function () {
                var comment = $('#textarea').val();
                console.log(comment);

                if (comment.replace(/\s*/g,"") == "" || comment.replace(/\s*/g,"") == null) {
                    dialogCommon("请输入留言", 1000, "no");
                    return;
                }

                //发送请求留言
                $.get('/score/putComment', {comment:comment}, function (data) {
                    checkData(data, 1000, "留言成功~", "no", "no");
                    //刷新留言板数据渲染
                    cmtList();
                    $('#textarea').val("");
                })
            });
            


        });
    </script>

</head>

<style>
    .dialog {
        margin-left: 0px;
    }
</style>

<body style="padding-top: 0px!important;">
<form class="form-horizontal" action="/itemshop/buy" method="post" id="buyForm">
    <input id="itemId" type="hidden" value="0" name="id">

</form>

<#assign currentNav="scoreshop">
<#include "../common/navbar.ftl">


<div class="container">

    <div class="mt-nav clearfix" style="padding: 0px">

    </div>


    <!-- banner -->
    <div class="banner">
        <img src="http://images.mafengwo.net/images/daoju/banner.jpg" alt="">
    </div>

    <div class="row clearfix" style="width: 1300px;">
        <div class="col-main" style="width: 984px;">

            <div class="daoju_tab">
                <a id="shop" class="active _j_goods_tab" data-index="0">积分商品</a>
                <a class="_j_goods_tab"   id="my_props"     data-index="1">我已购买</a>
                <strong style="left: 0px" id="huaban"></strong>
            </div>
            <#--道具商店 商品列表-->
            <div id="itemBox" class="daoju_list  _j_goods_list" data-flag="0" data-total="2">
                <#--这里面是产品列表-->
            </div>

            <div class="pagin" id="smallpager">
            </div>

        </div>
        <div class="col-side">

            <#--你的金币！！！！！！！！！！！！！！！-->
            <div class="side_my">
                <p>你的积分金币</p>
                <div id="gold" class="gold">
                    <i></i>${(scoreBox.totalScore)!}
                    <span style="font-size: 10px;color: #1ec896">100积分对应1块钱</span>
                </div>
            </div>

            <#--留言板-->
            <div class="side_cmt">
                <div class="tit">留言板</div>
                <div class="con">
                    <div id="_j_comment_cnt">

                        <div class="addComment clearfix">
                            <div class="pub">
                                <textarea id="textarea" class="_j_comment_pubarea"></textarea>
                                <input type="button" class="_j_comment_pubbtn" value="发表留言" id="cmt_put">
                            </div>
                        </div>


                        <div class="commentList _j_comment_list"></div>
                        <div class="page _j_comment_pagination"></div>


                        <ul id="cmt_list" class="cmt_list">

                            <li class="_j_citem" data-uid="10" data-username="秋刀鱼223">
                                <a href="" class="photo"><img src="/images/1.jpg"></a>
                                <a href="" class="user">秋刀鱼223</a>
                                <a href="" class="level">LV.98</a>
                                <a href="#" class="_j_reply">回复</a>
                                <span class="date">2019-7-22 17:18:17</span>
                                <p>555</p>
                            </li>
                            <li class="_j_citem" data-uid="12" data-username="秋刀鱼223">
                                <a href="" class="photo"><img src="/images/1.jpg"></a>
                                <a href="" class="user">秋刀鱼223</a>
                                <a href="" class="level">LV.98</a>
                                <a href="#" class="_j_reply">回复</a>
                                <span class="date">2019-7-22 17:17:34</span>
                                <p>555</p>
                            </li>


                        <#--{{each(i, comment) comment_list}}
                            <li class="_j_citem" data-cid="${comment.id}" data-username="${comment.user.name}">
                                <a href="/u/${comment.uid}.html" class="photo"><img src="${comment.user.logo_48}"></a>
                                <a href="/u/${comment.uid}.html" class="user">${comment.user.name}</a>
                                <a href="/u/${comment.uid}.html" class="level">LV.${comment.user.user_lv}</a>
                                <a href="#" class="_j_reply">回复</a>
                                <span class="date">${comment.ymdhitime}</span>
                                <p>${comment.content}</p>
                            </li>
                        {{/each}}-->
                        </ul>


                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<#--<script type="text/x-jquery-tmpl" id="_j_pagitmpl">
{{if pageTotal > 1}}
   <div class="pagin">
        <span>${currPage}/${pageTotal}</span>
            {{if currPage > 1}}
        <a title="上一页" href="#" class="btn-left _j_pageitem" data-page="${currPage - 1}"></a>
            {{/if}}
                {{if currPage < pageTotal}}
        <a title="下一页" href="#" class="btn-right _j_pageitem" data-page="${currPage + 1}"></a>
            {{/if}}
    </div>
{{/if}}
</script>-->
<#--<script type="text/x-jquery-tmpl" id="pagination_tmpl">
{{if pageTotal > 1}}
<div align="right" class="page-box">
    <span class="count">共<span>${pageTotal}</span>页 / <span>${total}</span>条</span>
    {{if currPage > 1}}
    <a class="ti prev _j_pageitem" data-page="${currPage - 1}">前一页</a>
    {{/if}}
    {{if indexers[indexers.length-1] > 10}}
    <a class="ti _j_pageitem" data-page="1">1...</a>
    {{/if}}
    {{each(i, index) indexers}}
    {{if index == currPage}}
    <span class="ti this-page">${index}</span>
    {{else}}
    <a class="ti _j_pageitem" data-page="${index}">${index}</a>
    {{/if}}
    {{/each}}
    {{if indexers[indexers.length-1] < pageTotal}}
    <a class="ti _j_pageitem" data-page="${pageTotal}">...${pageTotal}</a>
    {{/if}}
    {{if currPage < pageTotal}}
    <a class="ti next _j_pageitem" data-page="${currPage + 1}">后一页</a>
    {{/if}}
</div>
{{/if}}
    </script>-->



<#--<script>
    M.closure(function(require){
        var Alert = require('dialog/alert'),
                Confirm = require('dialog/confirm');

        // page
        var Pagination = require('Pagination'),
                page = new Pagination({
                    'container': '#smallpager',
                    'tmpl': '#pagination_tmpl',
                    'total': $('._j_goods_list').data('total'),
                    'pageSize': 6,
                    'pageDisplayNum': 4,
                    'callback': function(pageIndex) {
                        goodsList(pageIndex);
                    }
                });
        page.drawPage();

        var flag = $('._j_goods_list').data('flag');
        $('._j_goods_tab').click(function(ev){
            var index = $(ev.currentTarget).data('index');
            if(index != flag){
                flag = index;
                $('._j_goods_tab').removeClass('active');
                $(ev.currentTarget).addClass('active');
                $(ev.currentTarget).siblings('strong').animate({left:180*flag},300);
                goodsList(0);
            }
        });

        function goodsList(page){
            $.get('/mall/ajax_virtual_goods/list',{ 'flag':flag,'page':page},function(res){
                if(!res.error && res.data.html){
                    $('._j_goods_list').html(res.data.html);
                    resetPage(page,res.data.total);
                    if(flag == 1 && res.data.total == 0){
                        $('._j_goods_list').html('<div class="daoju_none">\
                                <img src="http://images.mafengwo.net/images/daoju/none.png" alt="">\
                                <p>你还没有购买过任何道具哦~</p>\
                        </div>');
                    }
                }
            },'json');
        }

        function resetPage(pageIndex, total) {
            pageIndex = pageIndex ? pageIndex : pageIndex + 1;
            page.currPage = pageIndex;
            if(total > 0) {
                $('#smallpager').show();
                page.total = total;
            }else{
                $('#smallpager').hide();
            }
            page.drawPage();
        }

        var uid = window.Env.UID,
                canClick = true;
        $('._j_goods_list').delegate('._j_buy','click',function(ev){
            if(!uid){
                window.location.href = 'https://passport.mafengwo.cn/';
            }
            var id = $(ev.currentTarget).data('id');
            if(id){
                Confirm.pop('确认购买？',function(){
                    if(canClick){
                        canClick = false;
                        $.post('/mall/ajax_virtual_goods/buy',{ 'id':id,'num':1},function(res){
                            if(!res.error && res.data.data){
                                if(res.data.data.check == 0){
                                    Alert.pop('请联系管理员');
                                }else if(res.data.data.check == 2){
                                    Alert.pop('购买的商品已下架');
                                }else if(res.data.data.check == 3){
                                    Alert.pop('购买的商品无足够库存');
                                }else if(res.data.data.check == 4){
                                    Alert.pop('你已超过改商品的购买次数');
                                }else if(res.data.data.check == 5){
                                    Alert.pop('不能超过该商品的拥有数量');
                                }else if(res.data.data.check == 6){
                                    Alert.pop('你的金币不够');
                                }else if(res.data.data.check == 7){
                                    Alert.pop('你的蜂蜜不够');
                                }else{
                                    Alert.pop('购买成功','',3);
                                    window.location.href = '/mall/virtual_goods.php?flag=1';
                                }
                            }
                            canClick = true;
                        });
                    }
                });
            }
        }).delegate('._j_not_buy','click',function(){
            Alert.pop('不能购买');
        }).delegate('._j_not_buy_times','click',function(){
            Alert.pop('此道具你已超过购买次数');
        }).delegate('._j_not_use','click',function(){
            Alert.pop('不能使用');
        });

        M.Event.on('virtual_goods_used',function(agr){
            var orderId = agr.order_id,
                    userNum = agr.used_num,
                    nowNuM = $('._j_order_'+orderId+'').find('._j_can_user_num').data('num'),
                    num = nowNuM - userNum ? nowNuM - userNum : 0;
            $('._j_order_'+orderId+'').find('._j_can_user_num').html('可用'+num);
        });


        //============================================================这里是自己写的
        $(".daoju_tab a").click(function () {
            $("#queryType").val($(this).data("index"))

            $("#itemForm").ajaxSubmit(function (data) {
                //console.log(data);
                $("#itemBox").html(data);

                //绑定购买的点击事件
                $(".buy .btn_buy").click(function () {
                    var id = $(this).data("id");

                    Confirm.pop('确认购买？'+id+"号商品",function(){
                        if(canClick){
                            //console.log("123");
                            $("#itemId").val(id);
                            //Confirm.pop(id);
                            //itemId
                            $("#buyForm").ajaxSubmit(function (data) {
                                if(data.success!=true){
                                    Alert.pop(data.msg);

                                }else{
                                    Alert.pop("已经装入你的百宝袋,请查看");
                                    setTimeout(function () {
                                        window.location.href="/itemshop/list";
                                    }, 1000);

                                }

                            })
                            //window.location.href = '/mall/itemshop/list
                            //location.reload();

                        }
                    })
                })
            })

        })


        //初始化
        $("#shop").click();

        //点击回复触发文本框选中事件并填充内容

        $("._j_citem").click(function () {
            $("#toId").val($(this).data("uid"));
            $("#textarea").val("回复@"+$(this).data("username")+":").focus();

        });

        //发表留言
        $("._j_comment_pubbtn").click(function () {
            //Alert.pop(123);
            //content
            $("#content").val($("#textarea").val());

            //提交表单
            $("#commentForm").ajaxSubmit(function (data) {
                //Alert.pop("评论成功");
                $("#cmt_list").html(data);
                $("#textarea").val("");

                $("._j_citem").click(function () {
                    $("#toId").val($(this).data("uid"));
                    $("#textarea").val("回复@"+$(this).data("username")+":").focus();

                });

            })


        });

        $("._j_comment_pubbtn").click();




    });
</script>-->

<link href="http://css.mafengwo.net/css/mfw-footer.css?1558532347" rel="stylesheet" type="text/css"/>
<link href="http://css.mafengwo.net/css/mfw-toolbar.css?1537192876" rel="stylesheet" type="text/css"/>

<#--自己的尾部   -->
<#include "../common/footer.ftl">

<#--原生尾部-->
<#--
<div id="footer">
    <div class="ft-content" style="width: 1105px">
        <div class="ft-copyright">
            <a href="http://www.mafengwo.cn"><i class="ft-mfw-logo"></i></a>
            <p>© 2019 Mafengwo.cn <a href="http://www.miibeian.gov.cn/" target="_blank" rel="nofollow">京ICP备11015476号</a> <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502013401" target="_blank"><img src="http://www.wolfcode.cn/themes/simplebootx/Public/self/img/index/school-environment5.png" width="12" style="margin:0 2px 4px 0;">京公网安备11010502013401号</a> <a href="http://images.mafengwo.net/images/about/icp2.jpg" target="_blank" rel="nofollow">京ICP证110318号</a><span class="m_l_10">违法和不良信息举报电话: 010-59222790 举报邮箱: mfwjubao@mafengwo.com</span></p>
            <p>网络出版服务许可证：(总)网出证(京)字第161号<span class="m_l_10">增值电信业务经营许可证：京B2-20180228</span> <a href="https://n1-q.mafengwo.net/s12/M00/A5/45/wKgED1xJi3uAA7KLAAf_CkKLHRQ87.jpeg" target="_blank" rel="nofollow" class="m_l_10">营业执照</a><a href="/sales/uhelp/doc" target="_blank" rel="nofollow" class="m_l_10">帮助中心</a><span class="m_l_10">马蜂窝客服：国内</span><span class="highlight">4006-345-678</span><span class="m_l_10">海外</span> <span class="highlight">+86-10-5922-2799</span></p>
        </div>
        <div class="ft-safety">
            <a class="s-a" target="_blank" href="https://search.szfw.org/cert/l/CX20140627008255008321" id="___szfw_logo___"></a>
            <a class="s-b" href="https://ss.knet.cn/verifyseal.dll?sn=e130816110100420286o93000000&ct=df&a=1&pa=787189" target="_blank" rel="nofollow"></a>
            <a class="s-c" href="http://www.itrust.org.cn/Home/Index/itrust_certifi/wm/1669928206.html" target="_blank" rel="nofollow"></a>
            <a class="s-d" href="http://www.itrust.org.cn/Home/Index/satification_certificate/wm/MY2019051501.html" target="_blank" rel="nofollow"></a>
        </div>

    </div>
</div>
<div class="mfw-toolbar" id="_j_mfwtoolbar">
    <div class="toolbar-item-top">
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


            <img src="http://www.wolfcode.cn/themes/simplebootx/Public/self/img/index/school-environment5.png" width="450" height="192" >
        </a>
        <!--<div class="wx-official-pop"><img src="http://images.mafengwo.net/images/qrcode-weixin.gif"><i class="_j_closeqrcode"></i></div>&ndash;&gt;
    </div>
    <div class="toolbar-item-down">
        <a role="button" class="btn _j_gobottom">
            <i class="icon_down"></i>
            <em>页面底部</em>
        </a>
    </div>
</div>-->


<script language="javascript" type="text/javascript">
    if (typeof M !== "undefined" && typeof M.loadResource === "function") {
        M.loadResource("http://js.mafengwo.net/js/cv/js+pageletcommon+pageHeadUserInfoWWWDark:js+jquery.tmpl:js+M+module+FrequencyVerifyControl:js+M+module+FrequencyAppVerify:js+M+module+Pagination:js+activity+MComment:js+M+module+dialog+Layer:js+M+module+dialog+DialogBase:js+M+module+dialog+Dialog:js+M+module+dialog+alert:js+M+module+dialog+confirm:js+M+module+PageAdmin:js+M+module+Storage:js+M+module+Cookie:js+M+module+ResourceKeeper:js+jquery.jgrowl.min:js+AMessage:js+M+module+FrequencySystemVerify:js+ALogin:js+M+module+ScrollObserver:js+M+module+QRCode:js+AToolbar:js+ACnzzGaLog:js+ARecruit:js+ALazyLoad^ZlNT^1561616124.js");
    }
</script>
<form class="form-horizontal" action="/itemshop/query" method="post" id="itemForm">
    <input id="queryType" type="hidden" value="0" name="queryType">

</form>
<form class="form-horizontal" action="/itemshop/comment" method="post" id="commentForm">
    <input id="toId" type="hidden" value="-1" name="toId">
    <input id="content" type="hidden" value="0000" name="content">
</form>

</body>
</html>