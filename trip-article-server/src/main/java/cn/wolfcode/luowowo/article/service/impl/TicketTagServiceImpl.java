package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Ticket;
import cn.wolfcode.luowowo.article.domain.TicketTag;
import cn.wolfcode.luowowo.article.mapper.TicketTagMapper;
import cn.wolfcode.luowowo.article.service.ITicketTagService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TicketTagServiceImpl implements ITicketTagService {

    @Autowired
    private TicketTagMapper ticketTagMapper;

    /**
     * 获取 所有标签
     */
    public List<TicketTag> listAll() {
        return ticketTagMapper.selectAll();
    }

    /**
     * 获取 某门票的所有标签id
     */
    public Long[] selectIdsByTicketId(Long id) {
        return ticketTagMapper.selectIdsByTicketId(id);
    }

    /**
     * 高级查询
     */
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<Ticket> list = ticketTagMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    public AjaxResult updateById(TicketTag tag) {
        AjaxResult result = new AjaxResult();
        try {

            if (tag.getId() == null) {
                ticketTagMapper.insert(tag);
            } else {
                ticketTagMapper.updateByPrimaryKey(tag);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

}
