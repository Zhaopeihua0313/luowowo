<html lang="en">
<head>
    <title>门票管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
    $(function () {

    })
</script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="ticket">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">门票管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/ticket/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <input type="hidden" name="pageSize" id="pageSize" value="10">
                <a href="/ticket/input" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>
                    添加</a>
            </form>

            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>ID</th>
                    <th>门票名</th>
                    <th>门票类别</th>
                    <th>景点</th>
                    <th>目的地</th>
                    <th>预售时间</th>
                    <th>市场价</th>
                    <th>售价</th>


                    <th>操作</th>
                </tr>
                </thead>
               <#list pageInfo.list! as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td>${entity.name!}</td>
                       <td>${(entity.catalogName)!}</td>
                       <td>${(entity.scenic.name)!}</td>
                       <td>${(entity.dest.name)!}</td>
                       <td>${entity.presetTime!}</td>
                       <td>￥${entity.marketPrice!?string('0.00')}</td>
                       <td>￥${entity.salePrice!?string('0.00')}</td>
                       <td>
                            <a class="btn btn-info btn-xs inputBtn" href="/ticket/input?id=${entity.id}">
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
                <h4 class="modal-title">设为推荐</h4>
            </div>
            <div class="modal-body">
                <#--隐藏文件上传表单-->
                <form action="/strategyDetail/coverImageUpload" method="post" id="coverForm" enctype="multipart/form-data">
                    <input type="file" name="pic" id="coverBtn" style="display: none;">
                </form>

                <#--真实 form 表单-->
                <form class="form-horizontal" action="/strategyCommend/saveOrUpdate" enctype="multipart/form-data"
                      method="post" id="editForm">
                    <input type="hidden" name="detailId" value=""/>
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
                            <select class="form-control" id="state" name="state" >
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
</html>