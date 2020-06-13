<#list ranklist! as user>
    <#if user_index < 3>
    <li class="r-top r-top${user_index+1} clearfix">
        <em class="num">${user_index+1}</em>
        <div class="user no_qid">
            <a class="avatar" href="javascript:;" target="_blank" rel="nofollow"><img
                    src="${(user.user.headImgUrl!)}" style="width: 100%"></a>
            <span class="name"><a href="javascript:;" target="_blank"
                                  rel="nofollow">${(user.user.nickname!)}</a></span>
            <span class="level"><a href="javascript:;" target="_blank"
                                   rel="nofollow">Lv${(user.user.level!)}</a></span>
        </div>
        <#if rank == 0>
            <span class="num">${(user.goldenNum!)}</span>
        </#if>
        <#if rank == 1>
            <span class="num">${(user.answersNum!)}</span>
        </#if>
        <#if rank == 2>
            <span class="num">${(user.thumbsupnum!)}</span>
        </#if>
    </li>
    <#else>
    <li class="clearfix">
        <em class="num">${user_index+1}</em>
        <div class="user no_qid">
            <a class="avatar" href="javascript:;" target="_blank" rel="nofollow"><img
                    src="${(user.user.headImgUrl!)}" style="width: 100%"></a>
            <span class="name"><a href="javascript:;" target="_blank"
                                  rel="nofollow">${(user.user.nickname!)}</a></span>
            <span class="level"><a href="javascript:;" target="_blank"
                                   rel="nofollow">Lv${(user.user.level!)}</a></span>
        </div>
        <#if rank == 0>
            <span class="num">${(user.goldenNum!)}</span>
        </#if>
        <#if rank == 1>
            <span class="num">${(user.answersNum!)}</span>
        </#if>
        <#if rank == 2>
            <span class="num">${(user.thumbsupnum!)}</span>
        </#if>
    </li>
    </#if>
</#list>

