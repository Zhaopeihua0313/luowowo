package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.service.IScenicStatsCacheService;
import cn.wolfcode.luowowo.comment.service.IScenicCommentService;
import cn.wolfcode.luowowo.common.query.FlightQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.OrderBox;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {

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
    @Reference
    private IOrderDetailService orderDetailService;


    /**
     * 处理 门票下单请求
     */
    @RequestMapping("order/createOrder")
    @ResponseBody
    public AjaxResult createOrder(Model model, @LoginUser UserInfo userInfo, OrderBox orderBox){
        return orderDetailService.createOrder(orderBox);
    }

    /**
     * 显示 航班下单页面
     * @FlightQueryObject 容器 可以用作存取查询得到的航班的数据等等
     */
    @RequestMapping("order/flight")
    public String flight(Model model, @LoginUser UserInfo userInfo,
                         OrderBox orderBox, FlightQueryObject flightQueryObject){

        //渲染查询得到的航班数据
        model.addAttribute("flightInfo", flightQueryObject);

        return "flight/addOrder";
    }


}
