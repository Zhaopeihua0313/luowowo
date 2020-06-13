package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.TicketContent;
import java.util.List;

public interface TicketContentMapper {

    int insert(TicketContent record);

    List<TicketContent> selectAll();

    TicketContent getById(Long id);

    void updateByTicketId(TicketContent content);

}