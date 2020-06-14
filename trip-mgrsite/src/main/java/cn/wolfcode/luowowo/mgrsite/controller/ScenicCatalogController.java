package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.ScenicCatalog;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IScenicCatalogService;
import cn.wolfcode.luowowo.common.query.ScenicCatalogQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

/**
 * 景点分类
 */
@RequestMapping("scenicCatalog")
@Controller
public class ScenicCatalogController {

    @Reference
    private IScenicCatalogService scenicCatalogService;

    @Reference
    private IDestinationService destinationService;

    /**
     * 显示 后台景点分类管理(景点分类管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")ScenicCatalogQueryObject qo, Model model) {
        PageInfo pageInfo = scenicCatalogService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("dests", destinationService.list());
        return "scenicCatalog/list";
    }

    /**
     * 获取 所有目的地
     */
    @RequestMapping("/listDests")
    @ResponseBody
    public List listDests() {
        return destinationService.list();
    }

    /**
     * 编辑或新增 景点分类
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, ScenicCatalog catalog) {
        return scenicCatalogService.saveOrUpdate(catalog);
    }

}
