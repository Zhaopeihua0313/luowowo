package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.QuestionContent;
import java.util.List;

public interface QuestionContentMapper {

    int insert(QuestionContent record);

    List<QuestionContent> selectAll();

    QuestionContent selectByPrimaryKey(Long qid);

}