package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ScoreHistory;
import org.apache.ibatis.annotations.Param;
import java.util.Date;
import java.util.List;

public interface ScoreHistoryMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ScoreHistory record);

    ScoreHistory selectByPrimaryKey(Long id);

    List<ScoreHistory> selectAll();

    int updateByPrimaryKey(ScoreHistory record);

    /**
     * 获取 某个用户在 某个时间段 某种积分类型的 几条积分历史
     * @param userId 用户id
     * @param starDate 开始时间
     * @param endDate 结束时间
     * @param type 积分类型
     * @param count 查多少数量
     * @return
     */
    List<ScoreHistory> selectBetweenDateByUserIdAndTypeCount(
            @Param("userId") Long userId, @Param("starDate") Date starDate, @Param("endDate") Date endDate,
            @Param("type") String type, @Param("count") Long count);

    /**
     * 获取 某用户的积分总数
     */
    Integer getTotalScoreByUserId(Long userId);

}