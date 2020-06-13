package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

/**
 * 用户积分历史表
 */
@Getter
@Setter
@NoArgsConstructor
public class ScoreHistory  extends BaseDomain {

    //private Long id;            //id

    private Long userId;        //用户id
    private UserInfo user;      //用户

    private Long score;         //积分

    private String type;        //积分类型
    public static final String TYPE_TICKET_PAID = "ticked_paid";            //支付门票 +200
    public static final String TYPE_FLIGHT_PAID = "flight_paid";            //支付机票 +400
    public static final String TYPE_SCORE_PAID = "score_paid";              //支付积分商品 +100
    public static final String TYPE_HOTEL_PAID = "hotel_paid";              //支付酒店下单 +300
    public static final String TYPE_DAY_CHECK = "day_check";                //每日签到 +100

    private String msg;         //积分的使用信息说明

    private Date dayTime;       //积分变化时间


}