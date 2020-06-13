package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Ticket;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TicketMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Ticket record);

    Ticket selectByPrimaryKey(Long id);

    List<Ticket> selectAll();

    int updateByPrimaryKey(Ticket record);

    List<Ticket> selectForList(QueryObject qo);

    void deleteTagRelationByTicketId(Long id);

    void insertTagRelations(@Param("ticketId") Long ticketId, @Param("tagId") Long tagId);

    /**
     * 获取 某标签的几张不同景点的最低价的门票
     */
    List<Ticket> selectByTagCount(@Param("tagId") int tagId, @Param("count") int count);

    /**
     * 获取 一定数量的 每个景点里售价最低的门票
     */
    List<Ticket> listScenicMixSalePriceCountByScenicCata(@Param("count") int count, @Param("scenicCataId") Long scenicCataId);

    /**
     * 该大景点(广州)的 所有子景点最便宜的门票
     */
    List<Ticket> listScenicMixSalePriceCountByBigScenicId(@Param("conut") int conut, @Param("scenicId") Long scenicId);

    /**
     * 获取 某景点(目标景点)下的某类别(儿童等)所有门票
     */
    List<Ticket> listTheScenicByTicketCata(@Param("scenicId") Long scenicId, @Param("ticketCatalog") Byte ticketCatalog);

    /**
     * 获取 某大景点下按某数据排行的最便宜门票
     */
    List<Ticket> listBestForScenic(@Param("scenicId") Long scenicId, @Param("orderByDesc") String orderByDesc);
}