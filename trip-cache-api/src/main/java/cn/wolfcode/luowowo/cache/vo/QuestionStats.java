package cn.wolfcode.luowowo.cache.vo;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.article.domain.QuestionContent;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 回答 统计数据对象 用作存放 redis 中回答统计数据的容器
 */
@Setter@Getter@ToString
public class QuestionStats implements Serializable {

    private Long userId;//提问者id

    private String userName;//提问者昵称

    private String headImgUrl;//提问者头像

    private Integer level;//提问者等级


    private Long questionId;//问题id


    private Integer viewNum = 0;//阅读数

    private Integer answerNum = 0;//该问题的回答数

    private Integer focusMemberNum = 0;//被关注数

    private Integer shareNum = 0;//共享数
}
