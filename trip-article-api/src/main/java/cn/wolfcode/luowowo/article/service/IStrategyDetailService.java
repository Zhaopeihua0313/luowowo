package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyContent;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IStrategyDetailService {

    /**
     * 高级查询 攻略文章
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某攻略文章
     */
    StrategyDetail get(Long id);

    /**
     * 新增或编辑 攻略文章
     */
    AjaxResult saveOrUpdate(StrategyDetail strategyDetail, String tags);

    /**
     * 获取 某攻略文章的内容
     */
    StrategyContent getContent(Long id);

    /**
     * 获取 点击量前三的文章攻略
     */
    List<StrategyDetail> listViewnumTop3(Long id);

    /**
     * 修改 攻略文章状态
     */
    AjaxResult updateState(Long id, Long state);

    /**
     * 获取 所有的攻略文章
     */
    List<StrategyDetail> selectAll();

    /**
     * 修改 攻略的统计数据
     */
    void updateStats(StrategyDetail detail);

    StrategyDetail selectDetailById(Long id);

    StrategyDetail getStrategyContent(Long strategyId);
}
