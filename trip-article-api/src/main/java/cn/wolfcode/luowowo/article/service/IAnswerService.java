package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import java.util.List;

public interface IAnswerService {

    /**
     * 根据问题id获取该问题的金牌回答
     * @param questionId
     * @return
     */
    Answer getGoldenOne(Long questionId,String goldenId);

    /**
     * 获取除金牌回答外的所有回答,并按时间逆序
     * @return
     */
    List<Answer> listOthers(Long id);

    /**
     * 保存回答
     * @return
     */
    AjaxResult save(Answer answer);

    /**
     * 更新回答点赞数
     * @param answerId
     * @param i
     */
    void updateThumbup(String answerId, int i);

    /**
     * 查所有回答
     * @return
     */
    List<Answer> listAll();

    Answer get(String answerId);

}
