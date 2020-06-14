package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Document("scenic_comment_reply")
public class ScenicCommentReply implements Serializable{

    @Id
    private String id; //评论id
    private String parentId; //父评论id
    private Long userId; //用户id
    private String headUrl; //用户头像
    private String username; //用户昵称
    private Date createTime; //评论时间
    private String content; //评论内容
    private Long uid = -1L; //被回复的用户id
    private String uname; //被回复的用户name

}
