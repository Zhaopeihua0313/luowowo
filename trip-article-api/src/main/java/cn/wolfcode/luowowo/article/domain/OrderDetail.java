package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 订单表
 */
@Setter
@Getter
@NoArgsConstructor
public class OrderDetail extends BaseDomain {

    //private Long id;                //id

    private Long createUserId;      //下单用户ID
    private UserInfo createUser;    //下单用户

    private Long userUserId;        //订单使用用户信息id
    private OrderUserDetail userUser;//订单使用用户信息

    private Date createTime;        //下单时间
    private Date lastUpdateTime;        //下单时间

    private String status;          //订单状态
    public static final String STATUS_ORDERED = "ordered";          //已下单
    public static final String STATUS_PAIDED = "paided";            //已支付
    public static final String STATUS_CANCELLED = "cancelled";      //已取消
    public static final String STATUS_PAYFAILED = "payfailed";      //支付失败
    public static final String STATUS_REFUNDED = "refunded";        //已退款
    public static final String STATUS_CANCELING = "canceling";      //取消中

    private BigDecimal totalPrice;  //商品总价

    private BigDecimal pullPrice;   //优惠价格

    private BigDecimal realPrice;   //真实价格

    private List<OrderProduct> products; //订单的产品们

    //status 翻译
    public String getStatusName() {
        String name = "已下单";
        if (status.equals(STATUS_ORDERED)) {
            name = "已下单";
        } else if (status.equals(STATUS_PAIDED)) {
            name = "已支付";
        } else if (status.equals(STATUS_CANCELLED)) {
            name = "已取消";
        } else if (status.equals(STATUS_PAYFAILED)) {
            name = "支付失败";
        } else if (status.equals(STATUS_REFUNDED)) {
            name = "已退款";
        } else if (status.equals(STATUS_CANCELING)) {
            name = "取消中";
        }
        return name;
    }

}