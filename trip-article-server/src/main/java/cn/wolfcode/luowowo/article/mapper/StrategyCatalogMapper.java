package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface StrategyCatalogMapper {

    int deleteByPrimaryKey(Long id);

    int insert(StrategyCatalog record);

    StrategyCatalog selectByPrimaryKey(Long id);

    List<StrategyCatalog> selectAll();

    int updateByPrimaryKey(StrategyCatalog record);

    /**
     * 高级查询
     */
    List<StrategyDetail> selectForList(QueryObject qo);

    /**
     * 获取 某目的地的攻略分类
     */
    List<StrategyCatalog> selectByDestId(Long id);

}