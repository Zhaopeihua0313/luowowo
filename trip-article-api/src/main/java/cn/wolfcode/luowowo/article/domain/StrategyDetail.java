package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;

@Setter
@Getter
public class StrategyDetail extends BaseDomain {

    public static final Integer STATE_DISPLAY = 0;      //发布
    public static final Integer STATE_UNDISPLAY = 1;    //下架

    private String title;
    private String subTitle;
    private String summary;
    private String coverUrl;
    private Date createTime;
    private Integer viewnum = 0;
    private Integer replynum = 0;
    private Integer favornum = 0;
    private Integer sharenum = 0;
    private Integer thumbsupnum = 0;
    private Integer state = STATE_DISPLAY;
    private Destination dest;
    private StrategyTheme theme;
    private StrategyCatalog catalog;
    private StrategyContent strategyContent;
    private StrategyCommend strategyCommend;

    public String getStateName() {
        return state == STATE_DISPLAY ? "发布" : "下架";
    }

}