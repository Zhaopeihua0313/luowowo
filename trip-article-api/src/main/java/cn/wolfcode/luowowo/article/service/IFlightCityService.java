package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.FlightCity;

import java.util.List;

public interface IFlightCityService {
    /**
     * 根据国内热门查询热门城市
     *
     * @param stateHot
     * @return
     */
    List<FlightCity> listHotFlights(Integer hot);

    /**
     * 查询以字母开头的城市
     * @param numAbcde
     * @return
     */
    List<FlightCity> listInitial(Integer num);
}
