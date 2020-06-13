package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Ticket;
import cn.wolfcode.luowowo.article.domain.TicketContent;
import cn.wolfcode.luowowo.article.mapper.TicketContentMapper;
import cn.wolfcode.luowowo.article.mapper.TicketMapper;
import cn.wolfcode.luowowo.article.mapper.TicketTagMapper;
import cn.wolfcode.luowowo.article.service.ITicketService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import java.util.List;

@Service
public class TicketServiceImpl implements ITicketService {

    @Autowired
    private TicketMapper ticketMapper;

    @Autowired
    private TicketContentMapper ticketContentMapper;

    @Autowired
    private TicketTagMapper ticketTagMapper;

    /**
     * 高级查询
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<Ticket> list = ticketMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 门票 带内容
     */
    public Ticket get(Long id) {
        Ticket ticket = ticketMapper.selectByPrimaryKey(id);
        return ticket;
    }

    public AjaxResult saveOrUpdate(Ticket ticket) {
        AjaxResult result = new AjaxResult();
        try {
            if (ticket.getId() == null) {
                ticketMapper.insert(ticket);
                //门票内容
                ticketContentMapper.insert(new TicketContent(ticket.getId(), ticket.getContent().getContent()));
                //维护门票标签关系
                String tagIds = ticket.getTagIds();
                if (StringUtils.hasText(tagIds)) {
                    String[] tagIdsArr = tagIds.replace("[", "").replace("]", "").split(",");
                    for (String tagId : tagIdsArr) {
                        ticketMapper.insertTagRelations(ticket.getId(), Long.valueOf(tagId));
                    }
                }
            } else {
                ticketMapper.updateByPrimaryKey(ticket);
                //门票内容
                ticketContentMapper.updateByTicketId(new TicketContent(ticket.getId(), ticket.getContent().getContent()));
                //维护门票标签关系，先删除，后增加
                ticketMapper.deleteTagRelationByTicketId(ticket.getId());
                String tagIds = ticket.getTagIds();
                if (StringUtils.hasText(tagIds)) {
                    String[] tagIdsArr = tagIds.replace("[", "").replace("]", "").split(",");
                    for (String tagId : tagIdsArr) {
                        ticketMapper.insertTagRelations(ticket.getId(), Long.valueOf(tagId));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 某标签的几张不同景点的最低价的门票
     */
    public List<Ticket> selectByTagCount(int tagId, int count) {
        return ticketMapper.selectByTagCount(tagId, count);
    }

    /**
     * 获取 一定数量的 每个景点里售价最低的门票
     */
    public List<Ticket> listScenicMixSalePriceCountByScenicCata(int count, Long scenicCataId) {
        return ticketMapper.listScenicMixSalePriceCountByScenicCata(count, scenicCataId);
    }

    /**
     * 该大景点(广州)的 所有子景点最便宜的门票
     */
    public List<Ticket> listScenicMixSalePriceCountByBigScenicId(int conut, Long scenicId) {
        return ticketMapper.listScenicMixSalePriceCountByBigScenicId(conut, scenicId);
    }

    /**
     * 获取 某景点(目标景点)下的某类别(儿童等)所有门票
     */
    public List<Ticket> listTheScenicByTicketCata(Long scenicId, Byte ticketCatalog) {
        return ticketMapper.listTheScenicByTicketCata(scenicId, ticketCatalog);
    }

    /**
     * 获取某大景点下受欢迎的子景点门票
     */
    public List<Ticket> listPopularScenic(Long scenicId) {
        return ticketMapper.listBestForScenic(scenicId, "visitnum");
    }

    /**
     * 获取某大景点下多人收藏的子景点门票
     */
    public List<Ticket> listFavorScenic(Long scenicId) {
        return ticketMapper.listBestForScenic(scenicId, "favornum");
    }

}
