package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

/**
 * 游记的评论内容 存在 mongoDB 中 travel_comment 里
 */
@Getter@Setter
@Document("travel_comment")
public class TravelComment implements Serializable {
    public static final Integer TRAVEL_NOMAL_TYPE = 0; //普通评论
    public static final Integer TRAVEL_COMMENT_TYPE = 1; //回复评论

    @Id
    private String id;

    private Long travelId;

    private String travelTitle;

    private Long userId;

    private String username;

    private Integer level;

    private String headUrl;

    private String city;

    private Integer type = TRAVEL_NOMAL_TYPE;   //0普通评论 1回复评论

    private Date createTime;

    private String content;

    private TravelComment refComment;   // type=1 回复评论时，就记录是哪一个评论的评论
}
