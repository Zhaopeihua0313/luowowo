package cn.wolfcode.luowowo.cache.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 回答 统计数据对象 用作存放 redis 中回答统计数据的容器
 */
@Setter
@Getter
@ToString
public class AnswerStats implements Serializable {

    private Long questionId;//该回答的问题id
    private Long authorId;//该回答的作者id
    private String userName;//提问者昵称
    private String headImgUrl;//提问者头像
    private Integer level;//提问者等级
    private String answerId;//该回答的id
    private Integer sharenum = 0;       //分享数
    private Integer thumbsupnum = 0;    //点赞数
    private Boolean golden;//是否金牌回答
//  private List<Long> thumbuplist = new ArrayList<>(); //点赞用户集合

}
