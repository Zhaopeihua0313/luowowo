<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>热门目的地</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/destination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/theme/common.js"></script>
    <script type="text/javascript" src="/js/system/destionation.js"></script>
    <script type="text/javascript" src="/js/theme/destmonth.js"></script>
    <script type="text/javascript" src="/js/theme/desttheme.js"></script>
    <link href="https://css.mafengwo.net/css/cv/css+base:css+jquery.suggest:css+plugins:css+plugins+jquery.jgrowl:css+other+popup:css+mfw-header.2015^YlVS^1566868943.css" rel="stylesheet" type="text/css"/>

    <link href="https://css.mafengwo.net/css/mdd/mfw-place.2015.css?1559524834" rel="stylesheet" type="text/css"/>

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">
</head>

<body>
<#assign currentNav="destination">
<#include "../common/navbar.ftl">
<div class="container">
    <div class="place-focus" data-cs-p="头图">
        <div class="show-banner show-info-notes">
            <div class="cover" style="height: auto;">
                <a class="bigimg" href="javascript:;" target="_blank" data-cs-l="图片" style="height: 400px;">
                    <div class="shade"></div>
                    <img data-ow="1776" data-oh="1184" src="/images/dlrb.jpg" style="margin: -249.667px 0px 0px; width: 100%; height: auto;">
                </a>
            </div>
            <div class="show-info show-info-sm">
                <div class="owner">
                </div>
                <div class="show-name">
                    <a href="/strategy/detail?id=17" target="_blank" data-t="目的地">
                        <h2>成都 | 独具风情的蜀都蓉城，咫尺天堂的人间烟火</h2><span></span>
                    </a>
                </div>
                <p class="location">关于成都，有这样一句话“少不入川，老不出蜀”。如果你来过成都，你一定会觉得是这样的。</p>
                <div class="show-links">
                    <a href="/strategy/detail?id=17" target="_blank">阅读全文</a>
                </div>
            </div>
            <div class="show-shadow"></div>
            <div class="show-ft">
                <div class="show-ft-item pic-from">
                    <i></i>
                    <div class="pic-from-pop">
                            <span>
                                <a href="javascript:;" target="_blank" data-t="作者">林琛Live</a>
                                的作品
                            </span>
                        <em></em>
                    </div>
                </div>
                <span class="show-ft-item"><a class="show-icon-download" href="javascript:;"
                                              title="下载壁纸"></a></span>
                <span class="show-ft-item"><a class="show-icon-calendar" href="javascript:;"
                                              target="_blank">13</a></span>
                <div class="show-ft-item pic-share">
                    <a class="btn-share" href="javascript:void(0)"><i></i>分享</a>
                    <div class="pop-share" id="_j_sharecnt" style="display: none">
                        <a class="s-weibo" href="javascript:void(0)"><i></i></a>
                        <a class="s-qzone" href="javascript:void(0)"><i></i></a>
                        <a class="s-weixin" href="javascript:void(0)"><i></i></a>
                    </div>
                </div>
            </div>
            <a class="show-arrdown" href="#" data-cs-l="锚点下箭头"></a>
        </div>
        <div class="place-search-panel place-search-panel-sm">
            <h2>Don't fear the unknown</h2>

        <#--搜索框-->
            <form name="mdd-search-form" action="/q" id="q_form">
                <div class="searchbar">
                <#--隐藏域搜索目的地-->
                    <input name="type" value="0" hidden>
                    <input autocomplete="off" class="search-input" type="text" name="keyword" placeholder="我想去...">
                    <a class="search-button" href="#" data-cs-l="搜索" role="button"><i class="icon-search"></i></a>
                    <script>
                        $(function () {
                            $('.search-button').on('click', function () {
                                $('#q_form').submit();
                            })
                        })
                    </script>
                </div>
            </form>
        <#--<div class="search-suggest-panel search-suggest-place hide" style="display: none;">
            <ul class="suggest-list">
                <li class="active"><i class="sicon-place"></i><span class="skey">广州</span><span>中国</span></li>
                <li class=""><i class="sicon-place"></i><span class="skey">贵州</span></li>
                <li class=""><i class="sicon-place"></i><span class="skey">甘孜</span><span>中国</span></li>
                    <li class=""><i class="sicon-place"></i><span class="skey">广州长隆旅游度假区</span><span>广东</span></li>
                <li class=""><i class="sicon-place"></i><span class="skey">赣州</span><span>中国</span></li>
            </ul>
        </div>-->
            <div class="place-search-hot">
                <a href="/q?type=0&keyword=北京">北京</a>
                <a href="/q?type=0&keyword=广州">广州</a>
                <a href="/q?type=0&keyword=重庆">重庆</a>
                <a href="/q?type=0&keyword=普吉岛">普吉岛</a>
                <a href="/q?type=0&keyword=台湾">台湾</a>
                <a href="/q?type=0&keyword=清迈">清迈</a>
            </div>
        </div>
    </div>
    <div class="row row-hot">
        <div class="wrapper">
            <div class="r-title">
                <h2>热门目的地</h2>
            </div>
            <div class="r-navbar">

                <a href="javascript:void(0)" class="on"  data-rid="-1">国内</a><span class="divide">|</span>
            <#list hotRegions as r>
                <a href="javascript:void(0)"  data-rid="${r.id}">${r.name}</a><span class="divide">|</span>
            </#list>

            </div>
            <div id="hotContent">

            </div>
        </div>
    </div>
    <div class="row-line"></div>




        <div class="row-line"></div>
        <div class="pagelet-block1">
            <div class="row row-season row-bg">
                <div class="wrapper">
                    <div class="r-title">
                        <h2>当季推荐</h2>
                    </div>
                    <div class="r-navbar" style="width: 1061px;">
                    <#list months as m>
                        <a href="javascript:void(0)"  data-mid="${m.id}">${m.name}</a><span class="divide">|</span>
                    </#list>
                        <#--<a href="javascript:void(0)"  data-mid="1">1月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="2">2月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="3">3月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="4">4月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="5">5月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="6">6月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="7">7月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="8">8月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="9">9月</a><span class="divide">|</span>-->
                        <#--<a href="javascript:void(0)"  data-mid="10">10月</a><span class="divide">|</span>-->
                        <a href="javascript:void(0)"  data-mid="11">11月</a>
                        <span class="divide">|</span><a href="javascript:void(0)"  data-mid="12">12月</a>
                    </div>
                    <div class="J_seasonmdds">

                    <div class="tiles hide">
                    </div>
                </div>
            </div>
        </div>
        <div class="row-line"></div>
    </div>



        <div class="pagelet-block">
            <div class="row row-theme">
                <div class="wrapper">
                    <div class="r-title">
                        <h2>主题精选</h2>
                    </div>
                    <div class="r-navbar">
                        <a class="on" href="javascript:void(0)" data-tid="1">全年适宜</a><span class="divide">|</span>
                        <a href="javascript:void(0)" data-tid="2">季节</a><span class="divide">|</span>
                        <a href="javascript:void(0)" data-tid="3">出行方式</a><span class="divide">|</span>
                        <a href="javascript:void(0)" data-tid="4">节假日</a><span class="divide">|</span>
                    </div>
                    <div class="J_catemdds">
                    <#--主题内容-->
                    </div>
                    <div class="tiles hide">
                    </div>
                </div>
            </div>
        </div>
        <div class="row-line"></div>
    </div>

                    </div>
                </div>
            </div>
            <div class="row-line"></div>
        </div>

    <div class="row row-state row-bg">
        <div class="wrapper">
            <div class="row-list" data-cs-p="全球目的地">
                <h2 class="hd">全球目的地<span>（按拼音首字母排序）</span><#--<a class="btn-add" href="/destination/addDest" target="_blank" title="添加目的地"><i>+</i>添加目的地</a>--></h2>
                <div class="bd">

                    <dl class="item">
                        <dt class="sub-title">亚洲 港澳台</dt>
                        <dd class="clearfix">
                            <ul class="col">
                            <#list desta! as a >
                                <li class="letter">${a.word}</li>
                                <li><a href="/destination/guide?id=${a.id!}">${a.name!} <span class="en">${a.enName!}</span></a>
                                    <#if a.hot==1>
                                        <i  class="icon-label"></i></li>
                                    </#if>
                            </#list>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">东南亚</dt>
                        <dd class="clearfix">
                            <ul class="col">
                            <#list destb! as a >
                                <li class="letter">${a.word}</li>
                                <li><a href="/destination/guide?id=${a.id!}">${a.name!} <span class="en">${a.enName!}</span></a>
                                <#if a.hot==1>
                                    <i  class="icon-label"></i></li>
                                </#if>
                            </#list>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">南亚 西亚</dt>
                        <dd class="clearfix">
                            <ul class="col">
                            <#list destc! as a >
                                <li class="letter">${a.word}</li>
                                <li><a href="/destination/guide?id=${a.id!}">${a.name!} <span class="en">${a.enName!}</span></a>
                                <#if a.hot==1>
                                    <i  class="icon-label"></i></li>
                                </#if>
                            </#list>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">欧洲 美洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                            <#list destd! as a >
                                <li class="letter">${a.word}</li>
                                <li><a href="/destination/guide?id=${a.id!}">${a.name!} <span class="en">${a.enName!}</span></a>
                                <#if a.hot==1>
                                    <i  class="icon-label"></i></li>
                                </#if>
                            </#list>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="item">
                        <dt class="sub-title">澳洲 非洲</dt>
                        <dd class="clearfix">
                            <ul class="col">
                            <#list deste! as a >
                                <li class="letter">${a.word}</li>
                                <li><a href="/destination/guide?id=${a.id!}">${a.name!} <span class="en">${a.enName!}</span></a>
                                <#if a.hot==1>
                                    <i  class="icon-label"></i></li>
                                </#if>
                            </#list>
                            </ul>
                        </dd>
                    </dl>

                   
               
            </div>
        </div>
    </div>
    </div>
</div>
<#include "../common/footer.ftl">
</body>

</html>