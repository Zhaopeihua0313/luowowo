package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Ticket;
import cn.wolfcode.luowowo.article.domain.TicketTag;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface TicketTagMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TicketTag record);

    TicketTag selectByPrimaryKey(Integer id);

    List<TicketTag> selectAll();

    int updateByPrimaryKey(TicketTag record);

    /**
     * 获取 某门票的所有标签id
     */
    Long[] selectIdsByTicketId(Long id);

    /**
     * 获取 某门票的所有标签
     */
    List<Ticket> selectByTicketId(Long ticketId);

    List<Ticket> selectForList(QueryObject qo);

}