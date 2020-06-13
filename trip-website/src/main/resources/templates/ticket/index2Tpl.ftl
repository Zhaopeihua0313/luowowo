<#list tickets as ticket>
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

