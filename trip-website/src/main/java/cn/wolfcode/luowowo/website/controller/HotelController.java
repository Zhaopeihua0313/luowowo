package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IHotelService;
import cn.wolfcode.luowowo.article.service.IHotelTagService;
import cn.wolfcode.luowowo.article.service.IRegionService;
import cn.wolfcode.luowowo.common.query.HotelQueryObject;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/hotel")
public class HotelController {

    @Value("${hotel.hotelCity}")
    private String cities;

    @Reference
    private IHotelService hotelService;

    @Reference
    private IDestinationService destinationService;

    @Reference
    private IHotelTagService hotelTagService;

    @Reference
    private IRegionService regionService;

    /**
     * 显示 热门目的地列表页面
     */
    @RequestMapping("")
    public String index(Model model) {
        //inland 国内热门城市
        Region region = regionService.get(8L);
        Long[] ref = region.getRefIds();
        List<Destination> inland = new ArrayList<>();
        for (Long id : ref) {
            inland.add(destinationService.selectById(id));
        }
        model.addAttribute("inland",inland);
        //aisa  亚洲
        model.addAttribute("aisa",destinationService.listDestByRegionId(1L));
        //southeastAsia  东南亚
        model.addAttribute("southeastAsia",destinationService.listDestByRegionId(3L));
        //southwestAsia   南亚西亚
        model.addAttribute("southwestAsia",destinationService.listDestByRegionId(4L));
        //europeAmerica  欧洲美洲
        model.addAttribute("europeAmerica",destinationService.listDestByRegionId(5L));
        //australiaAfrica  澳洲非洲
        model.addAttribute("australiaAfrica",destinationService.listDestByRegionId(6L));
        //hotelTags 酒店所有分类
        model.addAttribute("hotelTags",hotelTagService.list());
        //特价酒店---城市指定
        String[] ids = cities.split(",");
        model.addAttribute("hotelCity",destinationService.listByIdInJiangQi(ids));
        return "hotel/hotel";
    }

    /**
     * 根据标签查询结果---主题酒店
     */
    @RequestMapping("/listByTag")
    public String listByTag(Long tagId,Model model) {
        model.addAttribute("list",hotelService.listByTagId(tagId));
        return "hotel/hotelTpl";
    }

    /**
     * 根据城市分类---特价酒店
     */
    @RequestMapping("/listByCity")
    public String listByCity(Long destId,Model model) {
        model.addAttribute("hotelScore",hotelService.listByDestId(destId));
        return "hotel/hotelTpl1";
    }

    /**
     * 根据关键字查询
     */
    @RequestMapping("/query")
    public String listByCity(@ModelAttribute("qo")HotelQueryObject qo, Model model) {
        //点击目的地查询
        model.addAttribute("tags",hotelTagService.list());
        model.addAttribute("pageInfo",hotelService.query(qo));
        if (qo.getDestId()!=null&& qo.getDestId()>0){
            Long destId = qo.getDestId();
            Destination destination =  destinationService.selectById(destId);
            model.addAttribute("dest",destination);
            model.addAttribute("son",destinationService.listDestsByParentId(destId));
            model.addAttribute("brothers",destinationService.listBrothers(destId));
            return "hotel/dingjiudian2";
            //关键字查询
        }else{
            return "hotel/dingjiudian1";
        }
    }

}


































