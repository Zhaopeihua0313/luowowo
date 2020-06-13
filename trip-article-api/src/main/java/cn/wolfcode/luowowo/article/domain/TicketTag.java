package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * domain 对应门票标签表
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TicketTag extends BaseDomain {

    private String name;    //标签名

}