<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>骡友:${(question.title)!}</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/public.css" rel="stylesheet" type="text/css">
    <#--<link href="/js/datepicker/datepicker.css" rel="stylesheet">-->
    <link href="/styles/wendaDetail.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery/jquery.js"></script>
    <script src="/js/plugins/jquery-form/jquery.form.js"></script>

<script>
    $(function () {
        //发布回答
        $("._j_submit_answer_btn").click(function () {
            $("#editForm").ajaxSubmit(function (data) {
                if(data.success){
                    window.location.reload();
                }else {
                    if(data.code == 102){
                        dialogCommon(data.msg, 1000, "/login.html");
                    }else{
                        dialogCommon(data.msg, 1000, "no");
                    }
                }
            })
        })

        //顶：给回答点赞
        $(".thumbup_num").click(function () {
            var aid = $(this).data("aid");
            $.get("/wenda/answerThumbup", {answerId:aid}, function (data) {
                if(data.success){
                    dialogCommon("顶成功啦", 1000);
                }else{
                    if(data.code == 102){
                        dialogCommon(data.msg, 1000, "/login.html");
                    }else{
                        dialogCommon(data.msg, 1000);
                    }
                }
            });
        });

        //关注
        $("._j_same_question").click(function () {
            var qid = $(this).data("qid")
            $.get("/wenda/focus",{questionId:qid},function (data) {
                if(data.success){
                    $("._j_same_num").html(data.data);
                    $("#focus").html("取消关注");
                    dialogCommon("关注成功", 1000, "no");
                }else {
                    if(data.code==102){
                        $("#focus").html("关注");
                        dialogCommon(data.msg, 1000, "no");
                    }else{
                        $("._j_same_num").html(data.data);
                        $("#focus").html("关注");
                        dialogCommon("已取消关注", 1000, "no");
                    }
                }
            })
        })
    })
</script>

</head>
<#--覆盖公共样式-->
<style>
    .q-desc img {
        width: 100%;
    }
</style>

<body style="position: relative;">

<#include "../common/mineNavbar.ftl">

