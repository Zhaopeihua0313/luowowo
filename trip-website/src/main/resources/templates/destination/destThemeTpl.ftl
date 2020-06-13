<div class="theme-list clearfix theme-list-${catalogId}" >
<div class="tiles">
    <#list themes as t>
        <div class="item col4">
            <a href="/destination/destFilter?id=${(t.id)!}" target="_blank"><img
                    src="${(t.coverUrl)!}"
                    width="238" height="220">
                <div class="title">${(t.name)!}</div>
            </a>
        </div>
    </#list>

</div>