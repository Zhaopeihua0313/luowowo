<ul id="comments" data-page="1" data-id="0">
<#list page.content as c>
    <li class="rev-item comment-item clearfix">
        <div class="user"><a class="avatar" href="#" target="_blank">
            <img src="${c.headUrl}"
                width="48" height="48"></a><span class="level">Lv.${c.level}</span></div>

        <a class=" btn-comment-like useful ${c.thumbuplist?seq_contains((user.id)!-1)?string("liked", "like")}"
            data-scenicId="${c.scenicId}" data-id="${c.id}" title="点赞">
            <i></i><span class="useful-num" data-id="${c.id}">${c.thumbupnum}</span>
        </a>

        <a class="name" target="_blank">${c.username}</a>
        <#--星星显示-->
        <span class="s-star s-star${c.overallScore!0}"></span>


        <#--评论内容-->
        <p class="rev-txt">${(c.content)!}</p>

        <#--图片-->
        <div class="rev-img">
            <#if c.pics??>
                <#list c.pics as pic>
                    <a href="#" target="_blank">
                    <img src="${pic}" width="200" height="120"></a>
                </#list>
            </#if>

        </div>

        <div class="info clearfix">
            <a class="btn-comment _j_comment" title="添加评论">评论</a>
            <span class="time">${c.createTime ?string('yyyy-MM-dd HH:ss')}</span>
            <span class="from">
               <#--此条点评来自<a href="#" target="_blank"></a>-->
            </span>
        </div>

        <div class="comment add-reply ">
            <ul class="more_reply_box comment_list">
                <#if c.refComment ??>
                    <#list c.refComment as reply>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${reply.headUrl!}" width="16" height="16">${reply.username!}
                        </a>

                        <#if reply.uname ??>
                            回复:${reply.uname} : ${reply.content}
                        <#else>
                            添加评论 : ${reply.content}
                        </#if>

                        <a class="_j_reply re_reply" data-uid="${reply.userId}" data-username="${reply.username}"
                            title="添加回复">回复</a>
                        <br><span class="time">${reply.createTime ?string('yyyy-MM-dd HH:ss')}</span>

                    </li>
                    </#list>
                </#if>
            </ul>

            <#--回复框-->
            <div class="add-comment hide reply-form">
                <textarea class="comment_reply" style="overflow: hidden; color: rgb(204, 204, 204);" name="content"></textarea>
                <a class="btn btn_submit_reply" data-parent_id="${c.id}" data-uid="" data-uname="">回复</a>
            </div>
        </div>
    </li>
</#list>

    <script>
        //回复评论
        $(function () {
            var uname;
            var uid;
            $('.re_reply').click(function () {
                uid = $(this).data('userId');
                uname = $(this).data('username');
            });
            //直接回复评论, 大的回复框
            $('.btn_submit_reply').click(function () {
                var parentId = $(this).data("parent_id");
                var content = $(this).prev('.comment_reply').val();
                $.post("/scenic/commentReply",{"parentId":parentId,"content":content,"uid":uid,"uname":uname},function (data) {
                    if (data.success) {
                        $('#searchForm').ajaxSubmit(function (data) {
                            $("#scenicComment").html();
                            $("#scenicComment").html(data);
                        });
                    } else {
                        popup(data.msg);
                    }
                })
            });

            $('.useful').click(function () {
                var id = $(this).data('id'); //评论id
                var scenicId = $(this).data('scenicId'); //景点id
                $.get("/scenic/thumbup", {"commentId": id}, function (data) {
                    if (data.success) {
                        $('#searchForm').ajaxSubmit(function (data) {
                            dialogCommon("OK~", 700, "no");
                            $("#scenicComment").html();
                            $("#scenicComment").html(data);
                        });
                    } else {
                        popup(data.msg);
                    }
                })
            });
        });

    </script>
    <div style="float: right">
        <div style="float: left;" ><span style="line-height:30px"> 共${page.totalPages!}页 / ${page.totalElements}条&nbsp;&nbsp;&nbsp;</span></div>
        <div id="pagination" class="jq-pagination" style="display: inline;"></div>
    </div>
    <script>
        $("#pagination").jqPaginator({
            totalPages: ${page.totalPages!1},
            visiblePages: 5,
            currentPage: ${page.number+1}||1,
                prev: '<a class="prev" href="javascript:void(0);">上一页<\/a>',
                next: '<a class="next" href="javascript:void(0);">下一页<\/a>',
                page: '<a href="javascript:void(0);">{{page}}<\/a>',
                last: '<a class="last" href="javascript:void(0);" >尾页<\/a>',
                onPageChange: function(page, type) {
            if(type == 'change'){
                $("#currentPage").val(page);
                //查询评论列表
                $('#searchForm').ajaxSubmit(function (data) {
                    $("#scenicComment").html(data);
                });
            }
         }
        })
    </script>

</ul>