<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>社区问答</title>
    <link href="./styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/public.css" rel="stylesheet" type="text/css">
    <link href="./js/datepicker/datepicker.css" rel="stylesheet">
    <link href="./styles/wenda.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/wenda.js"></script>

    <script>

        $(function () {
            //点击排行榜的分类,触发事件
            $("._j_rank_change_flag").click(function () {
                $("._j_rank_change_flag").removeClass("on");
                $(this).addClass("on");
                var rank = $(this).data("rank");
                $.get("/wenda/rank",{rank:rank},function (data) {
                    $("._j_rank_list").html(data);
                })
            })
        })
    </script>

</head>

<style>
    .newcate-bd li {
        margin-bottom: 14px;
        cursor: pointer;
        border: 1px solid #d5e24e;
        border-radius: 0.5em;
        padding: 10px;
    }
    .newcate-bd li .title {
        font-size: 17px;
        line-height: 30px;
        color: #61594d;
        margin-bottom: 12px;
        font-weight: bolder;
    }
    .newcate-bd li .title a {
        font-size: 17px;
        line-height: 30px;
        color: #61594d;
        margin-bottom: 12px;
        font-weight: bolder;
    }
</style>

<body style="position: relative;">

<#include "../common/mineNavbar.ftl">

<div class="wrapper wrapper-new">
    <div class="col-main">
        <div class="newcate-wrap _j_qa_list">
            <div class="bd newcate-bd">
                <ul class="_j_pager_box">
                    <#list questionlist! as q>
                        <#if q_index < 10>
                        <li class="item clearfix _j_question_item" data-qid="${q.id!}">
                            <div class="title">
                                <#list (q.answers)! as ans>
                                    <a href="/wenda/detail?questionId=${q.id!}&goldenId=${(ans.id)!}" target="_blank">${q.title!}</a>
                                </#list>
                                <#if (q.answers?size==0)>
                                    <a href="/wenda/detail?questionId=${q.id!}&goldenId=a" target="_blank">${q.title!}</a>
                                </#if>
                            </div>
                            <div class="container">
                                <#list (q.answers)! as a>
                                    <div class="avatar">
                                        <a href="javascript:;" target="_blank" class="_j_filter_click">
                                            <img class="_j_filter_click" src="${(a.headUrl)!}">
                                        </a>
                                    </div>
                                    <div class="user-info">
                                        <a class="name _j_filter_click" href="javascript:;" target="_blank">${(a.authorname)!}</a>
                                        <a class="level _j_filter_click" href="javascript:;" target="_blank" rel="nofollow">Lv${(a.level)!}</a>
                                    </div>
                                    <div class="desc clearfix">
                                        <img src="${(a.coverUrl)!}"
                                                width="150" height="100" >
                                        <p>
                                        ${(a.summary)!}
                                        </p>
                                    </div>
                                    <#--<div class="tags">
                                        <a class="a-tag _j_filter_click" href="javascript:;" target="_blank">美食</a>
                                        <a class="a-tag _j_filter_click" href="javascript:;" target="_blank">呼伦贝尔</a>
                                    </div>-->
                                </#list>
                                <div class="operate">
                                    <#list (q.answers)! as a>
                                        <div class="zan">
                                            <#--<i></i>-->
                                            点赞:${(a.thumbupNum)!}</div>
                                    </#list>
                                    <div class="mdd">
                                        <a href="javascript:;" class="_j_filter_click" target="_blank">
                                            <i class="_j_filter_click"></i>${(q.dest.name)}</a>
                                    </div>
                                    <div class="cate-share">
                                        <a class="_js_showShare _j_filter_click">分享(${q.shareNum!})</a>
                                    </div>
                                    <span class="reply">回答 (${q.answerNum!})</span>
                                    <span class="browse">浏览 (${q.viewNum!})</span>
                                    <span class="date">发布于${(q.creatTime?string("yyyy-MM-dd HH:mm:ss"))!} </span>
                                </div>
                            </div>
                        </li>
                        </#if>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-side">
        <div class="i-ask">
            <a href="/wenda/public" class="qt-post-btn _j_publish" style="width: 257px;">
                <i></i>我要提问
            </a>
        </div>
        <div class="rank _j_rank" style="margin-top: 20px;">
            <div class="hd">排行榜<ul class="tab-time">
                <#--<li class="_j_rank_change_date" data-type="0"><span>今日</span></li>
                <li class="_j_rank_change_date on" data-type="1"><span>本周</span></li>
                <li class="_j_rank_change_date" data-type="2"><span>本月</span></li>-->
            </ul>
            </div>
            <div class="bd">
                <ul class="tab-num" data-cs-p="rank_list">
                    <li class="_j_rank_change_flag" data-rank="0" data-cs-d="金牌数">金牌数</li>
                    <li class="_j_rank_change_flag on" data-rank="1" data-cs-d="回答数">回答数</li>
                    <li class="_j_rank_change_flag" data-rank="2" data-cs-d="被顶次数">被顶次数</li>
                </ul>
                <ul class="rank-list _j_rank_list">
                    <#list ranklist! as user>
                        <#if user_index < 3>
                            <li class="r-top r-top${user_index+1} clearfix">
                                <em class="num">${user_index+1}</em>
                                <div class="user no_qid">
                                    <a class="avatar" href="javascript:;" target="_blank" rel="nofollow"><img
                                            src="${(user.user.headImgUrl!)}" style="width: 100%"></a>
                                    <span class="name"><a href="javascript:;" target="_blank"
                                                          rel="nofollow">${(user.user.nickname!)}</a></span>
                                    <span class="level"><a href="javascript:;" target="_blank"
                                                           rel="nofollow">Lv${(user.user.level!)}</a></span>
                                </div>
                                <span class="num">${(user.answersNum!)}</span>
                            </li>
                        <#else>
                            <li class="clearfix">
                                <em class="num">${user_index+1}</em>
                                <div class="user no_qid">
                                    <a class="avatar" href="javascript:;" target="_blank" rel="nofollow"><img
                                            src="${(user.user.headImgUrl!)}" style="width: 100%"></a>
                                    <span class="name"><a href="javascript:;" target="_blank"
                                                          rel="nofollow">${(user.user.nickname!)}</a></span>
                                    <span class="level"><a href="javascript:;" target="_blank"
                                                           rel="nofollow">Lv${(user.user.level!)}</a></span>
                                </div>
                                <span class="num">${(user.answersNum!)}</span>
                            </li>
                        </#if>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>