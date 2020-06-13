<div class="hot-list clearfix hot-list-${regionId!}" >
<div class="col">
    <#list leftDests as d>
        <dl>
            <dt><a href="/destination/guide?id=${d.id}" target="_blank">${d.name}</a></dt>
            <dd>
                <#list d.children as sub>
                    <#if sub_index lt 10>
                        <a href="/destination/guide?id=${sub.id}" target="_blank">${sub.name}</a>
                    </#if>
                </#list>
            </dd>
        </dl>
    </#list>
        <#--<dl>
            <dt><a href="/destination/guide?id=" target="_blank">左XXX</a></dt>
            <dd>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
            </dd>
        </dl>
        <dl>
            <dt><a href="/destination/guide?id=" target="_blank">xxxxx</a></dt>
            <dd>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
            </dd>
        </dl>
        <dl>
            <dt><a href="/destination/guide?id=" target="_blank">xxxxx</a></dt>
            <dd>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
            </dd>
        </dl>-->
</div>

<div class="col" style="margin-left: 50px">
    <#list rightDests as d>
        <dl>
            <dt><a href="/destination/guide?id=${d.id}" target="_blank">${d.name}</a></dt>
            <dd>
                <#list d.children as sub>
                    <#if sub_index lt 10>
                        <a href="/destination/guide?id=${sub.id}" target="_blank">${sub.name}</a>
                    </#if>
                </#list>
            </dd>
        </dl>
    </#list>
        <#--<dl>
            <dt><a href="/destination/guide?id=" target="_blank">右XXX</a></dt>
            <dd>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
            </dd>
        </dl>
        <dl>
            <dt><a href="/destination/guide?id=" target="_blank">xxxxx</a></dt>
            <dd>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
                <a href="/destination/guide?id=" target="_blank">11111</a>
            </dd>
        </dl>-->
</div>
</div>