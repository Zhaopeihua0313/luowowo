<html lang="en">
<head>
    <title>订单详情</title>
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
            /*//富文本框图片配置
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
            });*/

            //给每列的状态修改下拉框绑定值改变事件
            $('.status_select').on('change', function () {
                var id = $(this).data('id');
                var new_status = $(this).val();
                $.get('/orderDetail/updateStatus',{id:id,status:new_status},function (data) {
                    checkData(data, null, "订单状态修改成功")
                });
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
<#assign currentMenu = 'orderDetail'>
<div class="container-fluid " style="margin-top: 20px">
<#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
        <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">订单详情</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/scenic/saveOrUpdate" method="post" id="editForm">
                    <#--id-->
                    <#--<input type="hidden" value="${(entity.id)!}" name="id">-->
                    <#--id-->

                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单ID：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="id" name="id" disabled
                                   value="${(entity.id)!}" placeholder="请输入订单ID">
                        </div>
                    </div>

                    <#--下单用户信息-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">下单用户：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="createUser.nickname" disabled
                                   value="${(entity.createUser.nickname)!}" placeholder="请输入订单地址">
                        </div>
                        <label class="col-sm-2 control-label">手机：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="createUser.phone" disabled
                                   value="${(entity.createUser.phone)!}" placeholder="请输入订单地址">
                        </div>
                    </div>

                    <#--订单详情信息-->
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">下单时间：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="entity.createTime" disabled
                                   value="${entity.createTime?string('yyyy-MM-dd hh:mm:ss')}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">最后修改时间：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="entity.lastUpdateTime" disabled
                                   value="${entity.lastUpdateTime?string('yyyy-MM-dd hh:mm:ss')}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品总价：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="entity.totalPrice" disabled
                                   value="￥${entity.totalPrice!?string('0.00')}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">优惠金额：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="entity.pullPrice" disabled
                                   value="￥${entity.pullPrice!?string('0.00')}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单总价：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="entity.realPrice" disabled
                                   value="￥${entity.realPrice!?string('0.00')}" placeholder="请输入订单地址">
                        </div>
                    </div>

                    <#--商品详情信息-->
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单商品：</label>
                        <#--<div class="col-sm-2">
                            <input type="text" class="form-control" id="location" name="entity.createTime" disabled
                                   value="${entity.createTime?string('yyyy-MM-dd hh:mm:ss')}" placeholder="请输入订单地址">
                        </div>-->
                    </div>
                    <#list entity.products as product>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品${product_index+1}  类型：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="product" disabled
                                   value="${product.productTypeName}" placeholder="请输入订单地址">
                        </div>
                        <label class="col-sm-2 control-label">商品${product_index+1}  数量：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="product" disabled
                                   value="${product.productCount}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品${product_index+1}  名称：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="location" name="product" disabled
                                   value="${product.productName}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    </#list>

                    <#--商品详情信息-->
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">使用者信息：</label>
                    <#--<div class="col-sm-2">
                        <input type="text" class="form-control" id="location" name="entity.createTime" disabled
                               value="${entity.createTime?string('yyyy-MM-dd hh:mm:ss')}" placeholder="请输入订单地址">
                    </div>-->
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">使用者1 姓名：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="product" disabled
                                   value="${entity.userUser.name}" placeholder="请输入订单地址">
                        </div>
                        <label class="col-sm-2 control-label">使用者1 手机：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="location" name="product" disabled
                                   value="${entity.userUser.phone}" placeholder="请输入订单地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">使用者1 身份证：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="location" name="product" disabled
                                   value="${entity.userUser.userCard}" placeholder="请输入订单地址">
                        </div>
                    </div>


                    <#--&lt;#&ndash;coverUrl&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">封面：</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="coverUrl"  name="coverUrl" value="${(entity.coverUrl)!}" >
                            <img src="${(entity.coverUrl)!'/images/default.jpg'}" width="100px" id="imgUrl">
                            <button type="button" class="imgBtn">浏览</button>
                        </div>
                    </div>-->

                    <#--status-->
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单状态：</label>
                        <div class="col-sm-2">
                            <select name="status" data-status="${(entity.status)!}" id="status"
                                    class="form-control status_select" data-id="${(entity.id)!}" >
                                <option value="ordered">已下单</option>
                                <option value="paided">已支付</option>
                                <option value="cancelled">已取消</option>
                                <option value="payfailed">支付失败</option>
                                <option value="refunded">已退款</option>
                                <option value="canceling">取消中</option>
                            </select>
                        </div>
                        <script>
                            $("#status").val("${(entity.status)!}");
                        </script>
                    </div>

                    <#--destId-->
                    <#--<div class="form-group">
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
                    </div>-->

                    <#--父订单-->
                    <#--<div class="form-group">
                        <label class="col-sm-2 control-label">父订单：</label>
                        <div class="col-sm-8">
                            <select class="form-control selectpicker" id="parent_id" name="parent.id"
                                    data-live-search="true" title="请选择父订单">
                            <#list scenics as dest>
                                <option value="${dest.id}">${dest.name}</option>
                            </#list>
                            </select>
                        </div>
                        <script>
                            $("#parent_id").val(${(entity.parent.id)!});
                        </script>
                    </div>-->
<#--
                    &lt;#&ndash;订单摘要 intro&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单摘要：</label>
                        <textarea id="intro" name="intro" class="" style="margin-left: 15px;width: 65%;height: 24%;">${(entity.intro)!}</textarea>
                    </div>

                    &lt;#&ndash;photos photosContent&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单相册：</label>
                    </div>
                    <div class="form-group">
                        <textarea id="photosContent" name="photosContent" class="ckeditor">${(entity.photosContent)!}</textarea>
                    </div>

                    &lt;#&ndash;content&ndash;&gt;
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单概况内容：</label>
                    </div>
                    <div class="form-group">
                        <textarea id="content" name="content.content" class="ckeditor">${(entity.content.content)!}</textarea>
                    </div>-->

                    <#--保存按钮-->
                    <#--<div class="form-group">
                        <div class="col-sm-offset-1 col-sm-8">
                            <button id="btn_submit" class="btn btn-primary" type="button">保存</button>
                            <button type="reset" class="btn btn-danger">重置</button>
                        </div>
                    </div>-->

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>