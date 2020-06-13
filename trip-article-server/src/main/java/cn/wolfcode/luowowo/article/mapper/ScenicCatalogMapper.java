package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ScenicCatalog;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface ScenicCatalogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ScenicCatalog record);

    ScenicCatalog selectByPrimaryKey(Long id);

    List<ScenicCatalog> selectAll();

    int updateByPrimaryKey(ScenicCatalog record);

    List<ScenicCatalog> selectForList(QueryObject qo);

    List<ScenicCatalog> listByDestId(Long destId);

    /**
     * 获取 某景点的所有分类
     */
    List<ScenicCatalog> listByScenicId(Long scenicId);
}