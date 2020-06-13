package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ScoreComment;
import cn.wolfcode.luowowo.article.mapper.ScoreCommentMapper;
import cn.wolfcode.luowowo.article.service.IScoreCommentService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ScoreCommentServiceImpl implements IScoreCommentService {

    @Autowired
    private ScoreCommentMapper scoreCommentMapper;

    /**
     * 高级查询 ,积分留言
     */
    public PageInfo query(QueryObject qo) {
        return null;
    }

    /**
     * 获取 某积分留言
     */
    public ScoreComment get(Long id) {
        return null;
    }

    /**
     * 新增或修改 积分留言
     */
    public AjaxResult saveOrUpdate(ScoreComment scoreComment) {
        AjaxResult result = new AjaxResult();
        try {

            if (scoreComment.getId() == null) {
                scoreCommentMapper.insert(scoreComment);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 所有的留言
     */
    public List<ScoreComment> listAll() {
        return scoreCommentMapper.selectAll();
    }

}
