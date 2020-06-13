package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * domain 对应门票内容表
 */
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TicketContent extends BaseDomain {

    private Long id;    //对应门票id
    private String content; //内容

}