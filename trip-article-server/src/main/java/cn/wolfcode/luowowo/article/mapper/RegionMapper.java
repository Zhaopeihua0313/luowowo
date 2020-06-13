package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface RegionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Region record);

    Region selectByPrimaryKey(Long id);

    List<Region> selectAll();

    int updateByPrimaryKey(Region record);

    /**
     * 高级查询
     */
    List<Region> selectForList(QueryObject qo);

    /**
     * 获取 热门的启用的区域
     */
    List<Region> selectListByHot();
}