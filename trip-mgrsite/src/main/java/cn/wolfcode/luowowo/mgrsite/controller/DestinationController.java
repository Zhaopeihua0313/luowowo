package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.common.query.DestinationQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/destination")
public class DestinationController {

    @Reference
    private IDestinationService destinationService;

    /**
     * 显示 后台目的地管理列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")DestinationQueryObject qo, Model model) {
        //列表数据
        model.addAttribute("pageInfo", destinationService.query(qo));
        //吐司
        model.addAttribute("toasts", destinationService.getToasts(qo.getParentId()));
        return "destination/list";
    }

    /**
     * 处理 修改热门状态
     */
    @RequestMapping("/changeHotState")
    @ResponseBody
    public AjaxResult changeHotState(Long id, Long hot) {
        return destinationService.changeHotState(id, hot);
    }

    /**
     * 处理 编辑简介
     */
    @RequestMapping("/setInfo")
    @ResponseBody
    public AjaxResult setInfo(Long id, String info) {
        return destinationService.setInfo(id, info);
    }

}
