package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.QuestionContent;

/**
 * Created by huawei on 2019/11/24.
 */
public interface IQuestionContentService {
    /**
     * 根据问题id查问题内容
     * @param qid
     * @return
     */
    QuestionContent get(Long qid);

}
