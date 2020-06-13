package cn.wolfcode.luowowo.comment.query;

import cn.wolfcode.luowowo.common.query.QueryObject;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StrategyCommentQueryObject extends QueryObject {
    private Long detailId = -1L;    //攻略文章id
}
