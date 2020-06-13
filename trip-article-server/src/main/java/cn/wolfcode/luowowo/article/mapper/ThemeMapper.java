package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Theme;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface ThemeMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Theme record);

    Theme selectByPrimaryKey(Long id);

    List<Theme> selectAll();

    int updateByPrimaryKey(Theme record);

    List<Theme> selectByCatalogId(Long catalogId);

    List<Theme> selectForList(QueryObject qo);

}