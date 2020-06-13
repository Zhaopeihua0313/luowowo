package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.QuestionContent;
import cn.wolfcode.luowowo.article.mapper.QuestionContentMapper;
import cn.wolfcode.luowowo.article.service.IQuestionContentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class QuestionContentServiceImpl implements IQuestionContentService {

    @Autowired
    private QuestionContentMapper questionContentMapper;

    public QuestionContent get(Long qid) {
        return questionContentMapper.selectByPrimaryKey(qid);
    }

}
