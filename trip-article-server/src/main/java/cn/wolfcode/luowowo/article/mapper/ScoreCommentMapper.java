package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ScoreComment;
import java.util.List;

public interface ScoreCommentMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(ScoreComment record);

    ScoreComment selectByPrimaryKey(Integer id);

    List<ScoreComment> selectAll();

    int updateByPrimaryKey(ScoreComment record);

}