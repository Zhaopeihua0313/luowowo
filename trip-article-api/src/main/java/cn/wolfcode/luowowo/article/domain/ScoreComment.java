package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.Date;

/**
 * 积分留言表
 */
@Setter
@Getter
@NoArgsConstructor
public class ScoreComment extends BaseDomain {

    //private Long id;         //id
    private Long userId;     //用户id
    private UserInfo user;      //留言用户
    private Date createTime;    //评论日期
    private String comment;     //评论内容

}