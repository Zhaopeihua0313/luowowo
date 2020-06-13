package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface ITravelCommendService {

    /**
     * 高级查询 游记推荐
     */
    public PageInfo query(QueryObject qo);

    /**
     * 新增或编辑 游记推荐
     */
    AjaxResult saveOrUpdate(TravelCommend travelCommend);

    /**
     * 获取 序号降序排序的前几个游记推荐
     */
    List<TravelCommend> listTopCount(int count);

}
