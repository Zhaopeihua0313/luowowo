package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 攻略的评论内容 存在 mongoDB 中 strategy_comment 里
 */
@Setter@Getter
@Document("strategy_comment")
public class StrategyComment implements Serializable {
    @Id // _id
    private String id;  //评论id

    private Long detailId; //攻略id

    private String detailTitle; //攻略标题

    private Long userId; //评论者 id

    private String username; //评论者昵称

    private Integer level;  //评论者登记

    private String headUrl; //评论者头像

    private Date createTime;    //评论创建时间

    private String content; //评论内容

    private Integer thumbupnum = 0; //点赞数

    private List<Long> thumbuplist = new ArrayList<>(); //点赞用户集合

}
