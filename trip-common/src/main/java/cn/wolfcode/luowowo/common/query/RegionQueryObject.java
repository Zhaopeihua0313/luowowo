package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RegionQueryObject extends QueryObject {

    //上级目的地
    private Long parentId;

    //是否热门
    private Integer hot = -1;

}
