package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Answer;
import cn.wolfcode.luowowo.article.domain.Question;
import cn.wolfcode.luowowo.article.service.IAnswerService;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IQuestionContentService;
import cn.wolfcode.luowowo.article.service.IQuestionService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IAnswerStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IQuestionStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IUserRankStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.AnswerStats;
import cn.wolfcode.luowowo.cache.vo.QuestionStats;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/wenda")
public class WendaController {

    @Reference
    private IQuestionService questionService;
    @Reference
    private IAnswerService answerService;
    @Reference
    private IQuestionContentService questionContentService;
    @Reference
    private IAnswerStatsCacheService answerStatsCacheService;
    @Reference
    private IQuestionStatsCacheService questionStatsCacheService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IUserRankStatsCacheService userRankStatsCacheService;
    @Value("${file.dir}")
    private String dir;

    //查所有问题及其金牌问答(点赞最多的)
    @RequestMapping("")
    public String wendaIndex(Model model){
        //questionlist,所有的问题(其中包括了金牌回答)
        model.addAttribute("questionlist",questionService.listAll());
        //ranklist,进入问答首页页面时默认查询回答数排行榜
        model.addAttribute("ranklist",userRankStatsCacheService.ranklistTop10(RedisKey.USER_ANSWER_ANSWERSNUM_SORT,10));
        return "community/wenda";
    }

    //根据问题id查到该问题详情以及该问题下的所有回答
    @RequestMapping("/detail")
    public String answer(Long questionId,Model model,@LoginUser UserInfo user,String goldenId){//goldenId,金牌回答的id
        //每访问一次问题详情页,该问题的浏览数+1
        questionStatsCacheService.incr(questionId,1,questionStatsCacheService.QUESTION_STATS_VIEWNUM);
        //vo,提问统计信息
        model.addAttribute("vo",questionStatsCacheService.getQuestionStats(questionId));
        //question,提问详情信息
        model.addAttribute("question",questionService.get(questionId));
        //content,提问内容
        model.addAttribute("content",questionContentService.get(questionId));
        //golden,金牌回答,且放在回答列表第一个
        model.addAttribute("golden",answerService.getGoldenOne(questionId,goldenId));
        //others,其他回答,其他回答放在后面,并按照时间顺序逆序排序
        model.addAttribute("others",answerService.listOthers(questionId));
        //isFocus,用来回显是否关注
        boolean focus = user != null ? questionStatsCacheService.isFocus(user.getId(),questionId) : false;
        model.addAttribute("isFocus",focus);
        return "community/wendaDetail";
    }

    //跳转我要提问页面,登录之后才能跳转提问页面
    @RequiredLogin
    @RequestMapping("/public")
    public String toQuestion(@LoginUser UserInfo userInfo,Model model){
        //dests,所有目的地,供提问时绑定目的地
        model.addAttribute("dests",destinationService.list());
        return "community/public";
    }

    //保存提问
    @RequiredLogin
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(Question question,@LoginUser UserInfo userInfo){
        question.setAuthor(userInfo);
        AjaxResult ajaxResult = questionService.save(question);
        if(ajaxResult.isSuccess()){
            //每次保存提问成功后后,都要对应把数据缓存到redis
            Question savedQuestion = questionService.get((Long) ajaxResult.getData());
            //缓存中没有数据才缓存数据
            if ( !questionStatsCacheService.hasStatsKey(savedQuestion.getId())) {
                //封装vo对象
                QuestionStats vo = new QuestionStats();
                vo.setUserId(savedQuestion.getAuthor().getId());//提问者id
                vo.setUserName(savedQuestion.getAuthor().getNickname());//提问者昵称
                vo.setHeadImgUrl(savedQuestion.getAuthor().getHeadImgUrl());//提问者头像
                vo.setLevel(savedQuestion.getAuthor().getLevel());//提问者等级
                vo.setQuestionId(savedQuestion.getId());//问题id

                vo.setViewNum(savedQuestion.getViewNum());//阅读数
                vo.setAnswerNum(savedQuestion.getAnswerNum());//该问题的回答数
                vo.setFocusMemberNum(savedQuestion.getFocusMemberNum());//被关注数
                vo.setShareNum(savedQuestion.getShareNum());//共享数

                System.out.println(vo);

                //缓存到redies中，替换存储
                questionStatsCacheService.setQuestionStats(vo);
            }
        }
        return ajaxResult;
    }

