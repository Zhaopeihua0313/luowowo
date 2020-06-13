package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Setter@Getter
public class Theme extends BaseDomain {
    public static final Integer STATE_NORMAL = 0;   //正常
    public static final Integer STATE_DISABLE = 1;  //禁用

    private Long id;

    private String name;

    private Integer state;

    private ThemeCatalog themecatalog;

    private String coverUrl;

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        map.put("state", state);
        map.put("themecatalog", themecatalog);
        map.put("coverUrl", coverUrl);
        return JSON.toJSONString(map);
    }

    public String getStateName() {
        String msg = "正常";
        if (state == STATE_DISABLE) {
            msg = "禁用";
        }
        return msg;
    }
}