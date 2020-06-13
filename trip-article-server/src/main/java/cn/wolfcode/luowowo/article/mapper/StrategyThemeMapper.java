package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface StrategyThemeMapper {

    int deleteByPrimaryKey(Long id);

    int insert(StrategyTheme record);

    StrategyTheme selectByPrimaryKey(Long id);

    List<StrategyTheme> selectAll();

    int updateByPrimaryKey(StrategyTheme record);

    /**
     * 高级查询
     */
    List<StrategyDetail> selectForList(QueryObject qo);

    /**
     * 根据主题分类id查询主题
     * @param CatalogId 主题分类id
     * @return
     */
    List<StrategyDetail> selectByCatalogId(Long CatalogId);

}