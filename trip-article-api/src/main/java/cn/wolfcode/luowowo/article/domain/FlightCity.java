package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FlightCity extends BaseDomain {

    public static final Integer STATE_HOT = 1;      //热门
    public static final Integer STATE_NORMAL = 0;   //普通

    public static final int NUM_ABCDE = 1;
    public static final int NUM_FGHJ = 2;
    public static final int NUM_KLMNP = 3;
    public static final int NUM_QRSTW = 4;
    public static final int NUM_XYZ = 5;

    private String cityName; //出发城市
    private String cityCode; //城市的三字码
    private Integer hot = STATE_HOT; //热门城市
    private Integer num; //以26个字母开头的城市

}