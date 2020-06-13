<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>景点:${scenic.name}</title>
    <link href="./styles/base.css" rel="stylesheet" type="text/css">
    <link href="./styles/replyDetail.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/common.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/system/common.js"></script>
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script>
        $(function () {

            //查询评论列表
            $('#searchForm').ajaxSubmit(function (data) {
                $("#scenicComment").html(data);
            });


            var num = 0;
            //图片上传
            var rect;
            $('.add-place').click(function () {
                rect = $(this);
                $('#imageInput').click();
            })
            $('#imageInput').change(function () {
                num += 1; //新增一张图片就加1
                var val = $(this).val();
                //限制只能上传3张
                if(num < 4){
                    if (val) {
                        $('#imageForm').ajaxSubmit(function (data) {
                            if (data){
                                //给父克隆体添加照片路径
                                var fatherImg = $('.clone-father img');
                                fatherImg.attr('src',data);
                                //拿到克隆对象
                                var father = $('.clone-father').clone();
                                //克隆体去除样式
                                father.removeClass("clone-father");
                                //拼接克隆对象
                                $('._j_piclist').after(father);
                                //重设父克隆体的图片路径
                                fatherImg.attr('src',"");
                                //利用隐藏域上传图片
                                $('._j_commentdialogform').prepend('<input type="hidden" name="pics" value='+ data +'/>')
                            }
                        })
                    }
                }else{
                    popup("只能上传3张");
                }
            });

            //新增评论
            $('._j_submit').click(function () {
                var content = $("._j_commentarea").val();
                if(!content){
                    dialogCommon("评论内容必填", 700, "no");
                    //popup("评论内容必填");
                    return;
                }
                //提交表单
                $('#commentForm').ajaxSubmit(function (data) {
                    if (data.success) {
                        dialogCommon("点评成功", 700);
                    } else {
                        dialogCommon("请登录", 700, "no");
                        //popup("请登录");
                    }
                })
            });

            //导航高亮
            $('.tag').find('li').click(function() {
                //先清空数据
                $("#scenicComment").html();
                // 为当前点击的导航加上高亮，其余的移除高亮
                $(this).addClass('on').siblings('li').removeClass('on');

                var type = $(this).data('type');
                var category = $(this).data('category');
                $('[name="type"]').val(type);
                $('[name="category"]').val(category);
                $('[name="currentPage"]').val(1);
                $('#searchForm').ajaxSubmit(function (data) {
                    $("#scenicComment").html(data);
                });
            });

            //收藏
            $('._j_favpoi').click(function () {
                //景点收藏数+1, 个人中心的收藏景点加1
                var scenicId = $(this).data("scenicid");
                $.post('/scenic/favor',{"scenicId":scenicId},function (data) {
                    console.log(data.success);
                    if(data.success){
                        $(".favicon").prop('style',"background: url(../images/shopping-icons3.png) no-repeat -60px -170px");
                        dialogCommon("收藏成功", 500, "no");
                    }else{
                        if(data.code == 102){    //用户未登录
                            dialogCommon(data.msg, 1000, 'no');
                        }else{
                            $(".favicon").prop('style',"");
                            dialogCommon("已取消收藏", 500, "no"); //用户已收藏，再按就是取消收藏
                        }
                    }
                })
            });

            //去过
            $('._j_hovergo').click(function () {
                var scenicId = $(this).data("scenicid");
                $.post('/scenic/visit',{"scenicId":scenicId},function (data) {
                    console.log(data.success);
                    if(data.success){
                        $(".goicon").prop('style',"background-position: -30px -170px");
                        dialogCommon("成功添加足迹", 500, "no");
                    }else{
                        if(data.code == 102){    //用户未登录
                            dialogCommon(data.msg, 1000, 'no');
                        }else{
                            $(".goicon").prop('style',"");
                            dialogCommon("已取消该足迹", 500, "no"); //用户已去过，再按就是取消去过
                        }
                    }
                })
            });

//            //查看更多!!~~u
//            $('.btn-subpoi').click(function () {
//                var scenicId = $(this).data('scenicid');
//                var pageNum = $(this).data('page');
//                $(this).data('page',pageNum+1);
//                $.post('/scenic/seeMore',{"page":pageNum+1,"scenicId":scenicId},function (data) {
//                    $('.innerScenery').append(data);
//                })
//            })
        })
    </script>

</head>

<body>
<#--图片上传-->
<form id="imageForm" action="/scenic/files" method="post" enctype="multipart/form-data" style="display: none">
    <input type="file" name="pic" id="imageInput">
