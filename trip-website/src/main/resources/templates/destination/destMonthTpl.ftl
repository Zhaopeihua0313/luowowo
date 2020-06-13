 <div class="month-list clearfix month-list-${timeId}" >
<div class="tiles">

    <#--显示上面三个-->
    <#list dests as d>
        <div class="item col3">
            <a href="/destination/guide?id=${(d.id)!}" target="_blank"><img
                    src="${(d.coverUrl)!}"
                    width="323" height="220">
                <div class="title">${(d.name)!}</div>
            </a>
        </div>
    </#list>
    <#--&lt;#&ndash;显示下面三个&ndash;&gt;-->
    <#list upDests as up>
        <div class="item col4">
            <a href="/destination/guide?id=${(up.id)!}"><img src="${(up.coverUrl)!}"
                    width="238" height="220">
                <div class="title">${(up.name)!}</div>
            </a>
        </div>

    </#list>
    <#--点击更多跳转到destFilter.html-->
    <div class="item col4">
        <a href="/destination/destFilter" ><img src="/aec379310a55b319f4cd79c14da98226cffc1749.png"
                width="238" height="220">
            <div class="title">更多</div>
        </a>
    </div>
</div>