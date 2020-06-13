package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.common.util.ChinesePinyinUtil;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Setter
@Getter
public class Destination extends BaseDomain {
    public static final Integer STATE_HOT = 1;      //热门
    public static final Integer STATE_NORMAL = 0;   //普通

    private String name;

    private Integer hot = STATE_NORMAL;

    private String coverUrl;

    private String info;

    private Integer deep;

    private Destination parent;

    private Theme destTheme;  //主题

    private TravelTime timeName;  //旅游时间

    private Integer days;  //游玩天数

    private String enName;  //英文名称

    private Region region;

    private List<Destination> children = new ArrayList<>();

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("info", info);
        return JSON.toJSONString(map);
    }

    public String getHotName() {
        return hot == STATE_HOT ? "热门" : "普通";
    }

    //返回名字第一个字母,并转为大写字母
    public String getWord(){return ChinesePinyinUtil.getPinYinHeadChar(name).substring(0,1).toUpperCase();}
}