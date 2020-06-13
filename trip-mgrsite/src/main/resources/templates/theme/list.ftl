<html lang="en">
<head>
    <title>攻略主题管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        $(function () {
            //编辑/添加
            $(".inputBtn").click(function () {
                $("#treeview").html("");
                //数据复原
                $("#editForm").clearForm(true);
                //攻略主题回显数据
                var data = $(this).data("json");
                if(data){
                    $("#editForm input[name='id']").val(data.id);
                    $("#editForm input[name='name']").val(data.name);
                    $("#editForm input[name='themecatalog']").val(data.themecatalog);
                    $("#editForm select[name='state']").val(data.state);
                    $("#editForm select[name='coverUrl']").val(data.coverUrl);
                }
                //弹出模态框
                $("#editModal").modal("show");
            });
            
            $(".submitBtn").click(function () {
                //模态框表单提交
                $("#editForm").ajaxSubmit(function (data) {
                    checkData(data)
                });
            });

            //查询
            $(".clickBtn").click(function () {
                var parentId = $(this).data("parentid");
                $("#parentId").val(parentId);
                $("#currentPage").val(1);
                $("#searchForm").submit();
            });

            //修改热门
            $(".hotBtn").click(function () {
                var hot = $(this).data("hot");
                var id = $(this).data("id");
                $.get("/strategyTheme/changeHotValue", {hot:hot, id:id}, function (data) {
                    checkData(data)
                });
            });
        });
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="strategyTheme">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">攻略主题管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/theme/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <a href="JavaScript:;" class="btn btn-success inputBtn"><span class="glyphicon glyphicon-plus"></span>  添加</a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>ID</th>
                        <th>名称</th>
                        <th>封面</th>
                        <th>分类</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td>${entity.name!}</td>
                       <td><img src="${entity.coverUrl!}" style="width: 100px;height: 70px;"></td>
                       <td>${entity.themecatalog.name!}</td>
                       <td>${entity.stateName!}</td>
                       <td>
                           <a class="btn btn-info btn-xs inputBtn" href="javascript:;" data-json='${entity.json}'>
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
                <h4 class="modal-title">编辑攻略推荐</h4>
            </div>
            <div class="modal-body">
            <#--隐藏文件上传表单-->
                <form action="/theme/coverImageUpload" method="post" id="coverForm" enctype="multipart/form-data">
                    <input type="file" name="pic" id="coverBtn" style="display: none;">
                </form>

            <#--真实 form 表单-->
                <form class="form-horizontal" action="/theme/saveOrUpdate" enctype="multipart/form-data"
                      method="post" id="editForm">
                    <input type="hidden" name="id" value=""/>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">目的地主题：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="title"  placeholder="请输入目的地主题名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">主题分类：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="themecatalog" name="themecatalog">
                            <#list catalogs as c>
                                <option value="${c.id}">${c.name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-3 control-label">选择封面：</label>
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

</body>
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
            console.log('sss');

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