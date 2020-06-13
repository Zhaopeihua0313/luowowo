package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Flight;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface FlightMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Flight record);

    Flight selectByPrimaryKey(Long id);

    List<Flight> selectAll();

    int updateByPrimaryKey(Flight record);

    List<Flight> selectList(@Param("orgCity") String orgCity, @Param("dstCity") String dstCity);

}