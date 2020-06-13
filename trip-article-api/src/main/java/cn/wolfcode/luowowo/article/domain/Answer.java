package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static sun.plugin.javascript.navig.JSType.Document;

@Setter
@Getter
@Document("answer")
public class Answer implements Serializable {

    @Id
    private String id;//回答id
    private Long questionId;//对应的问题id
    private String coverUrl;//回答的封面
    private String summary;//回答的摘要
    private Long authorId;//回答的用户id
    private String authorname; //评论者昵称
    private Integer level;  //评论者登记
    private String headUrl; //评论者头像
    private Date creatTime;//回答的时间
    private String content;//回答的内容
    private Boolean golden;//是否金牌回答
    private Integer thumbupNum;//回答的点赞数
    private Integer shareNum;//回答的分享数
    private List<Long> thumbuplist = new ArrayList<>(); //点赞用户集合

}