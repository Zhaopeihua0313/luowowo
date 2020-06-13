package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Hotel;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IHotelService {

    /**
     * 高级查询
     */
    public PageInfo query(QueryObject qo);

    List<Hotel> listByTagId(Long tagId);

    List<Hotel> listByDestId(Long destId);

}
