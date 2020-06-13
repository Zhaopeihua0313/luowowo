package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.Setter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class Question extends BaseDomain{
    public static final Integer STATE_DISPLAY = 0;//发布
    public static final Integer STATE_UNDISPLAY = 1;//下架

    private String title;//问题标题
    private Date creatTime;//问题创建时间
    private UserInfo author;//提出问题的用户
    private Integer viewNum = 0;//阅读数
    private Integer answerNum = 0;//该问题的回答数
    private QuestionContent travelContent;//注意这是该问题的内容,不是游记内容
    private Integer focusMemberNum = 0;//被关注数
    private List<Answer> answers = new ArrayList<>();//该问题的所有回答
    private Integer state = STATE_DISPLAY;//发布状态
    private Integer shareNum = 0;//共享数
    private Destination dest;//问题关联的目的地

    public String getStateName(){
        return state == STATE_DISPLAY ? "发布" : "下架";
    }

}