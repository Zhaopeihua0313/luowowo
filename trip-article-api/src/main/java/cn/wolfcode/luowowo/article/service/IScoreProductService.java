package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.ScoreProduct;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IScoreProductService {

    /**
     * 高级查询 ,积分商品
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某积分商品
     */
    ScoreProduct get(Long id);

    /**
     * 新增或修改 积分商品
     */
    AjaxResult saveOrUpdate(ScoreProduct scoreProduct);

    /**
     * 获取 所有的积分商品
     */
    List<ScoreProduct> listAll();

    /**
     * 获取 某用户的所有积分商品
     */
    List<ScoreProduct> listByUserId(Long userId);

}
