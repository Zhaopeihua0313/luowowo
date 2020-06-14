package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HotelQueryObject extends QueryObject {

    private Long destId = -1L;
    private Integer tagId = -1;
    private Integer type = -1;
    private Integer level = -1;
    private int ordertype = -1;

    public String getOrderBy() {
        if (ordertype == 1) {
            return "h.salePrice";
        }
        if (ordertype == 2) {
            return "h.salePrice desc";
        }
        return null;
    }

}
