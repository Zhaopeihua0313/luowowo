package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Ticket;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface ITicketService {

    /**
     * 高级查询 连表用户,景点分类
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 门票 带内容
     */
    Ticket get(Long id);

    AjaxResult saveOrUpdate(Ticket ticket);

    /**
     * 获取 某标签的几张不同景点的最低价的门票
     */
    List<Ticket> selectByTagCount(int tagId, int count);

    /**
     * 获取 一定数量的 每个景点里售价最低的门票
     */
    List<Ticket> listScenicMixSalePriceCountByScenicCata(int count, Long scenicCataId);

    /**
     * 该大景点(广州)的 所有子景点最便宜的门票
     */
    List<Ticket> listScenicMixSalePriceCountByBigScenicId(int conut, Long scenicId);

    /**
     * 获取 某景点(目标景点)下的某类别(儿童等)所有门票
     */
    List<Ticket> listTheScenicByTicketCata(Long scenicId, Byte ticketCatalog);

    /**
     * 获取某大景点下受欢迎的子景点门票
     */
    List<Ticket> listPopularScenic(Long scenicId);

    /**
     * 获取某大景点下多人收藏的子景点门票
     */
    List<Ticket> listFavorScenic(Long scenicId);

}
