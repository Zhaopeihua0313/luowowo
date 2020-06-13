<#--商品1-->
<#list products as product>
<#if product_index < 9>
<li class="_j_goods_li" style="margin-right: 25px;">
    <div class="info" style="height: 310px">
        <a href="javascript:;" >
            <img src="${(product.coverUrl)!}" style="height: 254px;"
                 alt="${(product.name)!}">
            <div class="name" style="width: 100%;height: 33px;">
                ${(product.name)!}
                <span id="${(product.id)!}_total">剩余${(product.totalNum)!}</span>
            </div>
            <i class="state1" style="width: 48px;
                background-position: -264px -41px;
                height: 48px;"></i>
        </a>
    </div>
    <div class="buy">
        <span><i class="icon_gold"></i>${(product.score)!}</span>
        <a class="btn_buy" >购买
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

<script>
    $(function () {
        //购买按钮点击事件
        $('.btn_buy').on('click', function () {
            var productId = $(this).find('.orderCreateUserId').html();  //id
            var total = $(this).find('.totalNum').html();
            var productScore = $(this).find('.productScore').html();
            var orderProductName = $(this).find('.orderProductName').html();
            //封装订单数据
            var dataJson = {
                productScore:productScore,
                orderCreateUserId:productId,
                orderProductId:$(this).find('.orderProductId').html(),
                orderProductName:orderProductName,
                orderProductCount:$(this).find('.orderProductCount').html(),
                orderProductType:$(this).find('.orderProductType').html(),
                orderUserName:$(this).find('.orderUserName').html(),
                orderUserPhone:$(this).find('.orderUserPhone').html(),
                orderUserCardNumber:$(this).find('.orderUserCardNumber').html(),
                orderRealPrice:$(this).find('.orderRealPrice').html()
            };
            //购买积分商品异步请求
            $.get('/score/buyScoreProduct', dataJson, function (data) {
                if (data.success) {
                    //购买成功
                    dialogCommon("恭喜你获得了 "+orderProductName, 1000);
                    //商品数量减一
                    total = total - 1;
                    $('#'+ productId +'_total').html(total);
                } else {
                    dialogCommon(data.msg, null, "no");
                }
            })


        })
    })
</script>
