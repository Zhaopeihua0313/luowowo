package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TravelCommendMapper {

    int deleteByPrimaryKey(Long id);

    int insert(TravelCommend record);

    TravelCommend selectByPrimaryKey(Long id);

    List<TravelCommend> selectAll();

    int updateByPrimaryKey(TravelCommend record);

    /**
     * 高级查询
     */
    List<StrategyDetail> selectForList(QueryObject qo);

    /**
     * 获取 最大排序数
     */
    int getMaxSequence();

    /**
     * 修改 某游记 id 的游记推荐的状态
     */
    void updateStateByTravelId(@Param("state") Integer state, @Param("travelId") Long travelId);

    /**
     * 获取 序号降序排序的前几个游记推荐
     */
    List<TravelCommend> selectListTopCount(@Param("count") int count);

}