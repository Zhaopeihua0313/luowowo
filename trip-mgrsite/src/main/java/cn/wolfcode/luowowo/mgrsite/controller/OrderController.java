package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.OrderDetail;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IOrderDetailService;
import cn.wolfcode.luowowo.article.service.IScenicService;
import cn.wolfcode.luowowo.common.query.OrderDetailQueryObject;
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

/**
 * 订单管理控制器
 */
@Controller
@RequestMapping("orderDetail")
public class OrderController {

    //引入图片保存地址
    @Value("${file.dir}")
    private String dir;
    @Reference
    private IScenicService scenicService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IOrderDetailService orderDetailService;

    /**
     * 处理 修改订单状态 带有用户的积分增加
     */
    @RequestMapping("updateStatus")
    @ResponseBody
    public AjaxResult updateState(OrderDetail orderDetail) {
        return orderDetailService.updateStatus(orderDetail);
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
     * 显示 后台订单管理列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")OrderDetailQueryObject qo, Model model) {
        PageInfo pageInfo = orderDetailService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "orderDetail/list";
    }

    /**
     * 显示 订单新增或编辑页面
     */
    @RequestMapping("/input")
    public String input(Long id, Model model) {

        if (id != null) {
            //订单详情
            OrderDetail orderDetail = orderDetailService.get(id);
            model.addAttribute("entity", orderDetail);
        }
        return "orderDetail/input";
    }

    /**
     * 处理 订单新增或编辑操作
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(Model model, OrderDetail orderDetail) {
        return orderDetailService.saveOrUpdate(orderDetail);
    }
    
}
