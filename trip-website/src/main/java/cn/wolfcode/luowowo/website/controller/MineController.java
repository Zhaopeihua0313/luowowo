package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.OrderDetail;
import cn.wolfcode.luowowo.article.domain.Scenic;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IScenicStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IVerifyCodeCacheService;
import cn.wolfcode.luowowo.comment.domain.ScenicComment;
import cn.wolfcode.luowowo.comment.service.IScenicCommentService;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import cn.wolfcode.luowowo.website.util.UploadUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * 个人中心!
 * Created by Administrator on 2019/11/22.
 */
@Controller
@RequestMapping("/mine")
public class MineController {

    @Reference
    private IOrderDetailService orderDetailService;

    @Reference
    private ITravelService travelService;

    @Reference
    private ITravelCommentService travelCommentService;

    @Reference
    private ITravelStatsCacheService travelStatsCacheService;

    @Reference
    private IUserInfoService userInfoService;

    @Reference
    private IStrategyDetailService strategyDetailService;

    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;

    @Reference
    private IVerifyCodeCacheService verifyCodeCacheService;

    @Reference
    private IScoreHistoryService scoreHistoryService;

    @Reference
    private IScenicStatsCacheService scenicStatsCacheService;

    @Reference
    private IScenicService scenicService;

    @Reference
    private IScenicCommentService scenicCommentService;


    @Value("${file.dir}")
    private String dir;

    /**
     * 处理 用户 每日打卡签到增加积分
     */
    @RequiredLogin
    @RequestMapping("/dayCheck")
    @ResponseBody
    public AjaxResult dayCheck(Model model, @LoginUser UserInfo userInfo) {
        return scoreHistoryService.dayCheck(userInfo);
    }

    //我的游记
    @RequiredLogin
    @RequestMapping("/mytravelnotes")
    public String mytravelnotes(Model model, @LoginUser UserInfo userInfo) {
        //用户个人信息
        UserInfo user = userInfoService.getUpload(userInfo.getId());
        model.addAttribute("user", user);
        //所有游记
        model.addAttribute("travels", travelService.listTravelByUserId(user.getId()));

        //游记总数
        model.addAttribute("total", travelService.listTravelTotal(user.getId()));

        //回复总数
        model.addAttribute("replyNum", travelCommentService.getReplyNumById(user.getId()));

        //阅读总数
        model.addAttribute("readNum", travelStatsCacheService.getReadNumById(user.getId()));

        //最近访问数
        int todayNum = travelStatsCacheService.getTodayNum();
        model.addAttribute("todayNum", todayNum);

        //访问总量
        int sum = travelStatsCacheService.addAccess();
        model.addAttribute("sum", sum);
        return "mine/mytravelnotes";
    }

