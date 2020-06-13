package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Scenic;
import cn.wolfcode.luowowo.common.query.ScenicQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IScenicService {

    /**
     * 高级查询 连表用户,景点分类
     */
    public PageInfo query(ScenicQueryObject qo);

    Scenic getByDeatId(Long destId);

    List<Scenic> listReplyTOP5(Long destId);

    List<Scenic> listFavorTOP10(Long destId);

    List<Scenic> listByParentId(Long scenicId);

    List<Scenic> listAll();

    AjaxResult saveOrUpdate(Scenic scenic);

    /**
     * 获取 没有父景点的几个景点
     */
    List<Scenic> listNoParentCount(int count);

    Scenic get(Long scenicId);

    void updateStats(Scenic scenic);

    /**
     * 根据景点id 获取内容
     * @param scenicId
     * @return
     */
    Scenic getScenicContent(Long scenicId);
}
