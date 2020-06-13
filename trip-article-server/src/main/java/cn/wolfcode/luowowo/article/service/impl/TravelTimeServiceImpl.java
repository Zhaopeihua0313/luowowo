package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.TravelTime;
import cn.wolfcode.luowowo.article.mapper.TravelTimeMapper;
import cn.wolfcode.luowowo.article.service.ITravelTimeService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class TravelTimeServiceImpl implements ITravelTimeService {

    @Autowired
    private TravelTimeMapper travelTimeMapper;

    public List<TravelTime> listAll() {
        return travelTimeMapper.selectAll();
    }

}
