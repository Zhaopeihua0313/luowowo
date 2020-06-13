package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IStrategyCommendService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.IStrategyTagService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.query.StrategyCommentQueryObject;
import cn.wolfcode.luowowo.comment.service.IStrategyCommentService;
import cn.wolfcode.luowowo.common.query.StrategyQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.service.IStrategySearchService;
import cn.wolfcode.luowowo.search.vo.StatsResult;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/strategy")
public class StrategyController {

    @Reference
    private IStrategyTagService tagService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IStrategyDetailService detailService;
    @Reference
    private IStrategyCommentService commentService;
    @Reference
    private IStrategyStatsCacheService statsCacheService;
    @Reference
    private IStrategyCommendService strategyCommendService;
    @Reference
    private IStrategySearchService strategySearchService;

    /**
     * 处理 前台的分享按钮点击后，攻略的分享数+1
     */
    @RequestMapping("/share")
    @ResponseBody
    public AjaxResult share(Long strategyId, @LoginUser UserInfo user) {
        AjaxResult result = new AjaxResult();
        try {

            statsCacheService.incrbyNum(strategyId, 1, IStrategyStatsCacheService.STRATEGY_STATS_SHARENUM);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 处理 旅游攻略模块页 旅游攻略首页的内嵌页
     */
    @RequestMapping("/searchPage")
    public String searchPage(@ModelAttribute("qo") SearchQueryObject qo, Model model) {
        model.addAttribute("page", strategySearchService.query(qo));
        return "strategy/searchPageTpl";
    }

    /**
     * 显示 旅游攻略首页
     */
    @RequestMapping("")
    public String index(Model model) {
        //热数据-----
        //commends 攻略推荐前5个
        List<StrategyCommend> commends = strategyCommendService.listTopCount(5);
        model.addAttribute("commends", commends);
        //upCds 飙升排行榜前10个
        List<StrategyStats> upCds = statsCacheService.listRankTopCount(RedisKey.STRATEGY_STATS_UP_SORT, 10);
        model.addAttribute("upCds", upCds);
        //hotCds 热门排行榜前10个
        List<StrategyStats> hotCds = statsCacheService.listRankTopCount(RedisKey.STRATEGY_STATS_HOT_SORT, 10);
        model.addAttribute("hotCds", hotCds);

        //高级查询条件-----
        //abroads 海外攻略 查询海外的时候排除中国的数据
        List<StatsResult> abroads = strategySearchService.listCondition(SearchQueryObject.CONDITION_ABROAD);
        model.addAttribute("abroads", abroads);
        //unabroads 国内攻略
        model.addAttribute("unabroads", strategySearchService.listCondition(SearchQueryObject.CONDITION_UNABROAD));
        //themes 主题攻略
        model.addAttribute("themes", strategySearchService.listCondition(SearchQueryObject.CONDITION_THEME));

        // themeCds主题推荐
        model.addAttribute("themeCds", strategySearchService.listThemeCommendTopCount(10));

        return "strategy/index";
    }

    /**
     * 显示 某地旅游攻略概览页面
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo") StrategyQueryObject qo, Model model) {
        List<Destination> toasts = destinationService.getToasts(qo.getDestId());
        //toasts 吐司
        model.addAttribute("toasts", toasts);
        //dest 目的地
        model.addAttribute("dest", toasts.remove(toasts.size() - 1));
        //tags 标签
        model.addAttribute("tags", tagService.listByDestId(qo.getDestId()));
        //pageInfo 攻略集分页
        model.addAttribute("pageInfo", detailService.query(qo));
        return "strategy/list";
    }

    /**
     * 显示 某旅游攻略详情页
     */
    @RequestMapping("detail")
    public String detail(Long id, Model model, @LoginUser UserInfo userInfo) {
        //攻略文章数据
        StrategyDetail detail = detailService.get(id);
        detail.setStrategyContent(detailService.getContent(id));
        model.addAttribute("detail", detail);

        //每次访问,访问次数加1
        statsCacheService.incrbyNum(id, 1, IStrategyStatsCacheService.STRATEGY_STATS_VIEWNUM);
        //回显，从 redies 中获取攻略统计数据
        StrategyStats vo = statsCacheService.getStatsById(id);
        model.addAttribute("vo", vo);

        //访问后飙升榜数值要变化 +1
        statsCacheService.addInRand(RedisKey.STRATEGY_STATS_UP_SORT, 1, id);

        //登录用户的，给返回是否已收藏
        if (userInfo != null) {
            boolean flag = statsCacheService.isFavor(id, userInfo.getId());
            System.out.println("detail 攻略详情页，用户登录了，收藏了该攻略：" + flag);
            model.addAttribute("isFavor", flag);
        }

        return "strategy/detail";
    }

    /**
     * 显示 攻略评论模块 内嵌在攻略详情页里
     */
    @RequestMapping("/comment")
    public String comment(@ModelAttribute("/qo") StrategyCommentQueryObject qo, Model model) {
        model.addAttribute("page", commentService.query(qo));
        return "/strategy/commentTpl";
    }

    /**
     * 处理 评论攻略
     */
    @RequiredLogin
    @RequestMapping("/commentAdd")
    @ResponseBody
    public AjaxResult commentAdd(StrategyComment comment, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();

        //设置用户信息
        comment.setUserId(userInfo.getId());
        comment.setUsername(userInfo.getNickname());
        comment.setHeadUrl(userInfo.getHeadImgUrl());
        comment.setLevel(userInfo.getLevel());
        //保存操作
        commentService.save(comment);
        //更新统计数据缓存 评论数+1
        statsCacheService.incrbyNum(comment.getDetailId(), 1, IStrategyStatsCacheService.STRATEGY_STATS_REPLYNUM);
        //回显的数据
        result.setData(statsCacheService.getStatsById(comment.getDetailId()).getReplynum());

        //评论后飙升榜数值要变化 +1
        statsCacheService.addInRand(RedisKey.STRATEGY_STATS_UP_SORT, 1, comment.getDetailId());

        return result;
    }

    /**
     * 处理 点赞某攻略评论
     */
    @RequestMapping("/commentThumbUp")
    @ResponseBody
    @RequiredLogin
    public AjaxResult commentThumbUp(String commentId, Long userId) {
        AjaxResult result = new AjaxResult();
        commentService.commentThumbUp(commentId, userId);

        return result;
    }

    /**
     * 处理 收藏某攻略评论（已收藏就取消收藏）
     */
    @RequiredLogin
    @RequestMapping("/favor")
    @ResponseBody
    public AjaxResult favor(Long strategyId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();

        //进行收藏操作，用户没收藏就在攻略收藏者里添加该用户，并且收藏数+1，反之就是取消收藏操作，剔除并且收藏数-1，返回值 true为收藏 false为取消收藏
        boolean flag = statsCacheService.favor(strategyId, userInfo.getId());
        //用作前端判断是收藏操作还是取消收藏
        result.setSuccess(flag);

        //收藏后热门榜数值要变化
        if (flag) {
            statsCacheService.addInRand(RedisKey.STRATEGY_STATS_HOT_SORT, 1, strategyId);
        } else {
            statsCacheService.addInRand(RedisKey.STRATEGY_STATS_HOT_SORT, -1, strategyId);
        }

        //从 redies 中获取该攻略的统计数据
        StrategyStats vo = statsCacheService.getStatsById(strategyId);
        return result.addData(vo.getFavornum());
    }

    /**
     * 处理 顶(点赞)某攻略文章
     */
    @RequiredLogin
    @RequestMapping("/strategyThumbup")
    @ResponseBody
    public AjaxResult strategyThumbup(Long strategyId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();

        //进行顶(点赞)操作，用户没点赞就在攻略点赞者里添加该用户，并且点赞数+1，redis 缓存设有效期1天，有效期内无法再点赞
        result = statsCacheService.thumbup(strategyId, userInfo.getId());

        if (result.isSuccess()) {
            //点赞后热门榜数值要变化 +1
            statsCacheService.addInRand(RedisKey.STRATEGY_STATS_HOT_SORT, 1, strategyId);
        }
        return result;
    }


}
































