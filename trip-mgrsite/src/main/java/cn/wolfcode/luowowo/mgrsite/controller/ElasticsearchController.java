package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Theme;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.IThemeService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.search.service.*;
import cn.wolfcode.luowowo.search.template.*;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * ES 控制器，用来做 ES 相关操作
 */
@Controller
@RequestMapping("/elasticsearch")
public class ElasticsearchController {
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IUserInfoService userInfoService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private ITravelService travelService;
    @Reference
    private IThemeService themeService;
    @Reference
    private IStrategySearchService strategyTemplateService;
    @Reference
    private ITravelSearchService travelTemplateService;
    @Reference
    private IUserInfoSearchService userInfoTemplateService;
    @Reference
    private IDestinationSearchService destinationTemplateService;
    @Reference
    private IThemeSearchService themeTemplateService;

    /**
     * 手动初始化 ES 数据，从 mysql 里取的数据
     */
    @RequestMapping("/init")
    @ResponseBody
    public String init() {

        //攻略 数据，攻略目的地--目的地、攻略主题--攻略主题、
        List<StrategyDetail> details = strategyDetailService.selectAll();
        for (StrategyDetail detail : details) {
            Long destId = detail.getDest().getId();             //目的地ID

            StrategyTemplate template = new StrategyTemplate();

            template.setId(detail.getId());
            template.setTitle(detail.getTitle());
            template.setSubTitle(detail.getSubTitle());
            template.setDestId(destId);
            template.setDestName(detail.getDest().getName());   //目的地名称
            template.setThemeId(detail.getTheme().getId());     //主题ID
            template.setThemeName(detail.getTheme().getName()); //主题名称
            template.setSummary(detail.getSummary());
            template.setCreateTime(detail.getCreateTime());
            template.setViewnum(detail.getViewnum());
            template.setFavornum(detail.getFavornum());
            template.setReplynum(detail.getReplynum());
            template.setThumbsupnum(detail.getThumbsupnum());
            template.setCoverUrl(detail.getCoverUrl());

            //国家
            Destination dest = destinationService.getCountry(destId);
            template.setCountryId(dest.getId());
            template.setCountryName(dest.getName());

            //省份
            dest = destinationService.getProvince(destId);
            if (dest != null) {
                template.setProvinceId(dest.getId());
                template.setProvinceName(dest.getName());
            }

            strategyTemplateService.save(template);
        }

        //=========================================

        //游记数据，游记作者--用户、游记目的地--目的地、
        List<Travel> travels = travelService.list();
        for (Travel travel : travels) {
            TravelTemplate template = new TravelTemplate();
            template.setId(travel.getId());
            template.setAuthorId(travel.getAuthor().getId());
            template.setAuthorName(travel.getAuthor().getNickname());
            template.setDestId(travel.getDest().getId());
            template.setDestName(travel.getDest().getName());
            template.setTitle(travel.getTitle());
            template.setCreateTime(travel.getCreateTime());
            template.setCoverUrl(travel.getCoverUrl());
            template.setSummary(travel.getSummary());
            template.setReplynum(travel.getReplynum());
            template.setViewnum(travel.getViewnum());

            travelTemplateService.save(template);
        }

        //=========================================

        //用户数据
        List<UserInfo> users = userInfoService.list();
        for (UserInfo user : users) {
            UserInfoTemplate template = new UserInfoTemplate();
            template.setId(user.getId());
            template.setNickname(user.getNickname());
            template.setDestName(user.getCity());
            template.setInfo(user.getInfo());
            template.setHeadUrl(user.getHeadImgUrl());
            template.setLevel(user.getLevel());

            userInfoTemplateService.save(template);
        }

        //=========================================

        //主题数据
        List<Theme> themes = themeService.list();
        for (Theme theme : themes) {
            ThemeTemplate template = new ThemeTemplate();
            template.setId(theme.getId());
            template.setName(theme.getName());
            template.setCoverUrl(theme.getCoverUrl());
            template.setCatalogId(theme.getThemecatalog().getId());
            template.setCatalog(theme.getThemecatalog().getName());
            themeTemplateService.save(template);
        }


        //=========================================

        //目的地数据
        List<Destination> dests = destinationService.list();
        for (Destination dest : dests) {
            DestinationTemplate template = new DestinationTemplate();
            template.setId(dest.getId());
            template.setName(dest.getName());
            template.setCoverUrl(dest.getCoverUrl());
            template.setInfo(dest.getInfo());
            if(dest.getTimeName() != null){
                template.setTimeId(dest.getTimeName().getId());
                template.setTimeName(dest.getTimeName().getName());
            }
            destinationTemplateService.save(template);
        }


        return "~~~~~ ES 数据初始化完成 ~~~~~~";
    }
}
