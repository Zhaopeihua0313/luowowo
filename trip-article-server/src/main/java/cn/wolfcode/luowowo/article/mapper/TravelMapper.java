package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface TravelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Travel record);

    Travel selectByPrimaryKey(Long id);

    List<Travel> selectAll();

    int updateByPrimaryKey(Travel record);

    /**
     * 高级查询
     */
    List<StrategyDetail> selectForList(QueryObject qo);

    void updateStateById(Travel travel);

    /**
     * 获取 点击量前三的游记
     */
    List<Travel> selectViewnumTop3(Long destId);

    /**
     * 修改 游记统计数据
     */
    void updateStats(Travel travel);


    List<Travel> selectTravelByUserId(Long userId);

    int selectTravelTotal(Long userId);

    Travel getStrategyContent(Long travelId);
}