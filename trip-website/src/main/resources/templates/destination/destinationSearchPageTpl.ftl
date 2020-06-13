
<ul class="clearfix">
    <#list pageInfo.list as dest>
        <li class="item">
            <div class="img">
                <a href="/destination/guide?id=${(dest.id)!}" target="_blank">
                    <img height="200" width="320" src="${(dest.coverUrl)!}" style="display: inline;">
                    <div class="title">${(dest.name)!}</div>
                </a>
            </div>
            <div class="info">
                <p class="detail">${(dest.info)!}</p>
                <#--该目的地下的三篇阅读数最大的攻略-->
                <#--<div class="hot">-->
                    <#--<span class="label">TOP3</span>-->
                    <#--<#if dest.strategys??>-->
                    <#--<#list dest.strategys as strategy>-->
                        <#--<a href="/strategy/detail?id=${(strategy.id)!}" target="_blank">${(strategy.subTitle)!}</a>-->
                        <#--<span class="divide"></span>-->
                    <#--</#list>-->
                    <#--</#if>-->
                <#--</div>-->

                <#--该目的地下的一篇阅读数最大的游记-->
             <#--<#if dest.travel??>-->
                <#--<#list dest.travel as travel>-->
                <#--<div class="line"><a href="/travel/detail?id=${(travel.id)!}" target="_blank"><em>1</em>${(travel.title)!}</a></div>-->
                <#--</#list>-->
             <#--</#if>-->
             </div>
        </li>
    </#list>
    <#--分页-->

</ul>
<#include "../common/page.ftl"/>


