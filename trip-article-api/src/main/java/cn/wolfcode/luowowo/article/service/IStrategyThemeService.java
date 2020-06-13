package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IStrategyThemeService {

    /**
     * 高级查询 攻略主题
     */
    public PageInfo query(QueryObject qo);

    /**
     * 查询 所有攻略主题
     */
    List<StrategyTheme> listAll();

    /**
     * 编辑或新增 攻略主题
     */
    AjaxResult updateById(StrategyTheme theme);
}
