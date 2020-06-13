package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.HotelTag;
import cn.wolfcode.luowowo.article.mapper.HotelTagMapper;
import cn.wolfcode.luowowo.article.service.IHotelTagService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class HotelTagServiceImpl implements IHotelTagService {
    @Autowired
    private HotelTagMapper hotelTagMapper;

    public List<HotelTag> list() {
        return hotelTagMapper.selectAll();
    }
}
