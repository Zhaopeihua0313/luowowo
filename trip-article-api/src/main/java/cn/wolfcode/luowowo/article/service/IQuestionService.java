package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Question;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IQuestionService {

    /**
     * 查所有问题及其金牌回答,用在社区首页显示
     * @return
     */
    List<Question> listAll();

    /**
     * 根据问题id查问题详情
     * @param qid
     * @return
     */
    Question get(Long qid);

    AjaxResult save(Question question);

    void update(Question question);

}
