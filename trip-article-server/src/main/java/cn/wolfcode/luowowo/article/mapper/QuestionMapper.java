package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Question;
import java.util.List;

public interface QuestionMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Question record);

    Question selectByPrimaryKey(Long id);

    List<Question> selectAll();

    int updateByPrimaryKey(Question record);

}
