package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.article.service.IStrategyCatalogService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.IStrategyTagService;
import cn.wolfcode.luowowo.article.service.IStrategyThemeService;
import cn.wolfcode.luowowo.common.query.StrategyDetailQueryObject;
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

@Controller
@RequestMapping("/strategyDetail")
public class StrategyDetailController {

    //引入图片保存地址
    @Value("${file.dir}")
    private String dir;

    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyCatalogService strategyCatalogService;
    @Reference
    private IStrategyThemeService strategyThemeService;
    @Reference
    private IStrategyTagService strategyTagService;

    /**
     * 处理 攻略推荐封面的文件上传，编辑攻略推荐中的
     */
    @RequestMapping("/coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        //直接返回上传文件的名称
        return UploadUtil.upload(pic, dir);
    }

    /**
     * 显示 后台攻略文章管理(攻略明细管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")StrategyDetailQueryObject qo, Model model) {
        PageInfo pageInfo = strategyDetailService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "strategyDetail/list";
    }

    /**
     * 显示 攻略文章新增或编辑页面
     */
    @RequestMapping("/input")
    public String input(Long id, Model model) {

        //攻略分类
        List<StrategyCatalog> catalogs = strategyCatalogService.listAll();
        model.addAttribute("catalogs", catalogs);

        //攻略主题
        List<StrategyTheme> themes = strategyThemeService.listAll();
        model.addAttribute("themes", themes);

        if (id != null) {
            //攻略详情
            StrategyDetail strategyDetail = strategyDetailService.get(id);
            //攻略内容
            strategyDetail.setStrategyContent(strategyDetailService.getContent(id));
            model.addAttribute("entity", strategyDetail);

            //攻略标签
            String tags = strategyTagService.selectStrByStrategyId(id);
            model.addAttribute("tags", tags);
        }
        return "strategyDetail/input";
    }

    /**
     * 处理 攻略文章新增或编辑操作
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, StrategyDetail strategyDetail, String tags) {

        return strategyDetailService.saveOrUpdate(strategyDetail, tags);
    }

    /**
     * 处理 修改攻略状态
     */
    @RequestMapping("updateState")
    @ResponseBody
    public AjaxResult updateState(Long id, Long state) {
        return strategyDetailService.updateState(id, state);
    }




}