</form>
<#assign currentNav="strategy">
<#include "../common/navbar.ftl">

<!----------------------------------------->

<div class="container" data-cs-t="景点详情页">

<div class="row row-top">
    <div class="wrapper">
        <div class="extra">
            <!-- 天气 S-->
            <div class="weather" data-cs-p="天气">
                <a href="/weather/10088.html" target="_blank">
                    <img src="http://images.mafengwo.net/images/mdd_weather/icon/icon34.png" width="25" height="25">
                    <span>中雨 27℃~34℃</span>
                </a>
            </div>
            <!-- 天气 E-->
            <!-- 收藏去过 S-->
            <div class="action _j_rside want-been">
                <div class="been-box">
                    <a class="_j_beenpoi btn-been _j_hovergo" target="_blank" title="添加至我的足迹"
                       data-cs-p="足迹" data-scenicId="${scenic.id}">
                        <i class="icon goicon" style="
                        <#if isVisit>
                                background-position: -30px -170px
                        </#if>"
                        ></i>
                        <span class="txt">去过</span>
                    </a>
                    <#--<div class="rate-pop" style="display:none;">
                        <div class="rank-star">
                            <span class="s-star s-star0"></span>
                            <div class="click_star">
                                <a title="1星" rel="nofollow" data-num="1"></a>
                                <a title="2星" rel="nofollow" data-num="2"></a>
                                <a title="3星" rel="nofollow" data-num="3"></a>
                                <a title="4星" rel="nofollow" data-num="4"></a>
                                <a title="5星" rel="nofollow" data-num="5"></a>
                            </div>
                        </div>
                        <span class="rank-hint">必去推荐</span>
                    </div>-->

                </div>
                <a class="_j_favpoi btn-collect " data-scenicId="${scenic.id}" target="_blank" title="添加收藏"
                   data-cs-p="收藏">
                    <i class="icon favicon"
                       style="<#if isFavor> background: url(../images/shopping-icons3.png) no-repeat -60px -170px;</#if>"></i>
                    <span class="txt">收藏</span>
                </a>
            </div>
            <!-- 收藏去过 E-->
        </div>

        <!-- 面包屑 E-->
        <#include "../common/toast.ftl"/>

        <!-- POI名称 S-->
        <div class="title">
            <h1>${scenic.name!}</h1>
        </div>
        <!-- POI名称 E-->

        <!-- 快捷导航 S-->
        <div style="height: 60px;">
            <div class="r-nav" id="poi-navbar" data-cs-p="快捷导航">
                <ul class="clearfix">
                    <li data-scroll="overview" class="on">
                        <a title="概况">概况</a>
                    </li>
                    <li data-scroll="attractions" style="display: none">
                        <a title="景点亮点">景点亮点</a>
                    </li>
                    <li data-scroll="commentlist">
                        <a   title="蜂蜂点评" href="#commentlist">蜂蜂点评<span>（${scenic.replynum}条）</span></a>
                    </li>


                    <li data-scroll="comment" class="nav-right">
                        <a class="btn-reviews" title="我要点评" href="#jqqs">我要点评</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 快捷导航 E-->

    </div>
</div>


