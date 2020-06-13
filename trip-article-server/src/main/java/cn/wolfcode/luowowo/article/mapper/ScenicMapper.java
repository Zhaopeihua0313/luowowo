package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Scenic;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface ScenicMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Scenic record);

    Scenic selectByPrimaryKey(Long id);

    List<Scenic> selectAll();

    int updateByPrimaryKey(Scenic record);

    List<Scenic> selectForList(QueryObject qo);

    List<Scenic> listReplyTOP5(Long scenicId);

    List<Scenic> listFavorTOP10(Long scenicId);

    List<Scenic> listByParentId(Long parentId);

    /**
     * 获取 没有父景点的几个景点
     */
    List<Scenic> listNoParentCount(int count);

    Scenic getByDeatId(Long destId);

    void updateStats(Scenic scenic);

    Scenic getScenicContent(Long scenicId);

}