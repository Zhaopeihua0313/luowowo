package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DestinationQueryObject extends QueryObject {

    //上级目的地
    private Long parentId;
    //是否热门
    private Integer hot = -1;
    private Long destId = -1L;
    private  Long catalogId = -1L;
    private int pageSize = 10;

}
