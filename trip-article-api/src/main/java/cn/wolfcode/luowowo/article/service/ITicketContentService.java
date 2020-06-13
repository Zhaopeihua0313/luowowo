package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.TicketContent;

public interface ITicketContentService {

    /**
     * 获取 门票内容
     */
    TicketContent get(Long id);

}
