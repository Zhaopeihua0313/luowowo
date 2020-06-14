package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Scenic;
import cn.wolfcode.luowowo.article.domain.ScenicContent;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IScenicCatalogService;
import cn.wolfcode.luowowo.article.service.IScenicContentService;
import cn.wolfcode.luowowo.article.service.IScenicService;
import cn.wolfcode.luowowo.cache.service.IScenicStatsCacheService;
import cn.wolfcode.luowowo.comment.domain.ScenicComment;
import cn.wolfcode.luowowo.comment.domain.ScenicCommentReply;
import cn.wolfcode.luowowo.comment.service.IScenicCommentReplyService;
import cn.wolfcode.luowowo.comment.service.IScenicCommentService;
import cn.wolfcode.luowowo.common.query.ScenicCommentQueryObject;
import cn.wolfcode.luowowo.common.query.ScenicQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import cn.wolfcode.luowowo.website.util.UploadUtil;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@Controller
@RequestMapping("/scenic")
public class ScenicController {

    @Value("${file.dir}")
    private String dir;

    @Reference
    private IScenicService scenicService;

    @Reference
    private IScenicContentService contentService;

    @Reference
    private IScenicCatalogService catalogService;

    @Reference
    private IDestinationService destinationService;

    @Reference
    private IScenicStatsCacheService cacheService;

    @Reference
    private IScenicCommentService scenicCommentService;

    @Reference
    private IScenicCommentReplyService replyService;

    /**
     * 显示 景点页面
     */
    @RequestMapping("/list")
    public String list(ScenicQueryObject qo, Model model) {
        List<Destination> toasts = destinationService.getToasts(qo.getDestId());
        //toasts 吐司
        toasts.remove(0);
        model.addAttribute("toasts", toasts);
        //dest 目的地
        model.addAttribute("dest", toasts.remove(toasts.size() - 1));
        //scenic -- 景点信息
        Scenic scenic = scenicService.getByDeatId(qo.getDestId());
        ScenicContent content = contentService.get(scenic.getId());
        scenic.setContent(content);
        model.addAttribute("scenic", scenic);
        //必游TOP5---点评数最高的前五子景点
        List<Scenic> scenics = scenicService.listReplyTOP5(qo.getDestId());
        for (Scenic s : scenics) {
            String photos = s.getPhotos();
            if (photos != null && StringUtils.hasLength(photos)) {
                s.setPhotoArr(photos.split(","));
            }
        }
        model.addAttribute("top5", scenics);
        //热门景点---收藏数前八的子景点
        model.addAttribute("top10", scenicService.listFavorTOP10(qo.getDestId()));
        //城市的景点的分类
        model.addAttribute("catalogs", catalogService.listByDestId(qo.getDestId()));
        return "scenic/list";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Long scenicId, @LoginUser UserInfo user) {
        Destination destination = destinationService.selectByScenicId(scenicId);
        model.addAttribute("dest", destination);
        //scenic -- 景点信息
        Scenic scenic = scenicService.get(scenicId);
        ScenicContent content = contentService.get(scenicId);
        scenic.setContent(content);
        model.addAttribute("scenic", scenic);
        //children -- 内部景点列表
        model.addAttribute("children", scenicService.listByParentId(scenicId));
        //是否已去过,已收藏
        boolean isFavor = user != null && cacheService.isFavor(scenicId, user.getId());
        boolean isVisit = user != null && cacheService.isVisit(scenicId, user.getId());
        model.addAttribute("isFavor", isFavor);
        model.addAttribute("isVisit", isVisit);
        model.addAttribute("vo", scenicCommentService.getSumData(scenicId));
        return "scenic/detail";
    }

    @RequestMapping("/scenicPage")
    public String scenicPage(@ModelAttribute("qo") ScenicQueryObject qo, Model model){
        PageInfo<Scenic> pageInfo = scenicService.query(qo);
        model.addAttribute("page",pageInfo);
        return "scenic/scenicPage";
    }

    @RequestMapping("/comment")
    public String listComment(@LoginUser UserInfo user,  Model model, @ModelAttribute("qo") ScenicCommentQueryObject qo) {
        Page<ScenicComment> page = scenicCommentService.query(qo);
        model.addAttribute("page", page);
        model.addAttribute("user", user);
        return "scenic/commentTpl";
    }

    /**
     * 处理 点评景点
     */
    @RequiredLogin
    @RequestMapping("/remarkAdd")
    @ResponseBody
    public AjaxResult remarkAdd(ScenicComment comment, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //设置用户信息
        comment.setUserId(userInfo.getId());
        comment.setUsername(userInfo.getNickname());
        comment.setHeadUrl(userInfo.getHeadImgUrl());
        comment.setLevel(userInfo.getLevel());
        //保存操作
        scenicCommentService.save(comment);
        //更新统计数据缓存 评论数+1
        cacheService.incrbyNum(comment.getScenicId(), 1, IScenicStatsCacheService.SCENIC_STATS_REPLYNUM);
        return result;
    }

    @RequestMapping("files")
    @ResponseBody
    public String files(MultipartFile pic) {
        String picUrl = UploadUtil.upload(pic, dir);
        return "/" + picUrl;
    }

    @RequiredLogin
    @RequestMapping("commentReply")
    @ResponseBody
    public AjaxResult commentReply(ScenicCommentReply commentReply, @LoginUser UserInfo user) {
        AjaxResult result = new AjaxResult();
        //先判断用户是否登录
        if (user == null) {
            result.mark("请先登录");
            return result;
        }
        //直接回复大评论
        commentReply.setUserId(user.getId());
        commentReply.setUsername(user.getNickname());
        commentReply.setHeadUrl(user.getHeadImgUrl());
        replyService.save(commentReply);
        return result;
    }

    /**
     * 处理 点赞用户点评
     */
    @RequestMapping("/thumbup")
    @ResponseBody
    @RequiredLogin
    public AjaxResult commentThumbUp(String commentId, Long userId) {
        AjaxResult result = new AjaxResult();
        scenicCommentService.thumbup(commentId, userId);
        return result;
    }

    /**
     * 处理 收藏某景点（已收藏就取消收藏）
     */
    @RequiredLogin
    @RequestMapping("/favor")
    @ResponseBody
    public AjaxResult favor(Long scenicId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //进行收藏操作，用户没收藏就在景点收藏者里添加该用户，并且收藏数+1，反之就是取消收藏操作，剔除并且收藏数-1，返回值 true为收藏 false为取消收藏
        boolean flag = userInfo != null && cacheService.favor(scenicId, userInfo.getId());
        //用作前端判断是收藏操作还是取消收藏
        result.setSuccess(flag);
        return result;
    }

    /**
     * 处理 去过某景点（已去过就取消去过）
     */
    @RequiredLogin
    @RequestMapping("/visit")
    @ResponseBody
    public AjaxResult visit(Long scenicId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //进行去过操作，用户未去过就在景点已去过里添加该用户，并且去过数+1，反之就是取消已去过操作，剔除并且去过数-1，返回值 true为去过 false为取消去过
        boolean flag = userInfo != null && cacheService.visit(scenicId, userInfo.getId());
        //用作前端判断是收藏操作还是取消收藏
        result.setSuccess(flag);
        return result;
    }

}


































