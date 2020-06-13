package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;
import java.util.HashMap;
import java.util.Map;

@Setter
@Getter
public class TravelTime extends BaseDomain {

    private Long id;
    private String name;

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        return JSON.toJSONString(map);
    }

}