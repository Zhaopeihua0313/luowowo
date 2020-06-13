<html lang="en">
<head>
    <title>攻略标签管理</title>
    <#include "../common/header.ftl">
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="strategyTag">

<script type="text/javascript">

    $(function () {

        //编辑/添加
        $(".inputBtn").click(function () {
            //数据复原
            $("#editForm").clearForm(true);

            //区域回显数据
            var data = $(this).data("json");
            if(data){
                $("#editForm input[name='id']").val(data.id);
                $("#editForm input[name='name']").val(data.name);
            }
            //弹出模态框
            $("#editModal").modal("show");
        });

        $(".submitBtn").click(function () {
            //模态框表单提交
            $("#editForm").ajaxSubmit(function (data) {
                checkData(data);
            })
        });
    })
</script>

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">攻略标签管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/strategyTag/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>ID</th>
                        <th>名称</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td>${entity.name!}</td>
                       <td>
                           <a class="btn btn-info btn-xs inputBtn" href="JavaScript:;" data-json='${entity.json}'>
                               <span class="glyphicon glyphicon-pencil"></span> 编辑
                           </a>
                           <#--<a class="btn btn-danger btn-xs inputDelete" href="JavaScript:;" data-json='${entity.json}'>
                               <span class="glyphicon glyphicon-erase"></span> 删除
                           </a>-->
                       </td>
                   </tr>
               </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>

<#--编辑模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                <h4 class="modal-title">标签编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/strategyTag/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="" name="id">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">标签名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name"  placeholder="请输入标签名称">
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
</html>