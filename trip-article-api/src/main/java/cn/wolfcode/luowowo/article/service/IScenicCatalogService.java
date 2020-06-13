package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.ScenicCatalog;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IScenicCatalogService {

    /**
     * 高级查询
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某目的地的景点分类
     */
    List<ScenicCatalog> listByDestId(Long destId);

    /**
     * 操作 新增或编辑景点分类
     */
    AjaxResult saveOrUpdate(ScenicCatalog catalog);

    /**
     * 获取 所有景点分类
     */
    List<ScenicCatalog> listAll();

    /**
     * 获取 某景点的所有分类
     */
    List<ScenicCatalog> listByScenicId(Long scenicId);

}
