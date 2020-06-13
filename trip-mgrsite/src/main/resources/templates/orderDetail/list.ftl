<html lang="en">
<head>
    <title>订单管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        $(function () {
            //查询
            $(".clickBtn").click(function () {
                $("#currentPage").val(1);
                $("#searchForm").submit();
            });

            //列表中每列的状态修改下拉框回显
            $('.status_select').val(function () {
                return $(this).data('status');
            });
            //给每列的状态修改下拉框绑定值改变事件
            $('.status_select').on('change', function () {
                var id = $(this).data('id');
                var new_status = $(this).val();
                $.get('/orderDetail/updateStatus',{id:id,status:new_status},function (data) {
                    checkData(data)
                });
            });

            //查看内容
            $(".showBtn").click(function () {
                var id =  $(this).data("tid");
                $.get("/travel/getTravelContent", {id:id}, function (data) {
                    $(".modal-body").html(data.content);
                });

                $("#travelModal").modal("show")
            });

            //设为推荐
            $(".commend").click(function () {
                $("#editForm").clearForm(true);
                $("#coverUrl").hide();
                $("#coverValue").val("");

                //$("#editForm input[name='sequence']").val(1);
                $("#editForm select[name='status']").val(0);

                var id = $(this).data("id");
                $("#editForm input[name='travelId']").val(id);
                $("#editModal").modal("show");
            });

            $(".submitBtn").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    checkData(data)
                });
            });

            $(".choseBtn").click(function () {			//选择封面点击事件，触发隐藏的上传图片按钮 form
                $("#coverBtn").click();
            });
            $("#coverBtn").change(function () {			//隐藏的上传图片 form 值改变绑定事件，自动异步请求上传图片，并且获取上传后的地址回显
                if(this.value){
                    $("#coverForm").ajaxSubmit(function (data) {
                        $("#coverUrl").show();
                        $("#coverUrl").attr("src", "/" +data);	//回显
                        $("#coverValue").val("/" + data);			//给真实 form 赋值图片的 url
                    })
                }
            });
        })
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="orderDetail">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">订单管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/orderDetail/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <input type="hidden" name="pageSize" id="pageSize" value="10">
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${qo.keyword!}" placeholder="请输入标题">
                </div>
                <div class="form-group">
                    <label >状态:</label>
                    <select name="status" class="form-control" id="status">
                        <option value="all">全部</option>
                        <option value="ordered">已下单</option>
                        <option value="paided">已支付</option>
                        <option value="cancelled">已取消</option>
                        <option value="payfailed">支付失败</option>
                        <option value="refunded">已退款</option>
                        <option value="canceling">取消中</option>
                    </select>
                    <script>
                        $("#status option[value='${qo.status}']").prop("selected", true);
                    </script>

                </div>
                <#--查询按钮-->
                <button type="button" class="btn btn-info clickBtn">
                    <span class="glyphicon glyphicon-search"></span> 查询
                </button>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>订单ID</th>
                        <th>下单用户</th>
                        <th>下单时间</th>
                        <th>商品总价</th>
                        <th>优惠金额</th>
                        <th>订单总价</th>
                        <th>状态</th>
                        <th>最后修改时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td>${(entity.createUser.nickname)!}</td>
                       <td>${entity.createTime?string('yyyy-MM-dd hh:mm:ss')}</td>
                       <td>￥${entity.totalPrice!?string('0.00')}</td>
                       <td>￥${entity.pullPrice!?string('0.00')}</td>
                       <td>￥${entity.realPrice!?string('0.00')}</td>
                       <td>${(entity.statusName)!}</td>
                       <td>${entity.lastUpdateTime?string('yyyy-MM-dd hh:mm:ss')}</td>
                       <td>
                           <select name="status" data-status="${(entity.status)!}" class="status_select" data-id="${(entity.id)!}" >
                               <option value="ordered">已下单</option>
                               <option value="paided">已支付</option>
                               <option value="cancelled">已取消</option>
                               <option value="payfailed">支付失败</option>
                               <option value="refunded">已退款</option>
                               <option value="canceling">取消中</option>
                           </select>

                           <a class="btn btn-info btn-xs" href="/orderDetail/input?id=${entity.id}" data-tid="${entity.id}" style="margin-top: -5px;">
                               <span class="glyphicon glyphicon-th"></span> 查看
                           </a>

                           <#--<#if entity.status == 2 >
                               <#if entity.travelCommend?? && entity.travelCommend.id?? >
                                   <span>已设推荐</span>
                               <#else>
                                   <a class="btn btn-danger btn-xs commend" href="javascript:;"
                                      data-id='${entity.id}'>
                                       <span class="glyphicon glyphicon-minus-sign"></span> 设为推荐
                                   </a>
                               </#if>
                           <#else>
                           </#if>-->

                       </td>
                   </tr>
               </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>

<#--模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                <h4 class="modal-title">设为推荐</h4>
            </div>
            <div class="modal-body">
            <#--隐藏文件上传表单-->
                <form action="/travelCommend/coverImageUpload" method="post" id="coverForm" enctype="multipart/form-data">
                    <input type="file" name="pic" id="coverBtn" style="display: none;">
                </form>

            <#--真实 form 表单-->
                <form class="form-horizontal" action="/travelCommend/saveOrUpdate" enctype="multipart/form-data"
                      method="post" id="editForm">
                    <input type="hidden" name="travelId" value=""/>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">包装标题：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="title"  placeholder="请输入包装标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">包装副标题：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="subTitle"  placeholder="请输入包装副标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">包装封面：</label>
                        <div class="col-sm-6">
                        <#--回显图片占位-->
                            <img src="" id="coverUrl" style="width: 269px;display: none;" >
                        <#--真实 img input-->
                            <button type="button"><span class="choseBtn">+ 选择封面</span></button>
                            <input type="hidden" name="coverUrl" id="coverValue" class="form-control">
                        <#--<input type="file" class="form-control" name="pic">-->
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">序号：</label>
                        <div class="col-sm-6">
                            <input type="number" class="form-control" name="sequence">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">状态：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="status" name="status" >
                                <option value="0">启用</option>
                                <option value="1">禁用</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary submitBtn" >保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div>
    </div>
</div>


<!---查看文章--->
<div class="modal fade" id="travelModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">查看订单</h4>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>

<style>
    #travelModal img{
        width:100%;
    }
    #travelModal .modal-body{
        max-height: 600px;
        overflow-y: auto;
    }

</style>

</body>
</html>