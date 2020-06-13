<html lang="en">
<head>
    <title>门票<#if entity??>编辑<#else>新增</#if></title>
<#include "../common/header.ftl"/>
    <link rel="stylesheet" type="text/css" href="/js/plugins/bootstrap-select/bootstrap-select.css"/>
    <script src="/js/plugins/bootstrap-select/bootstrap-select.js"></script>

    <link type="text/css" rel="stylesheet" href="/js/plugins/uploadifive/uploadifive.css" />
    <script type="text/javascript" src="/js/plugins/uploadifive/jquery.uploadifive.min.js"></script>

    <link type="text/css" rel="stylesheet" href="/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" />
    <script type="text/javascript" src="/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="/js/ckeditor/ckeditor.js"></script>
    <script>
        //门票标签列表渲染
        function showPicker(data) {
            var html = '';
            $.each(data, function (index, item) {
                html += '<option value="' + item.id + '">'+item.name+'</option>'
            });

            $("#tagIds").html(html);
            $('#tagIds').selectpicker('refresh');
        }
        
        
        //表单提交验证
        $(function () {
            //门票标签列表
            $.get("/ticket/listTags", function (data) {
                showPicker(data);
                //关联的标签回显
                //$('#tagIds').selectpicker('val', ["1","2"]);
                $('#tagIds').selectpicker('val', ${(entity.tagIds)!});
                $('#tagIds').selectpicker('refresh');
            });

            
            //富文本框图片配置
            var ck = CKEDITOR.replace( 'content',{
                filebrowserBrowseUrl: '/图片服务器，假装这里有',
                filebrowserUploadUrl: '/uploadImg_ck'
            });


            //图片上传
            $('.imgBtn').uploadifive({
                'auto' : true,
                'uploadScript' : '/uploadImg',
                buttonClass:"btn-link",
                'fileObjName' : 'pic',
                'buttonText' : '浏览...',
                'fileType' : 'image',
                'multi' : false,
                'fileSizeLimit'   : 5242880,
                'removeCompleted' : true,
                'uploadLimit' : 1,
                'overrideEvents': ['onDialogClose', 'onError'],    //onDialogClose 取消自带的错误提示
                'onUploadComplete' : function(file, data) {
                    $("#imgUrl").attr("src" , "/" + data);
                    $("#coverUrl").val("/" + data);
                },
                onFallback : function() {
                    $.messager.alert("温馨提示","该浏览器无法使用!");
                }
            });

            //保存
            $("#btn_submit").click(function () {
                console.log("提交！");

                //异步提交时， 富文本框可能出问题
                $("#content").val(ck.getData());

                $("#editForm").ajaxSubmit(function (data) {
                    console.log(data);
                    checkData(data, "/ticket/list");
                });
            });
        });
    </script>
</head>
<body>

<#--副文本框样式-->
<style>
    .cke_chrome {
        visibility: inherit;
        margin-left: 7%;
        margin-right: 16%;
</style>

<!--设置菜单回显-->
<#assign currentMenu = 'ticket'>
<div class="container-fluid " style="margin-top: 20px">
<#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
        <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">门票编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/ticket/saveOrUpdate" method="post" id="editForm">
                    <#--id-->
                    <input type="hidden" value="${(entity.id)!}" name="id">
                    <#--name-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">门票名称：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" value="${(entity.name)!}" placeholder="请输入门票名称">
                        </div>
                    </div>

                    <#--presetTime-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">预售时间：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="presetTime" name="presetTime" value="${(entity.presetTime)!}" placeholder="请输入门票预售时间信息">
                        </div>
                    </div>

                    <#--coverUrl-->
                    <#--<div class="form-group">
                        <label class="col-sm-2 control-label">封面：</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="coverUrl"  name="coverUrl" value="${(entity.coverUrl)!}" >
                            <img src="${(entity.coverUrl)!'/images/default.jpg'}" width="100px" id="imgUrl">
                            <button type="button" class="imgBtn">浏览</button>
                        </div>
                    </div>-->

                    <#--catalog-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">门票类别：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="catalog" name="catalog">
                                <#--<#list catalogs as c>
                                    <option value="${c.id}">${c.name}</option>
                                </#list>-->
                                    <option value="1">成人票</option>
                                    <option value="2">儿童票</option>
                                    <option value="3">老人票</option>
                                    <option value="4">通用票</option>
                            </select>
                        </div>
                        <script>
                            $("#catalog").val(${(entity.catalog)!});
                        </script>
                    </div>

                    <#--scenicId-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属景点：</label>
                        <div class="col-sm-8">
                            <select class="form-control selectpicker" id="scenicId" name="scenicId"
                                    data-live-search="true" title="请选择关联的目的地">
                                <#list scenics as dest>
                                    <option value="${dest.id}">${dest.name}</option>
                                </#list>
                            </select>
                        </div>
                        <script>
                            $("#scenicId").val(${(entity.scenicId)!});
                        </script>
                    </div>

                    <#--marketPrice-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">市场价：</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="marketPrice" name="marketPrice" value="${(entity.marketPrice)!}" placeholder="请输入市场价">
                        </div>
                    </div>

                    <#--salePrice-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">售价：</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="salePrice" name="salePrice" value="${(entity.salePrice)!}" placeholder="请输入售价">
                        </div>
                    </div>

                    <#--标签-->
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">标签：</label>
                        <div class="col-sm-8">
                            <select class="form-control selectpicker" id="tagIds" multiple name="tagIds"
                                    data-live-search="true" title="请选择标签">
                            </select>
                        </div>
                    </div>

                    <#--&lt;#&ndash;父门票&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">父门票：</label>
                        <div class="col-sm-8">
                            <select class="form-control selectpicker" id="parent_id" name="parent.id"
                                    data-live-search="true" title="请选择父门票">
                            <#list tickets as dest>
                                <option value="${dest.id}">${dest.name}</option>
                            </#list>
                            </select>
                        </div>
                        <script>
                            $("#parent_id").val(${(entity.parent.id)!});
                        </script>
                    </div>-->

                    <#--&lt;#&ndash;门票摘要 intro&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">门票摘要：</label>
                        <textarea id="intro" name="intro" class="" style="margin-left: 15px;width: 65%;height: 24%;">${(entity.intro)!}</textarea>
                    </div>-->

                    <#--&lt;#&ndash;photos photosContent&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">门票相册：</label>
                    </div>
                    <div class="form-group">
                        <textarea id="photosContent" name="photosContent" class="ckeditor">${(entity.photosContent)!}</textarea>
                    </div>-->

                    <#--content-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">门票概况内容：</label>
                    </div>
                    <div class="form-group">
                        <textarea id="content" name="content.content" class="ckeditor">${(entity.content.content)!}</textarea>
                    </div>

                    <#--保存按钮-->
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-8">
                            <button id="btn_submit" class="btn btn-primary" type="button">保存</button>
                            <button type="reset" class="btn btn-danger">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>