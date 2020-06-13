package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.TravelComment;

import java.util.List;

public interface ITravelCommentService {

    /**
     * 保存 游记评论
     */
    TravelComment save(TravelComment comment);

    /**
     * 查询 某游记的所有评论
     */
    List<TravelComment> findByTravelId(Long travelId);

    /**
     * 查询 游记回复总数
     * @param userId
     * @return
     */
    int getReplyNumById(Long userId);

    /**
     * 查询 所有游记点评
     * @param userId
     * @return
     */
    List<TravelComment> findByUserId(Long userId);


}
