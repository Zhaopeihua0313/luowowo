<html lang="en">
<head>
    <title>游记推荐管理</title>
    <#include "../common/header.ftl">
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="travelCommend">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">游记推荐管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/travelCommend/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>ID</th>
                        <th>关联的游记ID</th>
                        <th>封面</th>
                        <th>标题</th>
                        <th>副标题</th>
                        <th>序号</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td style="width: 10%;">${entity.travelId}</td>
                       <td><img src="${entity.coverUrl!}" style="width: 100px;height: 50px;"></td>
                       <td>${entity.title!}</td>
                       <td>${entity.subTitle!}</td>
                       <td>${entity.sequence!}</td>
                       <td>${entity.stateName!}</td>
                       <td>
                           <a class="btn btn-info btn-xs inputBtn commend" href="javascript:;"
                              data-json='${entity.json}' >
                               <span class="glyphicon glyphicon-edit"></span> 编辑
                           </a>
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
                <h4 class="modal-title">编辑游记推荐</h4>
            </div>
            <div class="modal-body">
            <#--隐藏文件上传表单-->
                <form action="/travelCommend/coverImageUpload" method="post" id="coverForm" enctype="multipart/form-data">
                    <input type="file" name="pic" id="coverBtn" style="display: none;">
                </form>

            <#--真实 form 表单-->
                <form class="form-horizontal" action="/travelCommend/saveOrUpdate" enctype="multipart/form-data"
                      method="post" id="editForm">
                    <input type="hidden" name="detailId" value=""/>
                    <input type="hidden" name="id" value=""/>
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
                            <img src="" id="coverUrl" style="width: 269px;">
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
                            <select class="form-control" id="state" name="state">
                                <option value="0">推荐</option>
                                <option value="1">停止推荐</option>
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

<script type="text/javascript">
    $(function () {
        $(".choseBtn").click(function () {			//选择封面点击事件，触发隐藏的上传图片按钮 form
            $("#coverBtn").click();
        });
        $("#coverBtn").change(function () {			//隐藏的上传图片 form 值改变绑定事件，自动异步请求上传图片，并且获取上传后的地址回显
            if(this.value){
                $("#coverForm").ajaxSubmit(function (data) {
                    $("#coverUrl").attr("src", "/" +data);	//回显
                    $("#coverValue").val("/" + data);			//给真实 form 赋值图片的 url
                })
            }
        });


        //设为推荐
        $(".commend").click(function () {
            $("#editForm").clearForm(true);
            var data = $(this).data('json');
            console.log(data);

            $("#editForm input[name='detailId']").val(data.detailId);
            $("#editForm input[name='id']").val(data.id);
            $("#editForm input[name='subTitle']").val(data.subTitle);
            $("#editForm input[name='title']").val(data.title);
            $("#coverValue").val(data.coverUrl);
            $("#coverUrl").prop('src', data.coverUrl);
            $("#editForm input[name='sequence']").val(data.sequence);
            $("#editForm select[name='state']").val(data.state);

            $("#editModal").modal("show");
        });

        $(".submitBtn").click(function () {
            $("#editForm").ajaxSubmit(function (data) {
                checkData(data)
            });
        });
    });
</script>

</body>
</html>