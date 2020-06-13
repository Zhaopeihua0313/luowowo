package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.DestTheme;
import java.util.List;

public interface DestThemeMapper {

    int deleteByPrimaryKey(Long id);

    int insert(DestTheme record);

    DestTheme selectByPrimaryKey(Long id);

    List<DestTheme> selectAll();

    int updateByPrimaryKey(DestTheme record);

    List<DestTheme> selectByDestId(Long destId);

}