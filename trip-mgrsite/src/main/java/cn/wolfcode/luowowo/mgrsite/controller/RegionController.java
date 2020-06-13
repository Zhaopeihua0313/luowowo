package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IRegionService;
import cn.wolfcode.luowowo.common.query.RegionQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/region")
public class RegionController {

    @Reference
    private IRegionService regionService;
    @Reference
    private IDestinationService destinationService;

    /**
     * 显示 后台区域管理列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")RegionQueryObject qo, Model model) {

        //列表数据
        model.addAttribute("pageInfo", regionService.query(qo));
        return "region/list";
    }

    /**
     * 获取 所有目的地
     */
    @RequestMapping("/listDests")
    @ResponseBody
    public List listDests() {
        //return regionService.listDests();
        return destinationService.list();
    }

    /**
     * 获取 某区域的目的地
     */
    @RequestMapping("/listDestByRegionId")
    @ResponseBody
    public List listDestByRegionId(Long rid) {
        return  destinationService.listDestByRegionId(rid);
    }

    /**
     * 处理 编辑或者新增区域
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Region region) {
        return regionService.saveOrUpdate(region);
    }





}
