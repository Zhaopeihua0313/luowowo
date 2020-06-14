package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DestQueryObject extends QueryObject {

    private Long timeId;
    private Long themeId;
    private Integer dayType = -1;
    //提供 getter 在 mapper 中调用，进行翻译
    public TravelCondition getDay() {
        return TravelCondition.TRAVEL_DAYS.get(dayType);
    }

}