    /**
     * 处理 UME 富文本编辑器上传图片
     */
    @RequestMapping("/contentImage")
    @ResponseBody
    public String uploadUEImage(MultipartFile upfile, HttpServletRequest request)
            throws Exception{
        UMEditorUploader up = new UMEditorUploader(request);
        java.lang.String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
        up.setAllowFiles(fileType);
        up.setMaxSize(10000); //单位KB
        up.upload(upfile, dir);

        String callback = request.getParameter("callback");
        String result = "{\"name\":\""+ up.getFileName() +"\", \"originalName\": \""+ up.getOriginalName() +"\", \"size\": "+ up.getSize()
                +", \"state\": \""+ up.getState() +"\", \"type\": \""+ up.getType() +"\", \"url\": \""+ up.getUrl() +"\"}";
        result = result.replaceAll( "\\\\", "\\\\" );
        if(callback == null ){
            return result ;
        }else{
            return "<script>"+ callback +"(" + result + ")</script>";
        }
    }

    //保存回答
    @RequiredLogin
    @RequestMapping("/saveAnswer")
    @ResponseBody
    public Object saveAnswer(Answer answer,MultipartFile pic, @LoginUser UserInfo user){
        //如果没传图片就不处理
        String picUrl = null;
        if(pic!=null && pic.getSize()>0){
            picUrl = UploadUtil.upload(pic, dir);
        }
        //补充用户数据
        answer.setAuthorId(user.getId());
        answer.setAuthorname(user.getNickname());
        answer.setLevel(user.getLevel());
        answer.setHeadUrl(user.getHeadImgUrl());
        answer.setCoverUrl(picUrl);
        AjaxResult ajaxResult = answerService.save(answer);
        //回答成功
        if(ajaxResult.isSuccess()){
            //每回答一次,该问题的回答数+1
            questionStatsCacheService.incr(answer.getQuestionId(),1,IQuestionStatsCacheService.QUESTION_STATS_ANSWERNUM);
            //每回答一次,统计数据的回答数+1
            String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(user.getId());
            userRankStatsCacheService.incr(user.getId(),1,IUserRankStatsCacheService.USER_STSTS_ANSWER);
            //每回答一次,排行榜的回答数+1
            userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_ANSWERSNUM_SORT,1,user.getId());
        }
        return ajaxResult;
    }

    //给回答点赞
    @RequiredLogin
    @RequestMapping("/answerThumbup")
    @ResponseBody
    public Object answerThumbup(String answerId, @LoginUser UserInfo user){
        Long userId = user.getId();
        AjaxResult ajaxResult = answerStatsCacheService.answerThumbup(answerId, userId);
        if(ajaxResult.isSuccess()){
            //每成功点一次赞,该回答的回答者的被点赞数统计数据+1
            Answer answer = answerService.get(answerId);

            answer.setThumbupNum(answer.getThumbupNum()+1);//更新到answer  MongoDB库
            answerService.save(answer);

            AnswerStats answerStats = answerStatsCacheService.getAnswerStats(answerId);//更新到answerStats
            answerStats.setThumbsupnum(answerStats.getThumbsupnum()+1);
            answerStatsCacheService.setAnswerStats(answerStats);


            String cacheKey = RedisKey.USER_SCORE_STATS.getCacheKey(answer.getAuthorId());
            userRankStatsCacheService.incr(user.getId(),1,IUserRankStatsCacheService.USER_STSTS_THUM);
            //每成功点一次赞,排行榜的被点赞数统计数据+1
            userRankStatsCacheService.addInRand(RedisKey.USER_ANSWER_THUMBUP_SORT,1,answer.getAuthorId());
        }
        return ajaxResult;
    }

    //关注和取消关注
    @RequiredLogin
    @RequestMapping("/focus")
    @ResponseBody
    public Object focus(Long questionId, @LoginUser UserInfo user){
        AjaxResult ajaxResult = new AjaxResult();
        boolean success = questionStatsCacheService.focus(user.getId(),questionId);
        //设置关注结果
        ajaxResult.setSuccess(success);
        //返回关注数
        QuestionStats questionStats = questionStatsCacheService.getQuestionStats(questionId);
        return ajaxResult.addData(questionStats.getFocusMemberNum());
    }

    //排行榜(用MySQL做的)
    @RequestMapping("/rank")
    public String rank(int rank,Model model){
        //rank,根据类型决定查什么排行榜
        model.addAttribute("rank",rank);
        //ranklist,根据点击条件查询排行榜
        if(rank==IUserRankStatsCacheService.USER_STSTS_GOLDEN){
            model.addAttribute("ranklist",userRankStatsCacheService.ranklistTop10(RedisKey.USER_ANSWER_GOLDEN_SORT,10));
        }
        if(rank==IUserRankStatsCacheService.USER_STSTS_ANSWER){
            model.addAttribute("ranklist",userRankStatsCacheService.ranklistTop10(RedisKey.USER_ANSWER_ANSWERSNUM_SORT,10));
        }
        if(rank==IUserRankStatsCacheService.USER_STSTS_THUM){
            model.addAttribute("ranklist",userRankStatsCacheService.ranklistTop10(RedisKey.USER_ANSWER_THUMBUP_SORT,10));
        }
        return "community/rankTpl";
    }
}
