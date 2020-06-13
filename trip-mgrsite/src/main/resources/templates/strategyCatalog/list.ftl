<html lang="en">
<head>
    <title>攻略分类管理</title>
    <#include "../common/header.ftl">
    <link rel="stylesheet" type="text/css" href="/js/plugins/bootstrap-select/bootstrap-select.css"/>
    <script src="/js/plugins/bootstrap-select/bootstrap-select.js"></script>

    <script type="text/javascript">
        $(function () {
            //填充模态框里目的地列表数据
            /*$.get("/strategyCatalog/listDests", function (data) {
                console.log(data);
                var html = '';
                $.each(data, function (index, item) {
                    html += '<option value="' + item.id + '">'+item.name+'</option>'
                });
                $("#destId").html(html);
                $('#destId').selectpicker('refresh');
            });*/

            //编辑/添加
            $(".inputBtn").click(function () {
                //数据复原
                $("#editForm").clearForm(true);
                //攻略分类回显数据
                var data = $(this).data("json");
                console.log(data);

                if(data){
                    $("#editForm input[name='id']").val(data.id);
                    $("#editForm input[name='name']").val(data.name);
                    $("#editForm select[name='state']").val(data.state);
                    $("#editForm select[name='destId']").val(data.destId);
                    $('#destId').selectpicker('refresh');
                }
                //弹出模态框
                $("#editModal").modal("show");
            });
            
            $(".submitBtn").click(function () {
                //模态框表单提交
                $("#editForm").ajaxSubmit(function (data) {
                    checkData(data);
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
                $.get("/strategyCatalog/changeHotValue", {hot:hot, id:id}, function (data) {
                    checkData(data);
                });
            });
        });
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="strategyCatalog">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">攻略分类管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/strategyCatalog/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <a href="JavaScript:;" class="btn btn-success inputBtn">
                    <span class="glyphicon glyphicon-plus"></span> 添加
                </a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>ID</th>
                        <th>名称</th>
                        <th>关联目的地</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td>${entity.name!}</td>
                       <td>${entity.dest.name}</td>
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
                <h4 class="modal-title">攻略分类添加/编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/strategyCatalog/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="" name="id">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" name="name"  placeholder="请输入攻略分类名称">
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

                    <div class="form-group">
                        <label  class="col-sm-3 control-label">关联目的地：</label>
                        <div class="col-sm-6">
                            <select class="form-control selectpicker" id="destId" name="destId"
                                    data-live-search="true" title="请选择关联的目的地">
                                <#list dests as dest>
                                    <option value="${dest.id}">${dest.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <#--<div class="form-group">
                        <label  class="col-sm-3 control-label">关联目的地：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="destId" name="destId">
                                <#list dests as dest>
                                    <option value="${dest.id}">${dest.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>-->
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