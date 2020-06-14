package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Ticket;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.common.query.TicketQueryObject;
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

/**
 * 门票
 */
@Controller
@RequestMapping("ticket")
public class TicketController {

    //引入图片保存地址
    @Value("${file.dir}")
    private String dir;

    @Reference
    private IScenicService scenicService;

    @Reference
    private IDestinationService destinationService;

    @Reference
    private ITicketService ticketService;

    @Reference
    private ITicketContentService ticketContentService;

    @Reference
    private ITicketTagService ticketTagService;

    @Reference
    private IScenicCatalogService scenicCatalogService;

    @Reference
    private IScenicContentService scenicContentService;

    /**
     * 获取 所有门票标签
     */
    @RequestMapping("/listTags")
    @ResponseBody
    public List listTags() {
        return ticketTagService.listAll();
    }

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
     * 显示 后台门票管理列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")TicketQueryObject qo, Model model) {
        PageInfo pageInfo = ticketService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "ticket/list";
    }

    /**
     * 显示 门票新增或编辑页面
     */
    @RequestMapping("/input")
    public String input(Long id, Model model) {
        //景点
        model.addAttribute("scenics", scenicService.listAll());
        if (id != null) {
            //门票详情
            Ticket ticket = ticketService.get(id);
            //门票内容
            ticket.setContent(ticketContentService.get(id));
            //门票标签
            ticket.setTagIds(ticketTagService.selectIdsByTicketId(id));
            model.addAttribute("entity", ticket);
        }
        return "ticket/input";
    }

    /**
     * 处理 门票新增或编辑操作
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, Ticket ticket) {
        return ticketService.saveOrUpdate(ticket);
    }
    
}
