package cn.wolfcode.luowowo.article.repository;

import cn.wolfcode.luowowo.article.domain.Answer;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface AnswerMongoRepository extends MongoRepository<Answer, String> {

    //把某个问题的所有回答按照点赞数递减排序
    List<Answer> findByQuestionId(Long questionId, Sort thumbupNum);
    //该问题的金牌回答
    Answer findByQuestionIdAndGolden(Long id, boolean b);

}
