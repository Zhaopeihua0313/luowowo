package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.TicketTag;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface ITicketTagService {

    /**
     * 获取 所有标签
     */
    List<TicketTag> listAll();

    /**
     * 获取 某门票的所有标签id
     */
    Long[] selectIdsByTicketId(Long id);

    /**
     * 高级查询
     */
    PageInfo query(QueryObject qo);

    AjaxResult updateById(TicketTag tag);

}
