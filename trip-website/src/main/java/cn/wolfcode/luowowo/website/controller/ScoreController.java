package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.box.ScoreBox;
import cn.wolfcode.luowowo.article.domain.ScoreComment;
import cn.wolfcode.luowowo.article.domain.ScoreProduct;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.service.IScenicStatsCacheService;
import cn.wolfcode.luowowo.comment.service.IScenicCommentService;
import cn.wolfcode.luowowo.common.query.ScoreHistoryQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.OrderBox;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * 积分与积分商城
 */
@Controller
public class ScoreController {

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

    @Reference
    private IScoreHistoryService scoreHistoryService;

    @Reference
    private IScoreProductService scoreProductService;

    @Reference
    private IScoreCommentService scoreCommentService;

    /**
     * 处理 门票下单请求
     *//*
    @RequestMapping("score/createOrder")
    @ResponseBody
    public AjaxResult createOrder(Model model, @LoginUser UserInfo userInfo, OrderBox orderBox){
        return orderDetailService.createOrder(orderBox);
    }*/

    /**
     * 处理 用户留言 积分商城首页
     */
    @RequiredLogin
    @RequestMapping("score/putComment")
    @ResponseBody
    public AjaxResult putComment(Model model, @LoginUser UserInfo userInfo, ScoreComment scoreComment) {
        scoreComment.setCreateTime(new Date());
        scoreComment.setUser(userInfo);
        scoreComment.setUserId(userInfo.getId());
        return scoreCommentService.saveOrUpdate(scoreComment);
    }

    /**
     * 显示 积分商城首页页面
     * @param scoreBox 容器 可以用作存取查询得到的用户积分的数据等等
     */
    @RequiredLogin
    @RequestMapping("score/shop")
    public String shop(Model model, @LoginUser UserInfo userInfo, ScoreBox scoreBox, @ModelAttribute("qo") ScoreHistoryQueryObject qo){
        //获取当前用户的积分信息
        //获取用户的总积分
        Integer totalScore = scoreHistoryService.getTotalScoreByUserId(userInfo.getId());
        scoreBox.setTotalScore(totalScore);
        scoreBox.setUser(userInfo);
        model.addAttribute("scoreBox", scoreBox);
        //获取当前用户的购买了的积分商品
        return "scoreShop/list";
    }

    /**
     * 显示 积分商品列表 积分商城页面的内嵌页
     * @param scoreBox 容器 可以用作存取查询得到的用户积分的数据等等
     */
    @RequiredLogin
    @RequestMapping("score/productList")
    public String productList(Model model, @LoginUser UserInfo userInfo, ScoreBox scoreBox, @ModelAttribute("qo") ScoreHistoryQueryObject qo){
        //获取积分商品数据
        List<ScoreProduct> products = scoreProductService.listAll();
        //打乱
        Collections.shuffle(products);
        model.addAttribute("products", products);
        return "scoreShop/itemTempl";
    }

    /**
     * 显示 我的积分商品列表 积分商城页面的内嵌页
     * @param scoreBox 容器 可以用作存取查询得到的用户积分的数据等等
     */
    @RequiredLogin
    @RequestMapping("score/myProps")
    public String myProps(Model model, @LoginUser UserInfo userInfo, ScoreBox scoreBox, @ModelAttribute("qo") ScoreHistoryQueryObject qo){
        //获取用户自己的积分商品数据
        List<ScoreProduct> products = scoreProductService.listByUserId(userInfo.getId());
        model.addAttribute("products", products);
        return "scoreShop/myItemTempl";
    }

    /**
     * 显示 积分商城留言列表页 积分商城页面的内嵌页
     * @param scoreBox 容器 可以用作存取查询得到的用户积分的数据等等
     */
    @RequiredLogin
    @RequestMapping("score/cmtList")
    public String cmtList(Model model, @LoginUser UserInfo userInfo, ScoreBox scoreBox, @ModelAttribute("qo") ScoreHistoryQueryObject qo){
        //获取积分商城留言数据
        List<ScoreComment> cmts = scoreCommentService.listAll();
        Collections.reverse(cmts);
        model.addAttribute("cmts", cmts);
        return "scoreShop/commentTempl";
    }

    /**
     * 处理 积分商城购买商品的支付成功请求
     */
    @RequestMapping("score/buyScoreProduct")
    @ResponseBody
    public AjaxResult buyScoreProduct(Model model, @LoginUser UserInfo userInfo, OrderBox orderBox){
        return orderDetailService.buyScoreProduct(orderBox);
    }

}
