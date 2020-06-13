package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.common.query.DestQueryObject;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DestinationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Destination record);

    Destination selectByPrimaryKey(Long id);

    List<Destination> selectAll();

    int updateByPrimaryKey(Destination record);

    /**
     * 高级查询
     */
    List<Destination> selectForList(QueryObject qo);

    /**
     * 修改 目的地热门状态
     */
    void updateHotById(@Param("id") Long id, @Param("hot") Long hot);

    /**
     * 修改 目的地简介
     */
    void updateInfoById(@Param("id") Long id, @Param("info") String info);

    /**
     * 获取 某区域的目的地
     */
    List<Destination> selectListByRegionId(@Param("rid") Long rid);

    /**
     * 获取 某区域的 热门 目的地
     */
    List<Destination> selectListHotByRegionId(@Param("regionId") Long regionId);

    /**
     * 获取 某目的地下的子目的地
     */
    List<Destination> selectByParentId(@Param("parentId") Long parentId);

    /**
     * 获取 某目的地
     */
    Destination selectById(@Param("id") Long id);

    /**
     * 获取 某目的地和其子目的地，查询面包屑导航的数据，带目的地的子高点击量的目的地
     */
    Destination selectByIdAndChilds(@Param("id") Long id);

    /**
     * 修改 某目的地的区域 id 为空
     */
    void deleteRegionIdByRegionId(Long id);

    /**
     * 修改 某目的地的区域 id
     */
    void updateRegionIdById(@Param("regionId") Long regionId, @Param("destId") Long destId);

    Destination selectByScenicId(Long scenicId);

    List<Destination> listByIdIn(String[] ids);

    List<Destination> listByIdInJiangQi(String[] ids);

    List<Destination> selectByTimeId(Long timeId);

    List<Destination> selectDestByRegionId(Long regionId);

    List<Destination> selectForResult(DestQueryObject qo);

}