package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import cn.wolfcode.luowowo.common.query.TravelQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import cn.wolfcode.luowowo.website.util.UMEditorUploader;
import cn.wolfcode.luowowo.website.util.UploadUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/travel")
public class TravelController {

    //引入图片保存地址
    @Value("${file.dir}")
    private String dir;

    @Reference
    private ITravelService travelService;

    @Reference
    private IDestinationService destinationService;

    @Reference
    private IStrategyDetailService detailService;

    @Reference
    private ITravelCommentService travelCommentService;

    @Reference
    private ITravelStatsCacheService travelStatsCacheService;

    /**
     * 处理 前台的分享按钮点击后，攻略的分享数+1
     */
    @RequestMapping("/share")
    @ResponseBody
    public AjaxResult share(Long id) {
        AjaxResult result = new AjaxResult();
        try {
            travelStatsCacheService.incrbyNum(id, 1, ITravelStatsCacheService.TRAVEL_STATS_SHARENUM);
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 处理 收藏某攻略评论（已收藏就取消收藏）
     */
    @RequiredLogin
    @RequestMapping("/favor")
    @ResponseBody
    public AjaxResult favor(Long travelId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //进行收藏操作，用户没收藏就在攻略收藏者里添加该用户，并且收藏数+1，反之就是取消收藏操作，剔除并且收藏数-1，返回值 true为收藏 false为取消收藏
        boolean flag = travelStatsCacheService.favor(travelId, userInfo.getId());
        //用作前端判断是收藏操作还是取消收藏
        result.setSuccess(flag);
        //收藏后热门榜数值要变化
        if (flag) {
            travelStatsCacheService.addInRand(RedisKey.TRAVEL_STATS_HOT_SORT, 1, travelId);
        } else {
            travelStatsCacheService.addInRand(RedisKey.TRAVEL_STATS_HOT_SORT, -1, travelId);
        }
        //从 redies 中获取该攻略的统计数据
        TravelStats vo = travelStatsCacheService.getStatsById(travelId);
        return result.addData(vo.getFavornum());
    }

    /**
     * 处理 顶(点赞)某游记
     */
    @RequiredLogin
    @RequestMapping("/travelThumbup")
    @ResponseBody
    public AjaxResult travelThumbup(Long travelId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //进行顶(点赞)操作，用户没点赞就在攻略点赞者里添加该用户，并且点赞数+1，redis 缓存设有效期1天，有效期内无法再点赞
        result = travelStatsCacheService.thumbup(travelId, userInfo.getId());
        if (result.isSuccess()) {
            //点赞后热门榜数值要变化 +1
            travelStatsCacheService.addInRand(RedisKey.STRATEGY_STATS_HOT_SORT, 1, travelId);
        }
        return result;
    }

    /**
     * 处理 添加游记评论 在游记详情页
     */
    @RequiredLogin
    @RequestMapping("/commentAdd")
    public String commentAdd(TravelComment comment, Long floor, @LoginUser UserInfo userInfo, Model model){
        //设置用户信息
        comment.setUserId(userInfo.getId());
        comment.setUsername(userInfo.getNickname());
        comment.setHeadUrl(userInfo.getHeadImgUrl());
        comment.setCity(userInfo.getCity());
        //保存操作
        comment=travelCommentService.save(comment);
        //c 回显该新增的评论
        model.addAttribute("c",comment);
        //floor 回显新增评论的楼层
        model.addAttribute("floor",++floor);
        //更新统计数据缓存 评论数+1
        travelStatsCacheService.incrbyNum(comment.getTravelId(), 1, ITravelStatsCacheService.TRAVEL_STATS_REPLYNUM);
        //回显的数据
        //result.setData(statsCacheService.getStatsById(comment.getDetailId()).getReplynum());
        //评论后飙升榜数值要变化 +1
        travelStatsCacheService.addInRand(RedisKey.TRAVEL_STATS_UP_SORT, 1, comment.getTravelId());
        return "/travel/commentTpl";
    }

    /**
     * 显示 旅游日记列表页（游记列表页）
     */
    @RequestMapping("")
    public String list(@ModelAttribute("qo") TravelQueryObject qo, Model model) {
        //pageInfo 分页对象
        model.addAttribute("pageInfo", travelService.query(qo));
        return "travel/list";
    }

    /**
     * 显示 写游记（游记新增或编辑页面）
     */
    @RequiredLogin
    @RequestMapping("input")
    public String input(Model model, Long id) {
        if (id != null) {
            //这里不需要去查询文章内容,跳转到页面后发ajax查询
            model.addAttribute("tv", travelService.get(id));
        }
        //dests 目的地下拉框
        model.addAttribute("dests", destinationService.list());
        return "travel/input";
    }

    /**
     * 处理 编辑或新增游记
     */
    @RequiredLogin
    @ResponseBody
    @RequestMapping("/saveOrUpdate")
    public AjaxResult saveOrUpdate(Travel entity, @LoginUser UserInfo user) {
        //设置作者为当前登录用户
        entity.setAuthor(user);
        return travelService.saveOrUpdate(entity);
    }

    /**
     * 显示 游记详情页
     */
    @RequestMapping("/detail")
    public String detail(Long id, Model model) {
        //detail 文章内容
        Travel travel = travelService.get(id);
        travel.setTravelContent(travelService.getContent(id));
        model.addAttribute("detail", travel);
        Long destId = travel.getDest().getId();
        List<Destination> toasts = destinationService.getToasts(destId);
        //toasts 吐司
        model.addAttribute("toasts", toasts);
        //sds 查询该目的地下点击量前3的攻略
        model.addAttribute("sds", detailService.listViewnumTop3(destId));
        //ts 查询该目的地下点击量前3的游记
        model.addAttribute("ts", travelService.listViewnumTop3(destId));
        //list 查询该目的地的游记的所有评论
        model.addAttribute("list",travelCommentService.findByTravelId(id));
        //游记被访问，给 redis 游记统计数据阅读数+1
        travelStatsCacheService.incrbyNum(id, 1, ITravelStatsCacheService.TRAVEL_STATS_VIEWNUM);
        //redis 飙升排行榜+1
        travelStatsCacheService.addInRand(RedisKey.TRAVEL_STATS_UP_SORT, 1, id);
        //热数据回显
        TravelStats stats = travelStatsCacheService.getStatsById(id);
        model.addAttribute("stats", stats);
        return "travel/detail";
    }

    /**
     * 返回 某游记内容
     */
    @RequestMapping("/getContent")
    @ResponseBody
    public Object getContent(Long id) {
        return travelService.getContent(id);
    }

    /**
     * 处理 游记封面的文件上传，编辑游记中的
     */
    @RequiredLogin
    @RequestMapping("/coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        //直接返回上传文件的名称
        return UploadUtil.upload(pic, dir);
    }

    /**
     * 处理 UME 富文本编辑器上传图片
     */
    @RequestMapping("/contentImage")
    @ResponseBody
    public String uploadUEImage(MultipartFile upfile, HttpServletRequest request) throws Exception{
        UMEditorUploader up = new UMEditorUploader(request);
        java.lang.String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
        up.setAllowFiles(fileType);
        up.setMaxSize(10000); //单位KB
        up.upload(upfile, dir);
        String callback = request.getParameter("callback");
        String result = "{\"name\":\""+ up.getFileName() +"\", \"originalName\": \""+ up.getOriginalName() +"\", \"size\": "+ up.getSize() +", \"state\": \""+ up.getState() +"\", \"type\": \""+ up.getType() +"\", \"url\": \""+ up.getUrl() +"\"}";
        result = result.replaceAll( "\\\\", "\\\\" );
        if(callback == null ){
            return result ;
        }else{
            return "<script>"+ callback +"(" + result + ")</script>";
        }
    }

}
