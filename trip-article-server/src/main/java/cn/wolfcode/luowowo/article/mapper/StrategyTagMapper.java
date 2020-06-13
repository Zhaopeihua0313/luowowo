package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface StrategyTagMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyTag record);

    StrategyTag selectByPrimaryKey(Long id);

    List<StrategyTag> selectAll();

    int updateByPrimaryKey(StrategyTag record);

    List<StrategyDetail> selectForList(QueryObject qo);

    /**
     * 获取 某攻略的所有标签，并且以 tag1,tag2,tag3 字符串返回
     */
    String selectStrByStrategyId(Long id);

    /**
     * 获取 某名字的攻略标签
     */
    StrategyTag selectByName(String tagName);

    /**
     * 获取 某目的地的所有攻略标签
     */
    List<StrategyTag> selectListByDestId(Long destId);
}