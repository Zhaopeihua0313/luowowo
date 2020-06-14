package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Document("scenic_comment")
public class ScenicComment implements Serializable {

    @Id
    private String id; //评论id
    private String parentId; //父评论
    private Long scenicId; //景点id
    private String scenicName; //景点名称
    private String scenicImg; //景点封面
    private Long userId; //用户id
    private String username; //用户昵称
    private Integer level; //用户等级
    private String headUrl; //用户头像
    private Date createTime; //评论时间
    private String content; //评论内容
    private Integer overallScore = 0; //整体评价分数
    private Integer viewScore = 0; //风光分数
    private Integer uniqueScore = 0; //特色分数
    private Integer serviceScore = 0; //服务分数
    private Integer thumbupnum = 0; //点赞数量
    private List<Long> thumbuplist = new ArrayList<>(); //点赞集合ids
    private List<ScenicCommentReply> refComment = new ArrayList<>(); //子评论
    private String[] pics = new String[]{}; //组成数组

}
