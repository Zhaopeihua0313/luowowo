package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.article.service.ITravelCommendService;
import cn.wolfcode.luowowo.common.query.TravelCommendQueryObject;
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

@Controller
@RequestMapping("/travelCommend")
public class TravelCommendController {

    @Value("${file.dir}")
    private String parth;

    @Reference
    private ITravelCommendService travelCommendService;

    /**
     * 显示 后台游记推荐管理(游记推荐管理)列表页
     */
    @RequestMapping("/list")
    public String list(@ModelAttribute("qo")TravelCommendQueryObject qo, Model model) {
        PageInfo pageInfo = travelCommendService.query(qo);
        model.addAttribute("pageInfo", pageInfo);
        return "travelCommend/list";
    }

    /**
     * 处理 游记推荐封面的文件上传，编辑游记推荐中的
     */
    @RequestMapping("/coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        //直接返回上传文件的名称
        return UploadUtil.upload(pic, parth);
    }

    /**
     * 处理 新增或编辑攻略推荐操作
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public AjaxResult saveOrUpdate(MultipartFile pic, TravelCommend travelCommend){
        AjaxResult ajaxResult = travelCommendService.saveOrUpdate(travelCommend);
        return ajaxResult;
    }

}
