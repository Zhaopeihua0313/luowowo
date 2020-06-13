package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Flight;
import cn.wolfcode.luowowo.article.mapper.FlightMapper;
import cn.wolfcode.luowowo.article.service.IFlightService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class FlightServiceImpl implements IFlightService {

    @Autowired
    private FlightMapper flightMapper;

    public List<Flight> list(String orgCity, String dstCity) {
        return flightMapper.selectList(orgCity, dstCity);
    }

}
