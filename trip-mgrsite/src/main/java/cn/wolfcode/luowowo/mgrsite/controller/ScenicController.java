package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Scenic;
import cn.wolfcode.luowowo.article.domain.ScenicCatalog;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IScenicCatalogService;
import cn.wolfcode.luowowo.article.service.IScenicContentService;
import cn.wolfcode.luowowo.article.service.IScenicService;
import cn.wolfcode.luowowo.common.query.ScenicQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.mgrsite.util.UploadUtil;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

@RequestMapping("/scenic")
@Controller
public class ScenicController {

    //引入图片保存地址
    @Value("${file.dir}")
    private String dir;

    @Reference
    private IScenicService scenicService;

    @Reference
    private IScenicCatalogService scenicCatalogService;

    @Reference
    private IScenicContentService scenicContentService;

    @Reference
    private IDestinationService destinationService;

    /**
     * 处理 图片文件上传
     */
    @RequestMapping("/coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        //直接返回上传文件的名称
        return UploadUtil.upload(pic, dir);
    }

    /**
     * 显示 后台景点管理列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")ScenicQueryObject qo, Model model) {
        PageInfo pageInfo = scenicService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "scenic/list";
    }

    /**
     * 显示 景点新增或编辑页面
     */
    @RequestMapping("/input")
    public String input(Long id, Model model) {
        model.addAttribute("dests", destinationService.list());
        //景点分类
        List<ScenicCatalog> catalogs = scenicCatalogService.listAll();
        model.addAttribute("catalogs", catalogs);
        //父景点
        model.addAttribute("scenics", scenicService.listAll());
        if (id != null) {
            //景点详情
            Scenic scenic = scenicService.get(id);
            //景点内容
            scenic.setContent(scenicContentService.get(id));
            model.addAttribute("entity", scenic);
        }
        return "scenic/input";
    }

    /**
     * 处理 景点新增或编辑操作
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, Scenic scenic) {
        return scenicService.saveOrUpdate(scenic);
    }

}
