package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Hotel;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HotelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Hotel record);

    Hotel selectByPrimaryKey(Long id);

    List<Hotel> selectAll();

    int updateByPrimaryKey(Hotel record);

    List<Hotel> selectForList(QueryObject qo);

    List<Hotel> listByTagId(@Param("tagId") Long tagId);

    List<Hotel> listByDestId(@Param("destId") Long destId);

}