<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>

    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/public.css" rel="stylesheet" type="text/css">
    <link href="/styles/addtravelnote.css" rel="stylesheet" type="text/css">
    <link href="/js/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <link href="/js/plugins/datepicker/datepicker.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="/js/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="/js/plugins/datepicker/datepicker.js"></script>
    <script src="/js/plugins/jquery-form/jquery.form.js"></script>

    <link href="/js/plugins/chosen/chosen.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/chosen/chosen.jquery.js"></script>
    <script type="text/javascript" src="/js/system/common.js"></script>
    <script type="text/javascript" src="/js/system/addtravelnote.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>

    <#--浏览历史JS-->
    <#include "../common/headerJSBroHistory.ftl">

    <script>
        $(function () {
            $("._j_title_error").html("");
            $(".publish_question").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.href = "/wenda/detail?questionId=" + data.data;
                    }else{
                        $("._j_title_error").html(data.msg);
                    }
                })
            })
        })
    </script>

</head>

<body>

<#assign currentNav="wenda">
<#include "../common/navbar.ftl">


<div class="wrapper">
    <div class="qt-container clearfix">
        <form class="forms" action="/wenda/saveOrUpdate" method="post" id="editForm">
            <div class="qt-main">
                <div class="crumb">
                    <a href="/wenda">旅游问答</a> &gt; <span>我要提问</span>
                </div>
                <div class="qt-tit">
                    <h5>问题标题</h5>
                    <div class="qt-con">
                        <input type="text" placeholder="标题不小于10字哦" class="_j_title" name="title">
                        <span class="count"><span class="_j_title_num">0</span>/80 字</span>
                        <span class="_j_min_num hide">10</span>
                        <span class="error err-tips _j_title_error"></span>
                    </div>

                </div>
                <div class="pi-col pi-date" style="margin-left: 2%;"> <label for="isopen">旅游地点</label>
                    <div class="pi-dropdown "style="text-align: left" >
                        <select name="dest.id" data-placeholder="请选择目的地" id="region" style="width: 150px;">
                        <#list dests as r>
                            <option value="${r.id!}">${r.name!}</option>
                        </#list>
                        </select>
                    </div>
                </div>
                <br/>
                <div class="qt-details">
                    <h5><a title="添加问答内容" class="icon active" id="_j_show_content"></a>问题详细内容</h5>
                    <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
                </div>
                <div class="publish_question">
                        <a class="qt-post-btn _j_publish" title="发布问题">发布问题</a>
                </div>
            </div>
        </form>

        <div class="qt-sider">
            <div class="qts-tit">提问的正确姿势</div>
            <div class="qts-con">
                <p>1.问题要【具体】【真实】【诚恳】，问题较多，需全面阐述时，可以添加问题补充。结伴/交易/与旅行无关的提问将被删除。</p>
                <p>2.给问题添加目的地，并打上正确的标签将有助于更快地获得回答。</p>
            </div>
        </div>
    </div>
</div>

                <#include "../common/footer.ftl">

</body>
</html>