<div data-anchor="overview">
    <div class="row row-picture row-bg">
        <div class="wrapper">
            <a class="photo" data-cs-p="相册" href="/photo/poi/25091.html" target="_blank">
                <div class="bd">
                    <div class="pic-big"><img
                            src="${(scenic.photoArr[0])!}"
                            width="690" height="370"></div>
                    <div class="pic-small"><img
                            src="${(scenic.photoArr[1])!}"
                            width="305" height="183"></div>
                    <div class="pic-small"><img
                            src="${(scenic.photoArr[2])!}"
                            width="305" height="183"></div>
                    <span>318</span></div>
            </a></div>
    </div>

    <!-- 简介 S -->
    <div class="mod mod-detail" data-cs-p="概况">
        <div class="summary">
        ${(scenic.intro)!}
        </div>
        <ul class="baseinfo clearfix">
            <li class="tel">
                <div class="label">电话</div>
                <div class="content">020-89338222</div>
            </li>
            <li class="item-site">
                <div class="label">网址</div>
                <div class="content"><a href="http://www.cantontower.com/" target="_blank" rel="nofollow">http://www.cantontower.com/</a>
                </div>
            </li>
            <li class="item-time">
                <div class="label">用时参考</div>
                <div class="content">1-3小时</div>
            </li>
        </ul>
        <div class="summary">
           ${(scenic.content.content)!}
        </div>
        <div style="color:#999;font-size:12px;" data-cs-p="概况-感谢蜂蜂">
            *信息更新时间：${scenic.createTime?string("yyyy-MM-dd HH:mm:ss")}&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <!-- 简介 E -->

    <!-- 内部景点 S -->
    <div data-anchor="subPoilist">
        <div id="pagelet-block-bb456ee5b764682811223f9b8d30739e" class="pagelet-block"
             data-api=":poi:pagelet:poiSubPoiApi" data-params="{&quot;poi_id&quot;:&quot;25091&quot;}" data-async="1"
             data-controller="/js/poi/ControllerPoiSubPoi">
            <div class="mod mod-innerScenic" data-cs-p="内部景点">
                <div class="mhd">内部景点</div>
                <div class="mbd">
                    <ul class="clearfix innerScenery">
                        <#list children as c>
                            <li>
                                <a href="/scenic/detail?scenicId=${c.id}&destId=${dest.id}" target="_blank" title="${c.name}">
                                    <img src="${(c.photoArr[0])!}"
                                         width="235" height="150">
                                    <span class="num num-top">${c_index+1}</span>
                                    <div class="info">
                                        <h3>${c.name}</h3>
                                        <span><em>${c.visitnum!}</em>人去过</span>
                                    </div>
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
                <div class="more more-subpoi">
                    <a class="btn-subpoi" data-page="1" data-scenicId="${scenic.id}">查看更多</a>
                </div>
            </div>
            <style>
                .mod-innerScenic .more {
                    margin-top: 20px;
                    text-align: center;
                }

                .mod-innerScenic .more a {
                    display: inline-block;
                    width: 160px;
                    height: 50px;
                    background-color: #fff;
                    border: 1px solid #fc9c27;
                    line-height: 50px;
                    color: #ff9d00;
                    font-size: 14px;
                    border-radius: 4px;
                    text-align: center;
                }

                .mod-innerScenic .num {
                    width: 40px;
                }
            </style>
        </div>
    </div>
    <!-- 内部景点 E -->
</div>
<!--评论-->

