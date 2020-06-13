package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.ScoreComment;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IScoreCommentService {

    /**
     * 高级查询 ,积分留言
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某积分留言
     */
    ScoreComment get(Long id);

    /**
     * 新增或修改 积分留言
     */
    AjaxResult saveOrUpdate(ScoreComment scoreComment);

    /**
     * 获取 所有的留言
     */
    List<ScoreComment> listAll();

}
