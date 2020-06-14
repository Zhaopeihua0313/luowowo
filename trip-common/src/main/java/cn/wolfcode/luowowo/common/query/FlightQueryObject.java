package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FlightQueryObject extends QueryObject {

    /*private int pageSize = 10;*/
    private String flightNo;        //航班号
    private String tkTime;          //出发时间 起飞时间
    private String leavePort;       //出发机场
    private String arTime;          //到达时间 降落时间
    private String arrivePort;      //到达机场
    private String price;           //机票价格
    private String leaveCity;       //出发城市
    private String arriveCity;      //到达城市

}
