package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.HotelTag;
import java.util.List;

public interface HotelTagMapper {

    int deleteByPrimaryKey(Long id);

    int insert(HotelTag record);

    HotelTag selectByPrimaryKey(Long id);

    List<HotelTag> selectAll();

    int updateByPrimaryKey(HotelTag record);

}