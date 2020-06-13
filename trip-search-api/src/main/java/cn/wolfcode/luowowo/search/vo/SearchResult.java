package cn.wolfcode.luowowo.search.vo;

import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/**
 * ES 搜索的 模糊查询 查询结果容器 目的地、游记、攻略、用户
 */
@Setter@Getter
public class SearchResult implements Serializable {
    private Integer total = 0;                                          //四者查询结果集的总数

    private List<DestinationTemplate> dests = Collections.EMPTY_LIST;   //目的地
    private List<TravelTemplate> travels = Collections.EMPTY_LIST;      //游记
    private List<StrategyTemplate> strategys = Collections.EMPTY_LIST;  //攻略
    private List<UserInfoTemplate> users = Collections.EMPTY_LIST;      //用户
}
