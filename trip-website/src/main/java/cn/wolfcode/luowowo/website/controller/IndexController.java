package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.service.IStrategyCommendService;
import cn.wolfcode.luowowo.article.service.ITravelCommendService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.common.query.TravelQueryObject;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.service.*;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import cn.wolfcode.luowowo.search.vo.SearchResult;
import org.apache.dubbo.config.annotation.Reference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Reference
    private IUserInfoService userInfoService;

    @Reference
    private IStrategyCommendService strategyCommendService;

    @Reference
    private ITravelCommendService travelCommendService;

    @Reference
    private ITravelService travelService;

    @Reference
    private IDestinationSearchService destinationSearchService;

    @Reference
    private ISearchService searchService;

    @Reference
    private IStrategySearchService strategySearchService;

    @Reference
    private ITravelSearchService travelSearchService;

    @Reference
    private IUserInfoSearchService userInfoSearchService;

    /**
     * 处理 伪造代码报错！！！
     */
    @RequestMapping("/err")
    public String err () {

        return "index/index";
    }

    /**
     * 显示 搜索页面（多个）
     */
    @RequestMapping("/q")
    public String search(Model model, @ModelAttribute("qo") SearchQueryObject qo) {
        String freemarker = null;
        //根据搜索类型来返回对应的页面
        switch (qo.getType()) {
            case SearchQueryObject.SEARCH_DEST:
                freemarker = "searchDest";
                searchDest(model, qo);
                break;
            case SearchQueryObject.SEARCH_STRATEGY:
                freemarker = "searchStrategy";
                searchStrategy(model, qo);
                break;
            case SearchQueryObject.SEARCH_TRAVEL:
                freemarker = "searchTravel";
                searchTravel(model, qo);
                break;
            case SearchQueryObject.SEARCH_USER:
                freemarker = "searchUser";
                searchUser(model, qo);
                break;
            default:
                freemarker = "searchAll";
                searchAll(model, qo);
                break;
        }
        return "index/" + freemarker;
    }

    /**
     * 处理 获取搜索结果（目的地）并且回显到页面
     */
    public void searchDest(Model model, SearchQueryObject qo) {
        if (StringUtils.hasText(qo.getKeyword())) {
            SearchResult result = new SearchResult();
            //目的地搜索：目的地对应的目的地、对应的攻略、对应的游记、对应的用户
            DestinationTemplate destinationTemplate =  destinationSearchService.findByName(qo.getKeyword());
            List<StrategyTemplate> strategyTemplates = strategySearchService.findByDestName(qo.getKeyword());
            List<TravelTemplate> travelTemplates = travelSearchService.findByDestName(qo.getKeyword());
            List<UserInfoTemplate> userInfoTemplates = userInfoSearchService.findByDestName(qo.getKeyword());

            //封装结果
            result.setStrategys(strategyTemplates);
            result.setTravels(travelTemplates);
            result.setUsers(userInfoTemplates);
            int count = destinationTemplate == null ? 0 : 1;
            count += strategyTemplates.size() + travelTemplates.size() + userInfoTemplates.size();
            result.setTotal(count);

            //回显
            model.addAttribute("dest", destinationTemplate);
            model.addAttribute("data", result);
        }
    }

    /**
     * 处理 获取搜索结果（攻略）并且回显到页面
     */
    public void searchStrategy(Model model, SearchQueryObject qo) {
        if (StringUtils.hasText(qo.getKeyword())) {
            //搜索攻略时，模糊查询关键字，包括文字标题, 副标题, 摘要都要，并且高亮显示
            Page<StrategyTemplate> page = searchService.hightLightSearch(StrategyTemplate.INDEX_TYPE_NAME, StrategyTemplate.class, qo, "title", "subtitle", "summary");
            model.addAttribute("page",page);
        }
    }

    /**
     * 处理 获取搜索结果（游记）并且回显到页面
     */
    private void searchTravel(Model model, SearchQueryObject qo) {
        if (StringUtils.hasText(qo.getKeyword())) {
            //搜索游记时，模糊查询关键字，包括文字标题, 摘要都要，并且高亮显示
            Page<TravelTemplate> page = searchService.hightLightSearch(TravelTemplate.INDEX_TYPE_NAME, TravelTemplate.class, qo, "title", "summary");
            model.addAttribute("page", page);
        }
    }

    /**
     * 处理 获取搜索结果（用户）并且回显到页面
     */
    private void searchUser(Model model, SearchQueryObject qo) {
        if (StringUtils.hasText(qo.getKeyword())) {
            //搜索用户时，模糊查询关键字，包括用户昵称, 所在城市都要，并且高亮显示
            Page<UserInfoTemplate> page = searchService.hightLightSearch(UserInfoTemplate.INDEX_TYPE_NAME, UserInfoTemplate.class, qo, "nickname",  "destName");
            model.addAttribute("page", page);
        }
    }

    /**
     * 处理 获取搜索结果（ALL）并且回显到页面
     */
    private void searchAll(Model model, SearchQueryObject qo) {
        if (StringUtils.hasText(qo.getKeyword())) {
            SearchResult result = new SearchResult();
            //搜索所有时，要搜索攻略、游记、用户、目的地
            Page<StrategyTemplate> strategy = searchService.hightLightSearch(StrategyTemplate.INDEX_TYPE_NAME, StrategyTemplate.class, qo, "title", "subtitle", "summary");
            Page<TravelTemplate> travel = searchService.hightLightSearch(TravelTemplate.INDEX_TYPE_NAME, TravelTemplate.class, qo, "title", "summary");
            Page<UserInfoTemplate> user = searchService.hightLightSearch(UserInfoTemplate.INDEX_TYPE_NAME, UserInfoTemplate.class, qo, "nickname",  "destName");
            Page<DestinationTemplate> dest = searchService.hightLightSearch(DestinationTemplate.INDEX_TYPE_NAME, DestinationTemplate.class, qo, "name",  "info");
            //封装结果回显
            result.setUsers(user.getContent());
            result.setTravels(travel.getContent());
            result.setStrategys(strategy.getContent());
            result.setDests(dest.getContent());
            int total = 0;
            total += user.getTotalElements() + travel.getTotalElements() + strategy.getTotalElements() + dest.getTotalElements();
            result.setTotal(total);
            model.addAttribute("data", result);
        }
    }

    /**
     * 显示 前台首页
     */
    @RequestMapping("/")
    public String index(Model model) throws UnsupportedEncodingException {
        //tcs 查询五篇推荐游记
        model.addAttribute("tcs", travelCommendService.listTopCount(5));
        //scs 查询五篇推荐攻略
        model.addAttribute("scs", strategyCommendService.listTopCount(5));
        return "index/index";
    }

    /**
     * 显示 前台首页内嵌页 游记模块页面
     */
    @RequestMapping("/index/travelPage")
    public String travelPage(@ModelAttribute("qo")TravelQueryObject qo, Model model){
        qo.setPageSize(8);
        model.addAttribute("pageInfo",travelService.query(qo));
        return "index/travelPageTpl";
    }

}
