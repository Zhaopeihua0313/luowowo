<html lang="en">
<head>
    <title>景点编辑</title>
<#include "../common/header.ftl"/>
    <link rel="stylesheet" type="text/css" href="/js/plugins/bootstrap-select/bootstrap-select.css"/>
    <script src="/js/plugins/bootstrap-select/bootstrap-select.js"></script>

    <link type="text/css" rel="stylesheet" href="/js/plugins/uploadifive/uploadifive.css" />
    <script type="text/javascript" src="/js/plugins/uploadifive/jquery.uploadifive.min.js"></script>

    <link type="text/css" rel="stylesheet" href="/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" />
    <script type="text/javascript" src="/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="/js/ckeditor/ckeditor.js"></script>
    <script>
        //表单提交验证
        $(function () {
            //富文本框图片配置
            var ck = CKEDITOR.replace( 'content',{
                filebrowserBrowseUrl: '/图片服务器，假装这里有',
                filebrowserUploadUrl: '/uploadImg_ck'
            });
            var photosContent = CKEDITOR.replace( 'photosContent',{
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
                $("#photosContent").val(photosContent.getData());

                $("#editForm").ajaxSubmit(function (data) {
                    console.log(data);
                    checkData(data, "/scenic/list");
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
<#assign currentMenu = 'scenic'>
<div class="container-fluid " style="margin-top: 20px">
<#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
        <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">景点编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/scenic/saveOrUpdate" method="post" id="editForm">
                    <#--id-->
                    <input type="hidden" value="${(entity.id)!}" name="id">
                    <#--name-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">景点名称：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" value="${(entity.name)!}" placeholder="请输入景点名称">
                        </div>
                    </div>

                    <#--location-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">景点地址：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="location" name="location" value="${(entity.location)!}" placeholder="请输入景点地址">
                        </div>
                    </div>

                    <#--coverUrl-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">封面：</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="coverUrl"  name="coverUrl" value="${(entity.coverUrl)!}" >
                            <img src="${(entity.coverUrl)!'/images/default.jpg'}" width="100px" id="imgUrl">
                            <button type="button" class="imgBtn">浏览</button>
                        </div>
                    </div>

                    <#--catalog-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="catalog" name="scenicCatalog.id">
                                <#list catalogs as c>
                                    <option value="${c.id}">${c.name}</option>
                                </#list>
                            </select>
                        </div>
                        <script>
                            $("#catalog").val(${(entity.scenicCatalog.id)!});
                        </script>
                    </div>

                    <#--destId-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">关联目的地：</label>
                        <div class="col-sm-8">
                            <select class="form-control selectpicker" id="destId" name="destId"
                                    data-live-search="true" title="请选择关联的目的地">
                                <#list dests as dest>
                                    <option value="${dest.id}">${dest.name}</option>
                                </#list>
                            </select>
                        </div>
                        <script>
                            $("#destId").val(${(entity.destId)!});
                        </script>
                    </div>

                    <#--父景点-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">父景点：</label>
                        <div class="col-sm-8">
                            <select class="form-control selectpicker" id="parent_id" name="parent.id"
                                    data-live-search="true" title="请选择父景点">
                            <#list scenics as dest>
                                <option value="${dest.id}">${dest.name}</option>
                            </#list>
                            </select>
                        </div>
                        <script>
                            $("#parent_id").val(${(entity.parent.id)!});
                        </script>
                    </div>

                    <#--景点摘要 intro-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">景点摘要：</label>
                        <textarea id="intro" name="intro" class="" style="margin-left: 15px;width: 65%;height: 24%;">${(entity.intro)!}</textarea>
                    </div>

                    <#--photos photosContent-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">景点相册：</label>
                    </div>
                    <div class="form-group">
                        <textarea id="photosContent" name="photosContent" class="ckeditor">${(entity.photosContent)!}</textarea>
                    </div>

                    <#--content-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">景点概况内容：</label>
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