package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IStrategyCommendService {

    /**
     * 高级查询 攻略推荐
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 排序降序前五的攻略推荐
     */
    List<StrategyCommend> listTopCount(int count);

    /**
     * 新增或编辑 攻略推荐
     */
    AjaxResult saveOrUpdate(StrategyCommend strategyCommend);

}
