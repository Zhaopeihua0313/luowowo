package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.TravelTime;
import java.util.List;

public interface TravelTimeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TravelTime record);

    TravelTime selectByPrimaryKey(Long id);

    List<TravelTime> selectAll();

    int updateByPrimaryKey(TravelTime record);
}