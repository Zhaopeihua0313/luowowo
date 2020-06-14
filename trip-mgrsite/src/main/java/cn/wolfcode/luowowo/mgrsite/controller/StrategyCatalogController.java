package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IStrategyCatalogService;
import cn.wolfcode.luowowo.common.query.StrategyCatalogQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
@RequestMapping("/strategyCatalog")
public class StrategyCatalogController {

    @Reference
    private IStrategyCatalogService strategyCatalogService;

    @Reference
    private IDestinationService destinationService;

    /**
     * 显示 后台攻略分类管理(攻略分类管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")StrategyCatalogQueryObject qo, Model model) {
        PageInfo pageInfo = strategyCatalogService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("dests", destinationService.list());
        return "strategyCatalog/list";
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
     * 编辑或新增 攻略分类
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, StrategyCatalog catalog) {
        return strategyCatalogService.updateById(catalog);
    }

}
