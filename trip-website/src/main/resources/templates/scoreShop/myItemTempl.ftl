<#--商品1-->
<#list products as product>
    <#if product_index < 100>
    <li class="_j_goods_li" style="margin-right: 25px;">
        <div class="info" style="height: 310px">
            <a href="javascript:;" >
                <img src="${(product.coverUrl)!}" style="height: 254px;"
                     alt="${(product.name)!}">
                <div class="name" style="width: 100%;height: 33px;">
                ${(product.name)!}
                    <span id="${(product.id)!}_total">剩余${(product.totalNum)!}</span>
                </div>
                <i class="state1" style="width: 57px;
                background-position: -205px -5px;
                height: 75px;"></i>
            </a>
        </div>
        <div class="buy">
            <span><i class="icon_gold"></i>${(product.score)!}</span>
            <a class="btn_buy" style="background-color: thistle;">已拥有
                <span style="display: none">
                <span class="orderCreateUserId">${userInfo.id}</span>
                <span class="productScore">${product.score}</span>
                <span class="totalNum">${product.totalNum}</span>
                <span class="orderProductId">${product.id}</span>
                <span class="orderProductName">${product.name}</span>
                <span class="orderProductCount">1</span>
                <span class="orderProductType">score</span>
                <span class="orderUserName">${userInfo.nickname}</span>
                <span class="orderUserPhone">${userInfo.phone}</span>
                <span class="orderUserCardNumber">440902199902082013</span>
                <span class="orderRealPrice">0</span>
            </span>
            </a>
        </div>
    </li>
    </#if>
</#list>