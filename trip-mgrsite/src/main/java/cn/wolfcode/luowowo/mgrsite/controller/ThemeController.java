package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Theme;
import cn.wolfcode.luowowo.article.service.IThemeCatalogService;
import cn.wolfcode.luowowo.article.service.IThemeService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.mgrsite.util.UploadUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/theme")
public class ThemeController {

    @Value("${file.dir}")
    private String parth;
    @Reference
    private IThemeService themeService;
    @Reference
    private IThemeCatalogService themeCatalogService;

    @RequestMapping("list")
    public String list(Model model,@ModelAttribute("qo") QueryObject qo){
        model.addAttribute("pageInfo",themeService.query(qo));
        model.addAttribute("catalogs",themeCatalogService.list());
        return "theme/list";
    }

    /**
     * 处理 目的地主题封面的文件上传，编辑主题推荐中的
     */
    @RequestMapping("/coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        //直接返回上传文件的名称
        return UploadUtil.upload(pic, parth);
    }

    /**
     * 处理 新增或编辑目的地主题操作
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(MultipartFile pic, Theme theme){
        AjaxResult ajaxResult = themeService.saveOrUpdate(theme);
        return ajaxResult;
    }
}

