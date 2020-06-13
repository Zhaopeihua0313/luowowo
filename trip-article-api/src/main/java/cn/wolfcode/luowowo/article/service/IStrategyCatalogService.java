package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IStrategyCatalogService {

    /**
     * 高级查询 攻略分类
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 所有攻略分类
     */
    List<StrategyCatalog> listAll();

    /**
     * 新增或编辑 某攻略分类
     */
    AjaxResult updateById(StrategyCatalog catalog);

    /**
     * 获取 某目的地的攻略分类
     */
    List<StrategyCatalog> listByDestId(Long id);

}
