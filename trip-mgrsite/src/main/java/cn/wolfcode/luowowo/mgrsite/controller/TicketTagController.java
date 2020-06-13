package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.TicketTag;
import cn.wolfcode.luowowo.article.service.ITicketTagService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ticketTag")
public class TicketTagController {

    @Reference
    private ITicketTagService ticketTagService;

    /**
     * 显示 后台门票标签管理(门票标签管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")QueryObject qo, Model model) {
        PageInfo pageInfo = ticketTagService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "ticketTag/list";
    }

    /**
     * 处理 新增或编辑门票标签
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, TicketTag tag) {
        return ticketTagService.updateById(tag);
    }
}
