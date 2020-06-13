package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TravelQueryObject extends QueryObject {

    private int pageSize = 8;

    //游记状态
    private Integer state = -1;

    private Long destId = -1L;

    private Integer orderType = -1;
    private Integer travelTimeType = -1;
    private Integer perExpendType = -1;
    private Integer dayType = -1;

    //提供 getter 在 mapper 中调用，进行翻译
    public String getOrderBy() {
        return orderType == 1 ? "t.releaseTime desc" : "t.viewnum desc";
    }
    public TravelCondition getTravelTime() {
        return TravelCondition.TRAVEL_TIME.get(travelTimeType);
    }
    public TravelCondition getPerExpend() {
        return TravelCondition.TRAVEL_PER_EXPEND.get(perExpendType);
    }
    public TravelCondition getDay() {
        return TravelCondition.TRAVEL_DAYS.get(dayType);
    }


    

}
