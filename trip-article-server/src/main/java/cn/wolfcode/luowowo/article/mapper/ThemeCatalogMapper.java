package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ThemeCatalog;
import java.util.List;

public interface ThemeCatalogMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ThemeCatalog record);

    ThemeCatalog selectByPrimaryKey(Long id);

    List<ThemeCatalog> selectAll();

    int updateByPrimaryKey(ThemeCatalog record);

}