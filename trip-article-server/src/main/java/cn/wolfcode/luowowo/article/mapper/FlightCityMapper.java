package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.FlightCity;
import java.util.List;

public interface FlightCityMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(FlightCity record);

    FlightCity selectByPrimaryKey(Integer id);

    List<FlightCity> selectAll();

    int updateByPrimaryKey(FlightCity record);

    /**
     * 查询热门城市
     * @param hot
     * @return
     */
    List<FlightCity> selectHotFlights(Integer hot);

    /**
     * 查询以字母A开头的城市
     * @param num
     * @return
     */
    List<FlightCity> selectInitial(Integer num);

}