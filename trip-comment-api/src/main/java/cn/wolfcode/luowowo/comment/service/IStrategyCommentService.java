package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.query.StrategyCommentQueryObject;
import org.springframework.data.domain.Page;

public interface IStrategyCommentService {

    /**
     * 保存 攻略评论
     */
    void save(StrategyComment comment);

    /**
     * 分页查询 攻略评论
     */
    Page query(StrategyCommentQueryObject qo);

    /**
     * 操作 点赞攻略评论
     */
    void commentThumbUp(String commentId, Long userId);

}
