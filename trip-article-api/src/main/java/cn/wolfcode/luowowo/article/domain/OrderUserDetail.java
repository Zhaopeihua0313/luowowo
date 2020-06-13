package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 订单使用者表
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class OrderUserDetail extends BaseDomain {

    //private Long id;            //id

    private Long orderId;       //订单id

    private String name;        //使用者名

    private String phone;       //使用者手机

    private String userCard;    //使用者身份证


}