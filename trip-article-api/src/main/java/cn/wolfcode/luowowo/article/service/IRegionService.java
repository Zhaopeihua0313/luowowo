package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IRegionService {

    /**
     * 高级查询
     */
    public PageInfo query(QueryObject qo);

    /**
     * 编辑或者新增 区域
     */
    AjaxResult saveOrUpdate(Region region);

    /**
     * 查询 热门的区域
     */
    List<Region> listHotRegions();

    /**
     * 获取 某个区域的热门目的地
     */
    List<Destination> listHotDestByRegionId(Long regionId);

    Region get(long id);

    /**
     * 查询所有区域
     */
    List<Region> listAll();

}
