package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Hotel extends BaseDomain {

    public static final Integer HOTEL_LEVEL_NORMAL = 1; //平价
    public static final Integer HOTEL_LEVEL_MIDDLE = 2; //中等
    public static final Integer HOTEL_LEVEL_HIGH = 3;   //高端
    public static final Integer HOTEL_LEVEL_LUXURY = 4; //奢华
    public static final Integer HOTEL_TYPE_RESORT = 1; //度假村
    public static final Integer HOTEL_TYPE_CHAIN = 2;  //连锁
    public static final Integer HOTEL_TYPE_APARTMENT = 3; //公寓
    public static final Integer HOTEL_TYPE_HOMESTAY = 4; //民宿
    //名称
    private String name;
    //英文名称
    private String engname;
    //封面
    private String coverUrl;
    //链接
    private String url;
    //所属目的地
    private Destination dest;
    //特价
    private int salePrice;
    //价格
    private int price;
    //评分
    private Double score;
    //地址
    private String adress;
    //简介
    private String intro;
    //分类
    private HotelTag tag;
    //等级
    private Integer level;
    //类型
    private Integer type;

    public String getTypeName(){
        String msg = "度假村";
        switch (type){
            case 2: msg = "连锁";break;
            case 3: msg = "公寓";break;
            case 4: msg = "民宿";break;
        }
        return msg;
    }
    public String getLevelName(){
        String msg = "平价";
        switch (level){
            case 2: msg = "中等";break;
            case 3: msg = "高端";break;
            case 4: msg = "奢华";break;
        }
        return msg;
    }
}