<div class="wrapper">
    <div class="detail-wrap clearfix">
        <div class="col-main">
            <div class="q-detail">
                <div class="q-content">
                    <div class="q-title">
                        <#--<a href="/wenda/area-10065.html" target="_blank" class="location"><i></i>北京</a>-->
                        <h1>
                            <a href="/wenda/detail-18458675.html">${(question.title)!}</a>
                        </h1>
                    </div>
                    <div class="q-desc">
                        ${(content.content)!}
                        <#--<div class="area_tags _j_tip_mdd" data-mddid="10065">
                            <a data-cs-p="qa_mdd" class="at_link" href="/travel-scenic-spot/mafengwo/10065.html" target="_blank">北京</a>
                            <div class="at_info" style="display:none;"></div>
                        </div>-->

                    </div>
                    <div class="q-info1 clearfix">
                        <div class="q-tags fl">
                            <a class="a-tag" href="/wenda/area-10065.html" target="_blank">${(question.author.city)!}</a>
                        </div>
                        <div class="pub-bar fr">
                            <a href="/wenda/u/43303516/answer.html" class="photo" target="_blank"> <img
                                    src="${(question.author.headImgUrl)!}"
                                    width="16" height="16"></a>
                            <a class="name" href="/wenda/u/43303516/answer.html" target="_blank">${(question.author.nickname)!}</a>
                            <span class="time"><span>${(question.creatTime?string("yyyy-MM-dd HH:mm:ss"))!}</span></span>
                        </div>
                    </div>
                </div>
                <div class="q-operate clearfix">
                    <div class="fl">
                        <!-- 问题分享 -->
                        <div class="q-share cate-share">
                            <a class="_js_showShare"><i class="q-share-icon"></i>分享</a>
                            <div class="share-pop _j_share_pop hide clearfix" data-title="为什么说在北京通勤等于取经？上下班到底有多苦？"
                                 data-qid="18458675">
                                <a title="分享到新浪微博" class="sina _j_do_share" data-site="wb"></a>
                                <a title="分享到QQ空间" class="zone _j_do_share" data-site="qz"></a>
                                <a title="分享到微信" class="weixin _j_do_share_wx" data-site="wx"></a>
                            </div>
                        </div>
                        <!-- 邀请回答 -->
                        <div class="seek-help _j_tip_box">
                            <a class="_j_seek_help_new">邀请蜂蜂回答</a>
                        </div>
                        <!-- 举报 -->
                        <div class="admin_hide tip-off">
                            <a data-japp="report" data-refer="http://www.mafengwo.cn/wenda/detail-18458675.html"
                               data-refer-uid="43303516" data-app="qa.question" data-busi-id="qid:18458675">举报</a>
                        </div>
                    </div>
                    <div class="fr">
                        <span class="atten-num">${(vo.viewNum)!}浏览</span>
                        <span class="atten-num"><span class="_j_same_num">${(vo.focusMemberNum)!}</span>人关注</span>

                        <a class="btn-atten _j_same_question " rel="nofollow" data-qid="${(question.id)!}"><span id="focus">${(isFocus?string('取消关注','关注'))!}</span></a>

                        <a class="btn-answer _j_btn_goanswer" rel="nofollow" href="#answer_box">回答</a>
                    </div>
                </div>
            </div>
            <div class="answer-wrap">
                <div class="hd">
                    <#--<a href="javascript:;" class="view_all">查看全部${(vo.answerNum)!}个回答</a>-->
                    <div style="display:none;"><span id="_j_anum">${(vo.answerNum)!}</span>个回答</div>
                </div>


                <div class="bd _j_pager_box">
                    <ul class="answer-list answer_detail">
                        <div>
                            <li>
                                <#--<div class="answer-side _js_answerAva">
                                    <a class="btn-ding _js_zan "><i style="float: none;position: fixed;top: 112px;margin: 0 0 0 -65px;"><img src="/images/like30x26.png"><br/><span data-real_num="3" style="text-align: center">3</span></i></a>
                                </div>-->
                                <#--金牌回答部分-->
                                <#if golden??>
                                    <div class="answer-content _js_answer_content">
                                    <#--回答部分的用户信息及是否是金牌回答-->
                                        <div class="answer-info clearfix">
                                            <div class="user-bar fl">
                                                <a class="_j_filter_click avatar" href="javascript:;" target="_blank"><img
                                                        src="${(golden.headUrl)!}"
                                                        width="48" height="48" class="photo"></a>
                                                <a class="name" href="javascript:;" target="_blank">${(golden.authorname)!}</a>
                                                <a class="level" href="javascript:;" target="_blank" rel="nofollow">${(golden.level)!}</a>
                                                <a class="identity i-guide" href="javascript:;" target="_blank">指路人</a>
                                            </div>
                                            <ul class="answer-medal fr">
                                                <li class="gold">
                                                    <div class="btn"><i></i><a href="javascript:;" target="_blank">金牌回答</a></div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div style="margin-left: 89%;">
                                            <a class="thumbup_num " type="button" data-aid='${(golden.id)!}'><img src="/images/like30x26.png"><span>    ${(golden.thumbupNum)!}</span></a>
                                        </div>


                                        <!-- 回答内容 -->
                                        <div class="_j_short_answer_item hide" style="display: block;">
                                        ${(golden.content)!}
                                        </div>
                                        <div class="operate">
                                            <div class="cate-share">
                                                <a class="_js_showShare _j_filter_click">分享</a><span> | </span>
                                                <span class="date">发布于${(golden.creatTime?string("yyyy-MM-dd HH:mm:ss"))!} </span>
                                            </div>

                                        </div>
                                    </div>
                                </#if>
                            </li>
                            <#--非金牌回答部分-->
                            <#list others as a>
                                <li>
                                    <div class="answer-content _js_answer_content" style="margin-bottom: 14px;
    cursor: pointer;
    border: 1px solid #d5e24e;
    border-radius: 0.5em;
    padding: 10px;">
                                    <#--回答部分的用户信息及是否是金牌回答-->
                                        <div class="answer-info clearfix">
                                            <div class="user-bar fl">
                                                <a class="_j_filter_click avatar" href="javascript:;" target="_blank"><img
                                                        src="${(a.headUrl)!}"
                                                        width="48" height="48" class="photo"></a>
                                                <a class="name" href="javascript:;" target="_blank">${(a.authorname)!}</a>
                                                <a class="level" href="javascript:;" target="_blank" rel="nofollow">Lv${(a.level)!}</a>
                                                <a class="identity i-guide" href="javascript:;" target="_blank">指路人</a>
                                            </div>
                                            <div style="margin-left: 43%;">
                                                <a class="thumbup_num " type="button" data-aid='${(a.id)!}'><img src="/images/like30x26.png"><span>    ${(a.thumbupNum)!}</span></a>
                                            </div>
                                        </div>
                                        <!-- 回答内容 -->
                                        <div class="_j_short_answer_item hide" style="display: block;">
                                        ${(a.content)!}
                                        </div>
                                        <div class="operate">
                                            <div class="cate-share">
                                                <a class="_js_showShare _j_filter_click">分享</a><span> | </span>
                                                <span class="date">发布于${(a.creatTime?string("yyyy-MM-dd HH:mm:ss"))!} </span>
                                            </div>

                                        </div>
                                    </div>
                                </li>
                            </#list>
                        </div>
                    </ul>
                </div>
                <div class="bd _j_pager_box" id="answer_box">
                    <div class="aa-hd">
                        <a class="aa-avatar" href="/wenda/u/53383161/answer.html"><img
                                src="http://n1-q.mafengwo.net/s12/M00/35/98/wKgED1uqIreAU9QZAAAXHQMBZ74008.png?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"
                                class="photo"></a>
                        <a class="aa-name">蚂蜂测试窝用户</a>
                    </div>
                    <form class="forms" action="/wenda/saveAnswer" method="post" id="editForm">
                        <input type="hidden" name="questionId" value="${question.id}"><br/>
                         请选择封面: <input type="file" name="pic">
                        <div class="editor-outer _j_editorOuter _js_editorWrap _js_forFixTitle">
                            <textarea id="content" name="content"></textarea>
                        </div>
                        <div class="aa-ft">
                            <input class="btn-comment _j_submit_answer_btn" type="button" value="提交回答"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-side"></div>
    </div>
</div>
</body>
</html>
