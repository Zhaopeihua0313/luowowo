<html lang="en">
<head>
    <title>游记管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        $(function () {
            //查询
            $(".clickBtn").click(function () {
                $("#currentPage").val(1);
                $("#searchForm").submit();
            });

            //列表中每列的状态修改下拉框回显
            $('.state_select').val(function () {
                return $(this).data('state');
            });
            //给每列的状态修改下拉框绑定值改变事件
            $('.state_select').on('change', function () {
                var id = $(this).data('id');
                var new_state = $(this).val();
                $.get('/travel/updateState',{id:id,state:new_state},function (data) {
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
            })

            //设为推荐
            $(".commend").click(function () {
                $("#editForm").clearForm(true);
                $("#coverUrl").hide();
                $("#coverValue").val("");

                //$("#editForm input[name='sequence']").val(1);
                $("#editForm select[name='state']").val(0);

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
<#assign currentMenu="travel">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">游记管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/travel/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${qo.keyword!}" placeholder="请输入标题">
                </div>
                <div class="form-group">
                    <label >状态:</label>
                    <select name="state" class="form-control" id="state">
                        <option value="-1">全部</option>
                        <option value="1">待发布</option>
                        <option value="2">已发布</option>
                        <option value="3">已拒绝</option>
                    </select>
                    <script>
                        $("#state option[value='${qo.state}']").prop("selected", true);
                    </script>

                </div>
                <button type="button" class="btn btn-info clickBtn"><span class="glyphicon glyphicon-search"></span> 查询</button>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>ID</th>
                        <th>封面</th>
                        <th>最后修改时间</th>
                        <th>标题</th>
                        <th>地点</th>
                        <th>作者</th>
                        <th>发布时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1 + (qo.currentPage-1)*qo.pageSize }</td>
                       <td>${entity.id}</td>
                       <td><img src="${entity.coverUrl}" style="width: 100px;height: 50px;"></td>
                       <td>${entity.lastUpdateTime?string('yyyy-MM-dd hh:mm:ss')}</td>
                       <td>${entity.title}</td>
                       <td>${(entity.dest.name)!}</td>
                       <td>${(entity.author.nickname)!}</td>
                       <td>${(entity.releaseTime?string('yyyy-MM-dd hh:mm:ss'))!}</td>
                       <td>${(entity.stateName)!}</td>

                       <td>
                           <select name="state" data-state="${(entity.state)!}" class="state_select" data-id="${(entity.id)!}" >
                               <option value="0">草稿中</option>
                               <option value="1">待发布</option>
                               <option value="2">已发布</option>
                               <option value="3">已拒绝</option>
                           </select>

                           <a class="btn btn-info btn-xs showBtn" href="JavaScript:;" data-tid="${entity.id}" style="margin-top: -5px;">
                               <span class="glyphicon glyphicon-th"></span> 查看
                           </a>

                           <#if entity.state == 2 >
                               <#if entity.travelCommend?? && entity.travelCommend.id?? >
                                   <span>已设推荐</span>
                               <#else>
                                   <a class="btn btn-danger btn-xs commend" href="javascript:;"
                                      data-id='${entity.id}'>
                                       <span class="glyphicon glyphicon-minus-sign"></span> 设为推荐
                                   </a>
                               </#if>
                           <#else>
                           </#if>

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


<!---查看文章--->
<div class="modal fade" id="travelModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">查看游记</h4>
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