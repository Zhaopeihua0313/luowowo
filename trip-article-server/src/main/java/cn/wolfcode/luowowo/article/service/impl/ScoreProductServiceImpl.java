package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ScoreProduct;
import cn.wolfcode.luowowo.article.mapper.ScoreProductMapper;
import cn.wolfcode.luowowo.article.service.IScoreProductService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ScoreProductServiceImpl implements IScoreProductService {

    @Autowired
    private ScoreProductMapper scoreProductMapper;

    /**
     * 高级查询 ,积分商品
     */
    public PageInfo query(QueryObject qo) {
        return null;
    }

    /**
     * 获取 某积分商品
     */
    public ScoreProduct get(Long id) {
        return null;
    }

    /**
     * 新增或修改 积分商品
     */
    public AjaxResult saveOrUpdate(ScoreProduct scoreProduct) {
        return null;
    }

    /**
     * 获取 所有的积分商品
     */
    public List<ScoreProduct> listAll() {
        return scoreProductMapper.selectAll();
    }

    /**
     * 获取 某用户的所有积分商品
     */
    public List<ScoreProduct> listByUserId(Long userId) {
        return scoreProductMapper.listByUserId(userId);
    }

}
