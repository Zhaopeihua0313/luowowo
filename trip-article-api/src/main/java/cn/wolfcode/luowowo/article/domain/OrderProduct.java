package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * 订单产品表
 */
@Setter
@Getter
@NoArgsConstructor
public class OrderProduct  extends BaseDomain {

    //private Long id;                    //id

    private Long orderId;               //订单id

    private String productName;         //订单产品名

    private Long productId;             //产品id

    private String productType;         //产品类型
    public static final String PRODTYPE_TICKET = "ticket";      //门票
    public static final String PRODTYPE_FIGHT = "flight";        //机票
    public static final String PRODTYPE_SCORE = "score";        //积分商品
    public static final String PRODTYPE_TOTAL = "total";        //酒店

    private BigDecimal productPrice;    //产品价格

    private Long productCount;          //产品数量


    //catalog翻译
    public String getProductTypeName() {
        String name = "门票";
        if (productType.equals(PRODTYPE_TICKET)) {
            name = "门票";
        } else if (productType.equals(PRODTYPE_FIGHT)) {
            name = "机票";
        } else if (productType.equals(PRODTYPE_SCORE)) {
            name = "积分商品";
        } else if (productType.equals(PRODTYPE_TOTAL)) {
            name = "酒店";
        }
        return name;
    }
}