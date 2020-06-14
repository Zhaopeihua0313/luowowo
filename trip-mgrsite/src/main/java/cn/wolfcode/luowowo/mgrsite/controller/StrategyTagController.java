package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.article.service.IStrategyTagService;
import cn.wolfcode.luowowo.common.query.StrategyTagQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/strategyTag")
public class StrategyTagController {

    @Reference
    private IStrategyTagService strategyTagService;

    /**
     * 显示 后台攻略标签管理(攻略标签管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")StrategyTagQueryObject qo, Model model) {
        PageInfo pageInfo = strategyTagService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "strategyTag/list";
    }

    /**
     * 处理 新增或编辑攻略标签
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, StrategyTag tag) {
        return strategyTagService.updateById(tag);
    }

}
