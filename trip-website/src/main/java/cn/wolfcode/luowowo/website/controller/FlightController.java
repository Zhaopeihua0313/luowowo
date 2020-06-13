package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.FlightCity;
import cn.wolfcode.luowowo.article.service.IFlightCityService;
import cn.wolfcode.luowowo.article.service.IFlightService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.website.util.FlightUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/flight")
@Controller
public class FlightController {
    @Reference
    private IFlightCityService flightCityService;

    @Reference
    private IFlightService flightServi;

    @RequestMapping("/index")
    public String index(Model model) {
        //hotFlights:热门
        model.addAttribute("hotFlights", flightCityService.listHotFlights(FlightCity.STATE_HOT));
        //initialA :以字母A开头的城市
        model.addAttribute("initialA", flightCityService.listInitial(FlightCity.NUM_ABCDE));
        //initialF : 以字母F开头的城市
        model.addAttribute("initialF", flightCityService.listInitial(FlightCity.NUM_FGHJ));
        //initialK : 以字母F开头的城市
        model.addAttribute("initialK", flightCityService.listInitial(FlightCity.NUM_KLMNP));
        //initialQ :以字母Q开头的城市
        model.addAttribute("initialQ", flightCityService.listInitial(FlightCity.NUM_QRSTW));
        //initialX:以字母X开头的城市
        model.addAttribute("initialX", flightCityService.listInitial(FlightCity.NUM_XYZ));
        return "flight/index";
    }

    /**
     * 处理 调用第三方航班接口查询
     *
     * @param orgCity 出发城市
     * @param dstCity 到达城市
     * @param depTime 航班时间
     */
    @RequestMapping("/search_api")
    @ResponseBody
    public AjaxResult apiSearch(Model model, String orgCity, String dstCity, String depTime,
                         String source) {

        //接口的数据源
        AjaxResult ajaxResult = new AjaxResult();
        String result = FlightUtil.getFlightInfo(dstCity, orgCity, depTime);
        if (result != null) {
            ajaxResult.setData(result);
        }
        return ajaxResult;

    }

    /**
     * 处理 调用自己的航班数据库查询
     *
     * @param orgCity 出发城市
     * @param dstCity 到达城市
     * @param depTime 航班时间
     */
    @RequestMapping("/search_my")
    public String mySearch(Model model, String orgCity, String dstCity, String depTime,
                         String source) {

        //自己的数据源
        model.addAttribute("flightAll", flightServi.list(orgCity, dstCity));
        return"flight/searchTpl";
    }

}
