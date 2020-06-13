package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ScoreProduct;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface ScoreProductMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ScoreProduct record);

    ScoreProduct selectByPrimaryKey(Long id);

    List<ScoreProduct> selectAll();

    int updateByPrimaryKey(ScoreProduct record);

    List<ScoreProduct> listByUserId(@Param("userId") Long userId);

}