package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.common.query.TravelQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/travel")
public class TravelController {

    @Reference
    private ITravelService travelService;

    /**
     * 显示 后台游记管理(游记管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")TravelQueryObject qo, Model model) {
        PageInfo pageInfo = travelService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "travel/list";
    }

    /**
     * 获取 攻略内容
     */
    @RequestMapping("/getTravelContent")
    @ResponseBody
    public Object getTravelContent(Long id) {
        return travelService.getContent(id);
    }

    /**
     * 处理 修改游记状态
     */
    @RequestMapping("updateState")
    @ResponseBody
    public AjaxResult updateState(Travel travel) {
        return travelService.updateState(travel);
    }

}
