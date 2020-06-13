package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ScenicCatalog extends BaseDomain{

    //分类名
    private String name;
    //目的地id
    private Long destId;
    //关联目的地
    private Destination dest;
    //景点
    private List<Scenic> scenics = new ArrayList<>();

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        map.put("destId", destId);
        map.put("dest", dest);
        return JSON.toJSONString(map);
    }

}