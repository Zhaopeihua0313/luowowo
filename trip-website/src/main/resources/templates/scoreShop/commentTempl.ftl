<#list cmts as comment>
<li class="_j_citem" data-uid="10" data-username="秋刀鱼223">
    <a href="" class="photo"><img src="${comment.user.headImgUrl}"></a>
    <a href="" class="user">${comment.user.nickname}</a>
    <a href="" class="level">LV.${comment.user.level}</a>
    <a href="#textarea" class="_j_reply">回复</a>
    <span class="date">${comment.createTime?string('yyyy-MM-dd hh:mm:ss')}</span>
    <p>${comment.comment!}</p>
</li>
</#list>

<script>
    //留言里的回复按钮绑定事件
    $('._j_reply').on('click', function () {
        var oldMan = $(this).parent().find('.user').html();
        console.log(oldMan);
        console.log(11);
        $('#textarea').val("【回复 "+ oldMan +"】：");
    })
</script>

<#if page?? >
<#list page.content! as comment>
<li class="_j_citem" data-uid="${comment.fromId}" data-username="${comment.fromName}">
    <a href="/userCenter/homepage?uid=${comment.fromId}" class="photo"><img src="${comment.fromImg}"></a>
    <a href="" class="user">${comment.fromName}</a>
    <a href="" class="level">LV.${comment.fromLevel}</a>
    <a href="#" class="_j_reply">回复</a>
    <span class="date">${comment.date?datetime}</span>
    <#if comment.state==0>
        <p>${comment.content}</p>
    </#if>
    <#if comment.state==1>
        <p>回复<a href="/userCenter/homepage?uid=${comment.toId}">@${comment.toName}</a>:${comment.content}</p>
    </#if>
</li>
</#list>
</#if>