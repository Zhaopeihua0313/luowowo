package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.vo.StatsResult;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Map;

public interface IStrategySearchService {

    /**
     * 保存
     */
    void save(StrategyTemplate template);

    /**
     * 查询 根据条件查询返回查询结果
     * @param condition 条件代号：如国外攻略、国内攻略、主题攻略
     */
    List<StatsResult> listCondition(int condition);

    /**
     * 高级查询 攻略
     */
    Page query(SearchQueryObject qo);

    /**
     * 获取 序号降序前几个 攻略主题推荐
     */
    List<Map<String, Object>> listThemeCommendTopCount(int count);

    /**
     * 获取 某些目的地的攻略
     */
    List<StrategyTemplate> findByDestName(String destName);
}
