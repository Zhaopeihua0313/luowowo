package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.template.ThemeTemplate;
import cn.wolfcode.luowowo.search.vo.StatsResult;

import java.util.List;

public interface IThemeSearchService {

    /**
     * 查询 根据条件查询返回查询结果
     * @param condition 条件代号：如主题，旅游月份
     */
    List<StatsResult> listCondition(int condition);


    void save(ThemeTemplate template);
}
