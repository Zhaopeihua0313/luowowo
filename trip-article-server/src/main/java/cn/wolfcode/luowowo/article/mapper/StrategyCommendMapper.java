package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StrategyCommendMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyCommend record);

    StrategyCommend selectByPrimaryKey(Long id);

    List<StrategyCommend> selectAll();

    int updateByPrimaryKey(StrategyCommend record);

    /**
     * 高级查询
     */
    List<StrategyDetail> selectForList(QueryObject qo);

    /**
     * 获取 序号降序前几个的攻略推荐
     */
    List<StrategyCommend> selectListTopCount(int count);

    /**
     * 获取 最大的排序数
     */
    int getMaxSequence();

    /**
     * 修改 某攻略文章的攻略推荐状态
     */
    void updateStateByDetailId(@Param("detailId") Long detailId, @Param("state") Long state);
}