    //我的窝
    @RequiredLogin
    @RequestMapping("/homepage")
    public String homepage(Model model, @LoginUser UserInfo userInfo) {


        //用户个人信息
        UserInfo user = userInfoService.getUpload(userInfo.getId());
        model.addAttribute("user", user);

        //我的关注
        List<UserInfo> cares = userInfoService.listCareByUserId(user.getId());
        model.addAttribute("cares", cares);

        //关注人数
        model.addAttribute("caresNum", cares.size());

        //收藏总数
        List<Long> travelIds = travelStatsCacheService.listTravelsByUserId(user.getId()); //攻略
        List<Long> ids = strategyStatsCacheService.listStrategiesByUserId(user.getId());  //游记
        model.addAttribute("sum", travelIds.size() + ids.size());

        //所有游记
        model.addAttribute("travels", travelService.listTravelByUserId(user.getId()));

        //游记总数
        model.addAttribute("total", travelService.listTravelTotal(user.getId()));

        //游记点评
        List<ScenicComment> comments = scenicCommentService.findByUserId(userInfo.getId());
        model.addAttribute("comments", comments);

        //点评总数
        model.addAttribute("replyNum", comments.size());
        return "mine/homepage";
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

    //我的点评
    @RequiredLogin
    @RequestMapping("/review")
    public String review(Model model, @LoginUser UserInfo userInfo) {
        //用户个人信息
        UserInfo user = userInfoService.getUpload(userInfo.getId());
        model.addAttribute("user", user);

        //点评数据
        List<ScenicComment> comments = scenicCommentService.findByUserId(userInfo.getId());
        model.addAttribute("comments", comments);

        //点评数量
        model.addAttribute("commentsNum", comments.size());

        //点赞数量


        return "mine/review";
    }

    //我的收藏
    @RequiredLogin
    @RequestMapping("/travelcollection")
    public String travelcollection(Model model, @LoginUser UserInfo user) {
        //用户个人信息
        model.addAttribute("user", user);

        //地点收藏
        List<Long> scenicIds = scenicStatsCacheService.listScenicsByUserId(user.getId());
        List<Scenic> scenics = new ArrayList<>();
        if (scenicIds != null) {
            for (Long scenicId : scenicIds) {
                Scenic scenic = scenicService.getScenicContent(scenicId);
                scenics.add(scenic);
            }
        }
        model.addAttribute("scenics", scenics);

        //游记收藏
        List<Long> travelIds = travelStatsCacheService.listTravelsByUserId(user.getId());
        List<Travel> travels = new ArrayList<>();
        if (travelIds != null) {
            for (Long travelId : travelIds) {
                Travel travel = travelService.getStrategyContent(travelId);
                travel.setTravelContent(travelService.getContent(travel.getId()));
                travels.add(travel);
            }
        }

        model.addAttribute("travels", travels);

        //攻略收藏
        List<Long> ids = strategyStatsCacheService.listStrategiesByUserId(user.getId());
        List<StrategyDetail> details = new ArrayList<>();
        if (ids != null) {
            for (Long StrategyId : ids) {

                StrategyDetail strategyDetail = strategyDetailService.getStrategyContent(StrategyId);
                details.add(strategyDetail);
            }
        }
        model.addAttribute("details", details);

        return "mine/travelcollection";
    }

    /**
     * 我的订单
     */
    @RequiredLogin
    @RequestMapping("/myorder")
    public String myorder(Model model, @LoginUser UserInfo user) {
        //用户个人信息
        model.addAttribute("user", user);

        //查询用户的订单数据
        List<OrderDetail> list = orderDetailService.listByUserId(user.getId());
        model.addAttribute("travels", list);

        return "mine/myorder";
    }


    //设置
    @RequiredLogin
    @RequestMapping("/setting")
    public String setting(Model model, @LoginUser UserInfo userInfo) {
        //用户个人信息
        UserInfo user = userInfoService.getUpload(userInfo.getId());
        model.addAttribute("user", user);
        return "mine/setting";
    }

    //保存我的信息
    @RequestMapping("/update")
    @ResponseBody
    public Object update(UserInfo user) {

        AjaxResult result = userInfoService.updateUser(user);
        return result;
    }

    //我的头像
    @RequestMapping("/updateHeadImgUrl")
    @ResponseBody
    public Object updateHeadImgUrl(Model model, @LoginUser UserInfo userInfo, String headImgUrl) {
        AjaxResult result = new AjaxResult();
        try {
            userInfoService.updateHeadImgUrl(headImgUrl, userInfo.getId());
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("保存失败");
        }

        //更新数据
        UserInfo user = userInfoService.getUpload(userInfo.getId());
        model.addAttribute("user", user);
        return result;
    }

    @RequestMapping("/uploadImg")
    @ResponseBody
    public String uploadImg(MultipartFile pic, @LoginUser UserInfo user) {
        String fileName = UploadUtil.upload(pic, dir);
        return fileName;
    }

    //手机验证
    @RequestMapping("/phone")
    public String phone(@LoginUser UserInfo user) {
        //向手机发送验证码
        String verifyCode = verifyCodeCacheService.getVerifyCode(user.getPhone());
        verifyCode = UUID.randomUUID().toString().substring(0, 4);
        System.err.println("HI,您的验证码是" + verifyCode + "请在60s内使用");
        //缓存验证码
        verifyCodeCacheService.setVerifyCode(user.getPhone(), verifyCode);
        return "mine/resetMobile";//跳转到验证页面
    }

    //验证验证码是否正确,若是正确修改密码,重新登录
    @RequestMapping("/mobile")
    @ResponseBody
    public Object mobile(@LoginUser UserInfo user, String password, String rpassword, String smscode) {
        AjaxResult result = userInfoService.updatePassword(user, password, rpassword, smscode);
        return result;
    }

    //更该手机号
    @RequestMapping("/oldPhone")
    @ResponseBody
    public Object oldPhone(@LoginUser UserInfo userInfo, String phone) {
        AjaxResult result = new AjaxResult();
        //判断手机号是否与当前登录用户手机一致
        if (phone.equals(userInfo.getPhone())) {
            //发送验证码
            if (verifyCodeCacheService.getVerifyCode(phone) != null) {
                return result.mark("验证码已发送 , 请勿重复点击");
            }
            //生成验证码
            String verifyCode = UUID.randomUUID().toString().substring(0, 4);
            verifyCodeCacheService.setVerifyCode(userInfo.getPhone(), verifyCode);
            //模拟真实短信
            System.err.println("HI,您的验证码是" + verifyCode + "请在60s内使用");
            return result;
        } else {
            return result.mark("手机号错误");
        }
    }

    @RequestMapping("/code")
    @ResponseBody
    public Object code(@LoginUser UserInfo user, String phone, String code) {
        AjaxResult result = new AjaxResult();

        String verifyCode = verifyCodeCacheService.getVerifyCode(user.getPhone());
        if (verifyCode.equals(code) && phone.equals(user.getPhone())) {
            return result;
        } else {
            return result.mark("手机号和验证码不正确");
        }
    }

    //新手机号
    @RequestMapping("/newPhone")
    @ResponseBody
    public Object newPhone(String phone) {
        AjaxResult result = new AjaxResult();
        //判断是否存在用户
        UserInfo user = userInfoService.selectByPhone(phone);
        if (user != null) {
            return result.mark("手机号已存在");
        } else {
            //发送验证码
            String verifyCode = verifyCodeCacheService.getVerifyCode(phone);
            //模拟短信
            verifyCode = UUID.randomUUID().toString().substring(0, 4);
            System.err.println("HI,您的验证码是" + verifyCode + "请在60s内使用");

            //缓存验证码
            verifyCodeCacheService.setVerifyCode(phone, verifyCode);
        }
        return result;
    }

    //新验证码
    @RequestMapping("/newCode")
    @ResponseBody
    public Object newCode(String phone, String code, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        String verifyCode = verifyCodeCacheService.getVerifyCode(phone);
        if (code.equals(verifyCode)) {
            userInfoService.updatePhone(userInfo.getId(), phone);
            return result;
        } else {
            return result.mark("验证码不正确");
        }
    }

    //黑名单
    @RequestMapping("/black")
    @RequiredLogin
    public String black(Model model , @LoginUser UserInfo userInfo){
        List<UserInfo> us = userInfoService.listAllFriend(userInfo.getId());
        model.addAttribute("us" , us);
        return "mine/setting";
    }

}
