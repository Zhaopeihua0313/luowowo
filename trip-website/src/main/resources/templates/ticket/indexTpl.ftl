<ul class="recommend_tab_l">
    <li class="active subject_js" data="0">所有分类<i class="ticket_icon"></i></li>
    <#--景点分类-->
    <#list catalogs! as t>
        <#if t_index==0>
            <li class=" subject_js" data="${t.id!}">${t.name!}<i class="ticket_icon"></i></li>
        <#else >
            <li class=" subject_js" data="${t.id!}">${t.name!}<i class="ticket_icon"></i></li>
        </#if>
    </#list>
</ul>
<!--&-->
<ul class="promotion_list clearfix" style="display: block;margin: 0px;">
<#--门票对应地区主题的景点门票信息-->
    <#if tickets??>

        <#list tickets as ticket>
        <#--推荐门票-->
            <li>
                <a href="/ticket/detail?tid=${ticket.id}" target="_blank" onclick="cmcTag('门票频道页-PC-站点-P4-景点推荐-广州主题乐园-001-广州塔','PC门票频道页景点推荐');">
                    <div class="promotion_img_box">
                        <img src="${(ticket.scenic.coverUrl)!}" width="222" height="150" alt="">
                    </div>
                    <div class="promotion_footer">
                        <h5 title="${(ticket.scenic.name)!}">${(ticket.scenic.name)!}</h5>
                        <span class="promotion_comment_b">${(ticket.scenic.visitnum)!} 人去过</span>
                        <p><span>¥<dfn>${(ticket.salePrice)!}</dfn></span><samp>起</samp></p>
                    </div>
                </a>
            </li>
        </#list>
    </#if>
</ul>
