package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ScenicContent;
import java.util.List;

public interface ScenicContentMapper {
    int insert(ScenicContent record);

    List<ScenicContent> selectAll();

    ScenicContent get(Long scenicId);

    void updateById(ScenicContent content);

}