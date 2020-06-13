package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.common.query.DestQueryObject;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IDestinationService {

    /**
     * 高级查询 连表父目的地、区域
     */
    public PageInfo query(QueryObject qo);

    /**
     * 查询 目的地面包屑导航的数据
     */
    List<Destination> getToasts(Long parentId);

    /**
     * 修改 目的地热门状态
     */
    AjaxResult changeHotState(Long id, Long hot);

    /**
     * 编辑 目的地简介
     */
    AjaxResult setInfo(Long id, String info);

    /**
     * 查询 所有的目的地
     */
    List<Destination> list();

    /**
     * 获取 某区域的目的地
     */
    List listDestByRegionId(Long rid);

    /**
     * 查询 某目的地信息
     */
    Destination selectById(Long id);

    /**
     * 查询 目的地面包屑导航的数据，带目的地的子高点击量的目的地
     */
    List<Destination> getToastsAndChilds(Long id);

    /**
     * 获取该目的地的国家
     */
    Destination getCountry(Long destId);

    /**
     * 获取该目的地的省份
     */
    Destination getProvince(Long destId);

    /**
     * 获取 某父目的地下的所有子目的地
     */
    List<Destination> listDestsByParentId(Long id);

    Destination selectByScenicId(Long scenicId);

    List<Destination> listByIdIn(String[] ids);

    List<Destination> listByIdInJiangQi(String[] ids);

    List<Destination> listCityInland();

    List<Destination> listDestByTimeId(Long timeId);

    /**
     * 查询国家和地区
     */
    List<Destination> listDestByRId(Long regionId);

    /**
     * 新增目的地
     */
    void save(Destination dest);

    PageInfo queryForResult(DestQueryObject qo);

    List<Destination> listBrothers(Long destId);

}
