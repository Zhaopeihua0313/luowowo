package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.FlightCity;
import cn.wolfcode.luowowo.article.mapper.FlightCityMapper;
import cn.wolfcode.luowowo.article.service.IFlightCityService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class FlightCityServiceImpl implements IFlightCityService {
    @Autowired
    private FlightCityMapper flightCityMapper;

    public List<FlightCity> listHotFlights(Integer hot) {
        return flightCityMapper.selectHotFlights(hot);
    }

    public List<FlightCity> listInitial(Integer num) {
        return flightCityMapper.selectInitial(num);
    }
}

