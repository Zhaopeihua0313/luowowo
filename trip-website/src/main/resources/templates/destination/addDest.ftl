<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>热门目的地</title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/destination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/system/destionation.js"></script>
    <script type="text/javascript" src="/js/theme/destmonth.js"></script>
    <script type="text/javascript" src="/js/theme/desttheme.js"></script>

<#--浏览历史JS-->
<#include "../common/headerJSBroHistory.ftl">
</head>
<body>
<#assign currentNav="destination">
<#include "../common/navbar.ftl">
<div class="container">
    <div class="row-bg">
        <div class="wrapper">
            <h1>创建新目的地</h1>
        </div>
    </div>
    <div class="wrapper">
        <form method="post" action="/mdd/add.php" id="form_edit">
            <div class="info-block">
                <h2>基础信息</h2>
                <div class="form-item">
                    <div class="label">中文名称<span class="asterisk">＊</span></div>
                    <div class="form-content">
                        <input name="name" class="inp-txt" type="text" placeholder="请输入中文名">
                    </div>
                </div>
                <div class="form-item">
                    <div class="label">英文名称<span class="asterisk">＊</span></div>
                    <div class="form-content">
                        <input name="ename" class="inp-txt" type="text" placeholder="请输入英文">
                    </div>
                </div>
                <div class="form-item">
                    <div class="label">所属区域<span class="asterisk"></span></div>
                    <div class="form-content">
                        <div class="ui-select">
                            <div class="trigger" data-type="continent"><#--<span class="value" data-mddid="52314">亚洲</span>--><i></i></div>
                            <div class="mdd-dropmenu hide">
                                <ul>
                                    <#list regions as r>
                                        <li value="${r.id}">${r.name}</li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                        <div class="ui-select">
                            <div class="trigger" data-type="country"><span class="value" data-mddid="0">未选择</span><i></i></div>
                            <div class="mdd-dropmenu hide">
                                <ul>
                                <#list country as c>
                                    <li value="${c.id}">${c.name}</li>
                                </#list>
                                </ul>
                            </div>
                        </div>
                        <div class="ui-select">
                            <div class="trigger" data-type="city"><span class="value" data-mddid="0">未选择</span><i></i></div>
                            <div class="mdd-dropmenu hide">
                                <ul>
                                <#list city as c>
                                    <li value="${c.id}">${c.name}</li>
                                </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-item">
                    <div class="label">介绍<span class="asterisk">＊</span></div>
                    <div class="form-content">
                        <textarea name="desc" rows="3" placeholder="300字以内的目的地简介" maxlength="300"></textarea>
                    </div>
                </div>
                <div class="form-item">
                    <div class="label">图片</div>
                    <div class="form-content" id="pnl_btn_upload_photo">
                        <a class="add-img" href="javascript:void(0)" id="btn_upload_photo"><i></i></a>
                        <ul class="list-img clearfix" id="upload_img_box">

                        </ul>
                        <h4 style="display: none">你已上传<span id="upload_img_count">0</span>张照片</h4>
                    </div>
                </div>
            </div>
            <div class="info-action info-action2"><a class="btn-submit" href="javascript:void(0)" id='frm_submit'>提交</a></div>
        </form>
    </div>
</div>
<link href="https://css.mafengwo.net/css/mfw-footer.css?1558532347" rel="stylesheet" type="text/css"/>
</body>3