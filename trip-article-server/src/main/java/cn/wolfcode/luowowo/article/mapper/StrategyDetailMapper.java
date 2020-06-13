package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface StrategyDetailMapper {

    int deleteByPrimaryKey(Long id);

    int insert(StrategyDetail record);

    StrategyDetail selectByPrimaryKey(Long id);

    List<StrategyDetail> selectAll();

    List<StrategyDetail> selectByCatalogId(Long catalogId);

    int updateByPrimaryKey(StrategyDetail record);

    /**
     * 高级查询
     */
    List<StrategyDetail> selectForList(QueryObject qo);

    /**
     * 删除 攻略与标签的关系
     */
    void deleteRelation(Long id);

    /**
     * 新增 攻略与标签的关系
     */
    void insertRelation(@Param("detailId") Long detailId, @Param("tagId") Long tagId);

    /**
     * 查询 某目的地点击量前三的文章攻略
     */
    List<StrategyDetail> selectByViewnumTop3AndDestId(Long id);

    /**
     * 修改 攻略文章状态
     */
    void updateStateById(@Param("id") Long id, @Param("state") Long state);

    /**
     * 修改 攻略的统计数据
     */
    void updateStats(StrategyDetail detail);

    StrategyDetail getStrategyContent(Long strategyId);

}