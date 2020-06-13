package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.article.service.IStrategyThemeService;
import cn.wolfcode.luowowo.common.query.StrategyThemeQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/strategyTheme")
public class StrategyThemeController {

    @Reference
    private IStrategyThemeService strategyThemeService;

    /**
     * 显示 后台攻略主题管理(攻略主题管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")StrategyThemeQueryObject qo, Model model) {
        PageInfo pageInfo = strategyThemeService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "strategyTheme/list";
    }

    /**
     * 处理 编辑或新增攻略主题
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, StrategyTheme theme) {
        return strategyThemeService.updateById(theme);
    }

}
