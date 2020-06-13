package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.TicketContent;
import cn.wolfcode.luowowo.article.mapper.TicketContentMapper;
import cn.wolfcode.luowowo.article.service.ITicketContentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class TicketContentServiceImpl implements ITicketContentService {

    @Autowired
    private TicketContentMapper ticketContentMapper;

    /**
     * 获取 门票内容
     */
    public TicketContent get(Long id) {
        return ticketContentMapper.getById(id);
    }

}
