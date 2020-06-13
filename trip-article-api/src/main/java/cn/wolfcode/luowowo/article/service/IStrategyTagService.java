package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IStrategyTagService {

    /**
     * 高级查询 攻略标签
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某攻略的所有标签，并且以字符串 tag1,tag2,tag3 返回
     */
    String selectStrByStrategyId(Long id);

    /**
     * 新增或编辑 攻略标签
     */
    AjaxResult updateById(StrategyTag tag);

    /**
     * 获取 某目的地的所有攻略标签
     */
    List<StrategyTag> listByDestId(Long destId);
}