<div data-anchor="commentlist">


    <div id="pagelet-block-15f9d6d9ad9f6c363d2d27120e8a6198" class="pagelet-block"
         data-api=":poi:pagelet:poiCommentListApi" data-params="{&quot;poi_id&quot;:&quot;25091&quot;}" data-async="1"
         data-controller="/js/poi/ControllerPoiComment">
        <div class="mod mod-reviews" data-cs-p="评论列表">
            <div  id="jqqs" class="mhd mhd-large">蜂蜂点评<span>（共有<em>${vo.totalComment}</em>条真实评价）</span></div>
            <div class="review-nav">
                <ul class="clearfix tag">
                    <li data-type="-1" data-category="" class="on"><span class="divide"></span><a
                            href="javascript:void(0);"><span>全部</span></a></li>
                    <li data-type="0" data-category="" class="">
                        <span class="divide"></span>
                        <a href="javascript:void(0);"><span>有图</span><span class="num"> (${vo.picture})</span></a>
                    </li>
                    <li data-type="1" data-category="6" class="">
                        <span class="divide"></span>
                        <a href="javascript:void(0);">
                            <span>好评</span>
                            <span class="num">（${vo.good}条）</span>
                        </a>
                    </li>
                    <li data-type="1" data-category="7" class="">
                        <span class="divide"></span>
                        <a href="javascript:void(0);">
                            <span>中评</span>
                            <span class="num">（${vo.normal}条）</span>
                        </a>
                    </li>
                    <li data-type="1" data-category="8" class="">
                        <span class="divide"></span>
                        <a href="javascript:void(0);">
                            <span>差评</span>
                            <span class="num">（${vo.bad}条）</span>
                        </a>
                    </li>
                    <li data-type="2" data-category="1" class="">
                        <span class="filter-word divide"></span>
                        <a href="javascript:void(0);">标志性建筑<span class="num">（${vo.feature}人提及）</span></a>
                    </li>
                    <li data-type="2" data-category="2" class="">
                        <span class="filter-word divide"></span>
                        <a href="javascript:void(0);">人很多<span class="num">（${vo.mostPeople}人提及）</span></a>
                    </li>
                    <li data-type="2" data-category="3" class="">
                        <span class="filter-word divide"></span>
                        <a href="javascript:void(0);">值得去<span class="num">（${vo.worthToGo}人提及）</span></a>
                    </li>
                    <li data-type="2" data-category="4" class="">
                        <span class="filter-word divide"></span>
                        <a href="javascript:void(0);">恐高<span class="num">（${vo.high}人提及）</span></a>
                    </li>
                    <li data-type="2" data-category="5" class="">
                        <span class="filter-word divide"></span>
                        <a href="javascript:void(0);">交通方便<span class="num">（${vo.goodTrans}人提及）</span></a>
                    </li>
                    <li data-type="3" data-category="1" class="">
                        <span class="divide"></span>
                        <a href="javascript:void(0);"><span>金牌点评</span><span class="num"> (${vo.thumupReply}条)</span></a>
                    </li>
                </ul>
            </div>
            <div class="loading-img" style="display: none;"><img
                    src="http://images.mafengwo.net/images/weng/loading3.gif"> Loading...
            </div>
            <div class="_j_commentlist">
                <div class="rev-list">
                    <ul>
                        <!--评论列表分页-->
                        <form id="searchForm" action="/scenic/comment" method="post">
                            <input type="hidden" name="currentPage" id="currentPage" value="1">
                            <input type="hidden" name="scenicId"  value="${scenic.id!}">
                            <input type="hidden" name="type"  value="-1">
                            <input type="hidden" name="category"  value="">
                            <div class="com-box " id="scenicComment">

                            </div>
                        </form>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<div data-anchor="comment">
    <div class="row row-reviewForm" id="comment_20190714202243" data-cs-p="点评">
        <div class="wrapper">

            <div class="mfw-reviews">
                <div id="_j_commentform_cnt">
                    <h2>
                        <strong>${scenic.name}</strong>
                        <em>*</em>为必填选项
                    </h2>
                    <form id="commentForm" action="/scenic/remarkAdd" method="post" class="_j_commentdialogform" data-typeid="3">
                        <#--景点id和名称-->
                        <input type="hidden" name="scenicId" value="${scenic.id}">
                        <input type="hidden" name="scenicName" value="${scenic.name}">
                        <input type="hidden" name="scenicImg" value="${scenic.coverUrl}">
                        <#--评论类型 大评论-->
                        <input type="hidden" name="type" value="0">

                        <div class="review-item item-star">
                            <div class="label"><em>*</em>总体评价</div>
                            <div class="review-star _j_rankblock" data-star="" name="overallScore">
                                <input type="hidden" name="overallScore" value="" essential="1" data-inputname="总体评价">
                                <span class="_j_starcount star0"></span>
                                <div class="click-star _j_starlist">
                                    <a role="button" title="千万别去" rel="nofollow" data-overallScore="1"></a>
                                    <a role="button" title="不推荐" rel="nofollow" data-overallScore="2"></a>
                                    <a role="button" title="一般般" rel="nofollow" data-overallScore="3"></a>
                                    <a role="button" title="值得一去" rel="nofollow" data-overallScore="4"></a>
                                    <a role="button" title="必须推荐" rel="nofollow" data-overallScore="5"></a>
                                </div>

                            </div>
                            <span class="txt-tips _j_startip">点击星星打分</span>
                        </div>
                        <div class="review-group">
                            <div class="review-item item-rating"
                                 data-conf="{&quot;type&quot;:&quot;select&quot;,&quot;notnull&quot;:&quot;1&quot;,&quot;name&quot;:&quot;\u98ce\u5149&quot;,&quot;conf&quot;:{&quot;options&quot;:[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;]},&quot;show&quot;:{&quot;style&quot;:&quot;starRank&quot;}}">
                                <div class="label"><em>*</em>风光</div>
                                <div class="review-score _j_rankblock" data-star="" name="viewScore">
                                    <input type="hidden" name="viewScore" value="" essential="1"
                                           data-inputname="给风光的评分">
                                    <span class="_j_starcount star0"></span>
                                    <div class="click-star _j_starlist">
                                        <a role="button" title="特别差" rel="nofollow" data-viewScore="1"></a>
                                        <a role="button" title="不太好" rel="nofollow" data-viewScore="2"></a>
                                        <a role="button" title="一般般" rel="nofollow" data-viewScore="3"></a>
                                        <a role="button" title="很棒" rel="nofollow" data-viewScore="4"></a>
                                        <a role="button" title="超出预期" rel="nofollow" data-viewScore="5"></a>
                                    </div>
                                </div>
                                <span class="txt-tips _j_startip">给风光打分</span>
                            </div>
                            <div class="review-item item-rating"
                                 data-conf="{&quot;type&quot;:&quot;select&quot;,&quot;notnull&quot;:&quot;1&quot;,&quot;name&quot;:&quot;\u7279\u8272&quot;,&quot;conf&quot;:{&quot;options&quot;:[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;]},&quot;show&quot;:{&quot;style&quot;:&quot;starRank&quot;}}">
                                <div class="label"><em>*</em>特色</div>
                                <div class="review-score _j_rankblock" data-star="" name="uniqueScore">
                                    <input type="hidden" name="uniqueScore" value="" essential="1"
                                           data-inputname="给特色的评分">
                                    <span class="_j_starcount star0"></span>
                                    <div class="click-star _j_starlist">
                                        <a role="button" title="特别差" rel="nofollow" data-uniqueScore="1"></a>
                                        <a role="button" title="不太好" rel="nofollow" data-uniqueScore="2"></a>
                                        <a role="button" title="一般般" rel="nofollow" data-uniqueScore="3"></a>
                                        <a role="button" title="很棒" rel="nofollow" data-uniqueScore="4"></a>
                                        <a role="button" title="超出预期" rel="nofollow" data-uniqueScore="5"></a>
                                    </div>

                                </div>
                                <span class="txt-tips _j_startip">给特色打分</span>
                            </div>
                            <div class="review-item item-rating"
                                 data-conf="{&quot;type&quot;:&quot;select&quot;,&quot;notnull&quot;:&quot;1&quot;,&quot;name&quot;:&quot;\u670d\u52a1&quot;,&quot;conf&quot;:{&quot;options&quot;:[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;]},&quot;show&quot;:{&quot;style&quot;:&quot;starRank&quot;}}">
                                <div class="label"><em>*</em>服务</div>
                                <div class="review-score _j_rankblock" data-star="" name="servicecore">
                                    <input type="hidden" name="servicecore" value="" essential="1"
                                           data-inputname="给服务的评分">
                                    <span class="_j_starcount star0"></span>
                                    <div class="click-star _j_starlist">
                                        <a role="button" title="特别差" rel="nofollow" data-servicecore="1"></a>
                                        <a role="button" title="不太好" rel="nofollow" data-servicecore="2"></a>
                                        <a role="button" title="一般般" rel="nofollow" data-servicecore="3"></a>
                                        <a role="button" title="很棒" rel="nofollow" data-servicecore="4"></a>
                                        <a role="button" title="超出预期" rel="nofollow" data-servicecore="5"></a>
                                    </div>

                                </div>
                                <span class="txt-tips _j_startip">给服务打分</span>
                            </div>
                        </div>
                        <div class="review-item item-comment">
                            <div class="label"><em>*</em>评价</div>
                            <div class="content">
                                <textarea class="_j_commentarea" name="content" essential="1" data-inputname="点评内容"
                                          placeholder="详细、客观、真实，130字以上为佳！上传图片会加分哦！" data-minlen="15"
                                          data-maxlen="1000"></textarea>
                                <p class="_j_commentcounttip">15-1000个字</p>
                            </div>
                        </div>

                        <div class="review-item item-photo">
                            <div class="label">上传照片</div>
                            <div class="content aaa">

                                <dl class="upload-box _j_piclist">
                                    <dd data-commentid="" id="_j_addpicbtns" style="position: relative;">
                                        <a class="add-place"><i></i></a>
                                    </dd>
                                </dl>

                                <#--用于克隆的父体-->
                                <dl class="upload-box clone-father">
                                    <dd data-commentid="" id="pics" ids="" style="position: relative;">
                                        <img src="" style="width: 100%;" >
                                    </dd>
                                </dl>

                            </div>
                        </div>

                        <div class="review-item item-action">
                            <a class="btn-large _j_submit" role="button" title="提交点评">提交点评</a>
                        </div>
                    </form>
                </div>
            </div>
			 <script>

			   $(function () {
                   $("._j_starlist a").mouseover(function () {
                        var index = $(this).index()+1;
                        var text = $(this).attr("title");

                       $(this).closest("div").prev().addClass("star"+index);
                       $(this).closest("div").parent().next().html(text);
                   }).mouseout(function () {
                       var index = $(this).index()+1;
                       var text = $(this).attr("title");
                       $(this).closest("div").prev().removeClass("star"+index);
                       $(this).closest("div").parent().next().html(text);

                       var x = $(this).closest("div").prev().prev().val();
                       if(x == index){
                           $(this).closest("div").prev().addClass("star"+x);
                       }


                   }).click(function () {
                       var index = $(this).index()+1;
                       var text = $(this).attr("title");
                       $(this).closest("div").prev().addClass("star"+index);
                       $(this).closest("div").parent().next().html(text);

                       $(this).closest("div").prev().prev().val(index);
                   })
               })

			</script>



            <div class="mfw-reviews have-reviews" style="display: none">
                <h2>
                    <strong>${scenic.name}</strong>
                </h2>
                <div class="review-item item-star">
                    <div class="label">你已评价为</div>
                    <div class="review-star">
                        <span class="star0"></span>
                    </div>
                    <a class="edit-reviews" data-commentid="" title="修改评论"><i></i>我要修改</a>
                </div>
            </div>
        </div>
    </div>
