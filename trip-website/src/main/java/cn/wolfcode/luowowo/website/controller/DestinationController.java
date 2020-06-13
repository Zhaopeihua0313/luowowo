package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.domain.StrategyContent;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.common.query.DestQueryObject;
import cn.wolfcode.luowowo.common.query.DestinationQueryObject;
import cn.wolfcode.luowowo.common.query.TravelQueryObject;
import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.service.IDestinationSearchService;
import cn.wolfcode.luowowo.search.service.IStrategySearchService;
import cn.wolfcode.luowowo.search.service.IThemeSearchService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/destination")
public class DestinationController {

    @Reference
    private IRegionService regionService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IStrategyCatalogService catalogService;
    @Reference
    private IStrategyDetailService detailService;
    @Reference
    private ITravelService travelService;
    @Reference
    private IStrategySearchService strategySearchService;
    @Reference
    private IDestinationSearchService destinationSearchService;
    @Reference
    private IThemeSearchService themeSearchService;
    @Reference
    private IThemeService themeService;

    /**
     * 显示 热门目的地列表页面
     */
    @RequestMapping("")
    public String index(Model model) {
        //hotRegions 热门区域
        model.addAttribute("hotRegions", regionService.listHotRegions());
        //列出旅游月份
        model.addAttribute("months",destinationSearchService.listCondition(SearchQueryObject.CONDITION_TravelTime));
        //目的地主题分类
        model.addAttribute("catalogs",themeSearchService.listCondition(SearchQueryObject.CONDITION_THEME));
        //列出所有区域
        model.addAttribute("regoins",regionService.listAll());
        //亚洲 港澳台目的地
        model.addAttribute("desta",destinationService.listDestByRegionId(1L));
        //东南亚目的地
        model.addAttribute("destb",destinationService.listDestByRegionId(3L));
        //南亚 西亚目的地
        model.addAttribute("destc",destinationService.listDestByRegionId(4L));
        //欧洲 美洲目的地
        model.addAttribute("destd",destinationService.listDestByRegionId(5L));
        //澳洲 非洲目的地
        model.addAttribute("deste",destinationService.listDestByRegionId(6L));

        return "destination/index";
    }

    /**
     * 获取 某个区域的热门目的地
     */
    @RequestMapping("/listHotDestByRegionId")
    public String listHotDestByRegionId(@ModelAttribute("regionId")Long regionId, Model model) {
        //获取某个区域的热门目的地
        List<Destination> list = regionService.listHotDestByRegionId(regionId);

        //构建左右模块
        List<Destination> leftDests = list.subList(0, list.size() / 2);
        List<Destination> rightDests = list.subList(list.size() / 2, list.size());
        model.addAttribute("leftDests", leftDests);
        model.addAttribute("rightDests", rightDests);

        return "destination/hotdestTpl";
    }

    /**
     * 显示 某目的地概览页
     */
    @RequestMapping("/guide")
    public String guide(Model model,@ModelAttribute("id")Long id) {
        //toasts1 吐司
        model.addAttribute("toasts1", destinationService.getToastsAndChilds(id));

        //dest 目的地
        model.addAttribute("dest", destinationService.selectById(id));

        //catalogs 该目的地下的分类
        model.addAttribute("catalogs", catalogService.listByDestId(id));
        //点击量前三的文章
        model.addAttribute("strategyDetails", detailService.listViewnumTop3(id));

        return "destination/guide";
    }
    /**
     * 显示 某目的地概览页 里的 概览模块页面
     */
    @RequestMapping("/survey")
    public String survey(Model model, @ModelAttribute("qo")DestinationQueryObject qo) {
        //该目的地下的所有分类，每个分类须有文章 catalog.getDetails()
        List<StrategyCatalog> catalogs = catalogService.listByDestId(qo.getDestId());
        model.addAttribute("catalogs", catalogs);
        for (StrategyCatalog catalog : catalogs) {
            if (catalog.getId().equals(qo.getCatalogId())) {
                //页面当前选中的分类
                model.addAttribute("catalog", catalog);

                //从当前分类中选出第一篇文章，并且获取文章内容，然后渲染去页面
                StrategyDetail detail = catalog.getDetails().get(0);
                StrategyContent content = detailService.getContent(detail.getId());
                detail.setStrategyContent(content);
                model.addAttribute("detail", detail);
                break;
            }
        }
        return "destination/surveyTpl";
    }
    /**
     * 显示 某目的地概览页 里的 游记模块页面
     */
    @RequestMapping("/travels")
    public String travels(TravelQueryObject qo, Model model) {
        //pageInfo 分页对象
        model.addAttribute("pageInfo", travelService.query(qo));
        return "destination/travelTpl";
    }

    /**
     * 显示 概览详情页
     */
    @RequestMapping("/surveyPage")
    public String surveyPage(Model model, @ModelAttribute("qo")DestinationQueryObject qo) {
        List<Destination> toasts = destinationService.getToasts(qo.getDestId());
        model.addAttribute("toasts", toasts);
        model.addAttribute("dest", toasts.remove(toasts.size()-1 ));
        return "destination/survey";
    }

    /**
     * 显示 当季推荐内嵌页
     */
    @RequestMapping("/monthDest")
    public String monthDest(Model model, @ModelAttribute("timeId")Long timeId) {
        //根据旅游月份查询目的地
        List<Destination> list = destinationService.listDestByTimeId(timeId);
        model.addAttribute("dests",list.subList(0,list.size()/2) );
        model.addAttribute("upDests",list.subList(list.size()/2,list.size()) );
        return "destination/destMonthTpl";
    }

    /**
     * 显示 主题精选内嵌页
     */
    @RequestMapping("/theme")
    public String listTheme(Model model, @ModelAttribute("catalogId")Long catalogId) {
        //themes 主题精选
        model.addAttribute("themes",themeService.listThemeByCatalogId(catalogId));
        return "destination/destThemeTpl";
    }

    /**
     * 根据条件搜索目的地
     */
    @RequestMapping("/destFilter")
    public String destFilter(Model model) {
        //列出旅游月份
        model.addAttribute("months",destinationSearchService.listCondition(SearchQueryObject.CONDITION_TravelTime));
        //列出节假日
        model.addAttribute("holidays",themeService.listThemeByCatalogId(4L));
        //全年适宜
        model.addAttribute("allYear",themeService.listThemeByCatalogId(1L));
        //季节
        model.addAttribute("seasons",themeService.listThemeByCatalogId(2L));
        //出行方式
        model.addAttribute("ways",themeService.listThemeByCatalogId(3L));
        return "destination/destFilter";
    }

    /**
     * 显示 搜索目的地结果的内嵌页
     */
    @RequestMapping("/searchPage")
    public String searchPage(@ModelAttribute("qo") DestQueryObject qo, Model model) {
        model.addAttribute("pageInfo",destinationService.queryForResult(qo));
        return "destination/destinationSearchPageTpl";
    }

    /**
     * 跳转到目的地添加页面
     */
    @RequestMapping("/addDest")
    public String addDest() {
        return "destination/addDest";
    }

    /**
     * ba保存目的地
     */
    @RequestMapping("/save")
    public String save(Destination dest) {
        destinationService.save(dest);
        return "redirect:/";
    }
}


































