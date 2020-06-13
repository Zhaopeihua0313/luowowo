package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Hotel;
import cn.wolfcode.luowowo.article.mapper.HotelMapper;
import cn.wolfcode.luowowo.article.service.IHotelService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class HotelServiceImpl implements IHotelService {

    @Autowired
    private HotelMapper hotelMapper;

    /**
     * 高级查询
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize(),qo.getOrderBy());
        List<Hotel> list = hotelMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    public List<Hotel> listByTagId(Long tagId) {
        return hotelMapper.listByTagId(tagId);
    }

    public List<Hotel> listByDestId(Long destId) {
        return hotelMapper.listByDestId(destId);
    }


}