</div>



</div>








<!----------------------------------------->
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
					<span class="ft-qrcode-weixin" style="background-image: url('https://p3-q.mafengwo.net/s10/M00/48/A9/wKgBZ1t_4sSAVJ6uAAAlzJ0PZgU881.png?imageMogr2%2Fthumbnail%2F%2194x90r%2Fgravity%2FCenter%2Fcrop%2F%2194x90%2Fquality%2F90')"></span>
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
			<a target="_blank" href="http://china.makepolo.com/">马可波罗</a><a target="_blank" href="http://www.onlylady.com/">Onlylady女人志</a><a target="_blank" href="http://trip.elong.com/">艺龙旅游指南</a><a target="_blank" href="http://www.cncn.com">欣欣旅游网</a>
			<a target="_blank" href="http://www.8264.com/">户外运动</a><a target="_blank" href="http://www.yue365.com/">365音乐网</a><a target="_blank" href="http://ishare.iask.sina.com.cn/">爱问共享资料</a><a target="_blank" href="http://www.uzai.com/">旅游网</a>
			<a target="_blank" href="http://www.zongheng.com/">小说网</a>
			<a target="_blank" href="http://www.xuexila.com/">学习啦</a><a target="_blank" href="http://www.yododo.com">游多多自助游</a><a target="_blank" href="http://www.zhcpic.com/">问答</a><a target="_blank" href="http://huoche.mafengwo.cn/">火车时刻表</a>
			<a target="_blank" href="http://www.lvmama.com">驴妈妈旅游网</a>
			<a target="_blank" href="http://www.haodou.com/">好豆美食网</a><a target="_blank" href="http://www.taoche.com/">二手车</a><a target="_blank" href="http://www.lvye.cn">绿野户外</a><a target="_blank" href="http://www.tuniu.com/">途牛旅游网</a>
			<a target="_blank" href="http://www.mapbar.com/">图吧</a>
			<a target="_blank" href="http://www.chnsuv.com">SUV联合越野</a><a target="_blank" href="http://www.uc.cn/">手机浏览器</a><a target="_blank" href="http://sh.city8.com/">上海地图</a><a target="_blank" href="http://www.tianqi.com/">天气预报查询</a>
			<a target="_blank" href="http://www.ly.com/">同程旅游</a>
			<a target="_blank" href="http://www.tieyou.com/">火车票</a><a target="_blank" href="http://www.yunos.com/">YunOS</a><a target="_blank" href="http://you.ctrip.com/">携程旅游</a><a target="_blank" href="http://www.jinjiang.com">锦江旅游</a>
			<a target="_blank" href="http://www.huoche.net/">火车时刻表</a>
			<a target="_blank" href="http://www.tripadvisor.cn/">TripAdvisor</a><a target="_blank" href="http://www.tianxun.com/">天巡网</a><a target="_blank" href="http://www.mayi.com/">短租房</a><a target="_blank" href="http://www.zuzuche.com">租租车</a>
			<a target="_blank" href="http://www.5fen.com/">五分旅游网</a>
			<a target="_blank" href="http://www.zhuna.cn/">酒店预订</a><a target="_blank" href="http://www.ailvxing.com">爱旅行网</a><a target="_blank" href="http://360.mafengwo.cn/all.php">旅游</a><a target="_blank" href="http://vacations.ctrip.com/">旅游网</a>
			<a target="_blank" href="http://www.wed114.cn">wed114结婚网</a>
			<a target="_blank" href="http://www.chexun.com/">车讯网</a><a target="_blank" href="http://www.aoyou.com/">遨游旅游网</a><a target="_blank" href="http://www.91.com/">手机</a>
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