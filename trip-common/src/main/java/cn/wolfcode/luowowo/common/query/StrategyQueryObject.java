package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StrategyQueryObject extends QueryObject {

    Long destId = -1L;
    Long tagId = -1L;
}
