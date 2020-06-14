package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderDetailQueryObject extends QueryObject {

    private int pageSize = 10;
    public String status = "all";          //订单状态
    public static final String STATUS_ORDERED = "ordered";          //已下单
    public static final String STATUS_PAIDED = "paided";            //已支付
    public static final String STATUS_CANCELLED = "cancelled";      //已取消
    public static final String STATUS_PAYFAILED = "payfailed";      //支付失败
    public static final String STATUS_REFUNDED = "refunded";        //已退款
    public static final String STATUS_CANCELING = "canceling";      //取消中

}
