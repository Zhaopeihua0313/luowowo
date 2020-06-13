package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.*;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.service.IScenicStatsCacheService;
import cn.wolfcode.luowowo.comment.service.IScenicCommentService;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TicketController {

    @Reference
    private IDestinationService destinationService;
    @Reference
    private ITicketService ticketService;
    @Reference
    private ITicketTagService ticketTagService;
    @Reference
    private ITicketContentService ticketContentService;
    @Reference
    private IScenicService scenicService;
    @Reference
    private IScenicCatalogService scenicCatalogService;
    @Reference
    private IScenicStatsCacheService scenicStatsCacheService;
    @Reference
    private IScenicContentService scenicContentService;
    @Reference
    private IScenicCommentService scenicCommentService;

    /*//支付页面
    @RequestMapping("ticket/pay")
    public String payOrder(OrderInfo order,Model model){
        model.addAttribute("order",order);
        return "ticket/payOrder";
    }*/


    /**
     * 显示 门票下单的订单页面
     * @param tid 门票的id
     */
    @RequestMapping("ticket/addOrder")
    public String order(Long tid, Model model, @LoginUser UserInfo userInfo){
        //查询门票信息
        Ticket ticketInfo= ticketService.get(tid);
        model.addAttribute("ticketInfo",ticketInfo);
        return "ticket/addOrder";
    }


    /**
     * 显示 景点的门票想起页
     * @param tid 该景点最售价便宜的门票id
     */
    @RequestMapping("ticket/detail")
    public String ticketInfo(Long tid, Model model, @LoginUser UserInfo user) {
        Ticket ticket = ticketService.get(tid);     //景点里售价最便宜的门票
        Long scenicId = ticket.getScenicId();       //该景点的id

        //原景点页数据
        Destination destination = destinationService.selectByScenicId(scenicId);
        model.addAttribute("dest", destination);                //景点的目的地
        //scenic -- 景点信息
        Scenic scenic = scenicService.get(scenicId);                         //该景点数据
        ScenicContent content = scenicContentService.get(scenicId);
        scenic.setContent(content);
        model.addAttribute("scenic", scenic);                   //渲染景点
        //children -- 内部景点列表
        model.addAttribute("children", scenicService.listByParentId(scenicId));
        //是否已去过,已收藏
        boolean isFavor = user != null && scenicStatsCacheService.isFavor(scenicId, user.getId());
        boolean isVisit = user != null && scenicStatsCacheService.isFavor(scenicId, user.getId());
        model.addAttribute("isFavor", isFavor);
        model.addAttribute("isVisit", isVisit);
        model.addAttribute("vo", scenicCommentService.getSumData(scenicId));
        //景点相册
        String photos = scenic.getPhotos();
        String[] photosArr = photos.split(",");
        model.addAttribute("photosArr", photosArr);

        //该景点的最便宜的门票
        model.addAttribute("mixTicket", ticket);
        //该景点的门票S：分类成人票等
        List<Ticket> adultTickets = ticketService.listTheScenicByTicketCata(scenicId, Ticket.CATA_ADULT_TICKET);
        List<Ticket> childTickets = ticketService.listTheScenicByTicketCata(scenicId, Ticket.CATA_CHILD_TICKET);
        List<Ticket> elderlyTickets = ticketService.listTheScenicByTicketCata(scenicId, Ticket.CATA_ELDERLY_TICKET);
        List<Ticket> generalTickets = ticketService.listTheScenicByTicketCata(scenicId, Ticket.CATA_GENERAL_TICKET);
        List<Ticket> allTickets = ticketService.listTheScenicByTicketCata(scenicId, null);
        if(adultTickets.size() > 0) model.addAttribute("adultTickets", adultTickets);
        if(childTickets.size() > 0) model.addAttribute("childTickets", childTickets);
        if(elderlyTickets.size() > 0) model.addAttribute("elderlyTickets", elderlyTickets);
        if(generalTickets.size() > 0) model.addAttribute("generalTickets", generalTickets);
        if(adultTickets.size() > 0) model.addAttribute("allTickets", allTickets);

        //获取某大景点下受欢迎的子景点门票
        List<Ticket> popularTickets = ticketService.listPopularScenic(scenic.getParent().getId());
        model.addAttribute("popularTickets", popularTickets);
        List<Ticket> favorTickets = ticketService.listFavorScenic(scenic.getParent().getId());
        //favorTickets = favorTickets.subList(0, 10);
        model.addAttribute("favorTickets", favorTickets);

        //相关景点推荐
        //该大景点(广州)的 所有子景点最便宜的门票(********)
        List<Ticket> aboutTickets = ticketService.listScenicMixSalePriceCountByBigScenicId(5, scenic.getParent().getId());
        model.addAttribute("aboutTickets", aboutTickets);

        return "ticket/detail";
    }


    /**
     * 显示 门票主页内嵌页 鼠标经过景点分类时，渲染的景点分类的对应下的景点的门票
     *
     * @param scenicId 顶级景点的id
     */
    @RequestMapping("ticket/reloadProd")
    public String theme(Long scenicId, Long scenicCataId, Model model) {
        if (scenicCataId == 0) {
            //该大景点(广州)的 所有子景点最便宜的门票(********)
            List<Ticket> tickets = ticketService.listScenicMixSalePriceCountByBigScenicId(8, scenicId);
            model.addAttribute("tickets", tickets);
        } else {
            //对应分类里的所有景点 景点对应着的价格最低的门票
            List<Ticket> tickets = ticketService.listScenicMixSalePriceCountByScenicCata(8, scenicCataId);
            model.addAttribute("tickets", tickets);
        }

        return "ticket/index2Tpl";
    }

    /**
     * 显示 门票主页内嵌页 鼠标经过景点时，渲染的景点分类及门票
     *
     * @param scenicId 顶级景点的id
     */
    @RequestMapping("ticket/reloadSubAndProd")
    public String dest(Long scenicId, Model model) {
        //该景点的所有分类
        List<ScenicCatalog> catalogs = scenicCatalogService.listByScenicId(scenicId);
        model.addAttribute("catalogs", catalogs);

        //第一个分类里的所有景点 景点对应着的价格最低的门票
        //List<Ticket> tickets = ticketService.listScenicMixSalePriceCountByScenicCata(8, catalogs.get(0).getId);
        //该大景点(广州)的 所有子景点最便宜的门票(********)
        List<Ticket> tickets = ticketService.listScenicMixSalePriceCountByBigScenicId(8, scenicId);
        model.addAttribute("tickets", tickets);

        return "ticket/indexTpl";
    }

    /**
     * 显示 门票主页
     */
    @RequestMapping("/ticket")
    public String index(Long destId, Model model) {
        //打响周末4门票，标签id6，连景点取景点封面
        List<Ticket> weekTickets = ticketService.selectByTagCount(6, 4);
        model.addAttribute("weekTickets", weekTickets);

        //顶级景点 scenic
        List<Scenic> scenics = scenicService.listNoParentCount(8);
        model.addAttribute("scenics", scenics);

        if (scenics != null) {
            Long firstScenicId = scenics.get(0).getId();
            //该景点的所有分类
            List<ScenicCatalog> catalogs = scenicCatalogService.listByScenicId(firstScenicId);
            model.addAttribute("catalogs", catalogs);

            //第一个分类里的所有景点 景点对应着的价格最低的门票
            //List<Ticket> tickets = ticketService.listScenicMixSalePriceCountByScenicCata(8, catalogs.get(0).getId());
            //model.addAttribute("tickets", tickets);

            //该大景点(广州)的 所有子景点最便宜的门票(********)
            List<Ticket> tickets = ticketService.listScenicMixSalePriceCountByBigScenicId(8, firstScenicId);
            model.addAttribute("tickets", tickets);
        }

        return "ticket/index";
    }

}
