package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.ScenicComment;
import cn.wolfcode.luowowo.comment.vo.SumResult;
import cn.wolfcode.luowowo.common.query.ScenicCommentQueryObject;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IScenicCommentService {

    /**
     * 新增一条评论
     */
    void save(ScenicComment comment);

    /**
     * 根据条件查询评论
     * @param qo
     * @return
     */
    Page<ScenicComment> query(ScenicCommentQueryObject qo);

    /**
     * 查询当前景点的评论统计数据
     * @param scenicId
     * @return
     */
    SumResult getSumData(Long scenicId);

    /**
     * 给评论点赞
     * @param commentId
     * @return
     */
    void thumbup(String commentId, Long userId);

    List<ScenicComment> findByUserId(Long userId);
}
