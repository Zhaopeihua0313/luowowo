<div class="bd">
    <ul class="scenic-list clearfix">
        <#list page.list as s>
            <li>
                <a href="/scenic/detail?scenicId=${s.id}" target="_blank" title="${(s.name)!}">
                    <div class="img"><img src="${(s.coverUrl)!}" width="192" height="130"></div>
                    <h3>${(s.name)!}</h3>
                </a>
            </li>
        </#list>
    </ul>
</div>

<div style="float: right">
    <div style="float: left;" ><span style="line-height:30px"> 共${page.pages}页 / ${page.total}条&nbsp;&nbsp;&nbsp;</span></div>
    <div id="pagination" class="jq-pagination" style="display: inline;"></div>
</div>
<script>
    $("#pagination").jqPaginator({
        totalPages: ${page.pages}||1,
            visiblePages: 5,
            currentPage: ${page.pageNum}||1,
            prev: '<a class="prev" href="javascript:void(0);">上一页<\/a>',
            next: '<a class="next" href="javascript:void(0);">下一页<\/a>',
            page: '<a href="javascript:void(0);">{{page}}<\/a>',
            last: '<a class="last" href="javascript:void(0);" >尾页<\/a>',
            onPageChange: function(page, type) {
        if(type == 'change'){
            $("#currentPage").val(page);
           /* $("#scenicPageForm").submit();*/
            $('#scenicPageForm').ajaxSubmit(function (data) {
                $("#scenicPage").html(data);
            });
        }
    }
    })
</script>
