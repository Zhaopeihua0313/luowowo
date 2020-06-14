package cn.wolfcode.luowowo.common.util;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单容器 用于控制器接收和传输
 */
@Getter
@Setter
@NoArgsConstructor
public class OrderBox implements Serializable {

    //普通订单数据
    private Long orderCreateUserId;
    private Long orderProductId;
    private String orderProductName;
    private Long orderProductCount;
    private String orderProductType;
    private String orderUserName;
    private String orderUserPhone;
    private String orderUserCardNumber;
    private BigDecimal orderRealPrice;

    //积分商品数据
    private int productScore = 0;

}
